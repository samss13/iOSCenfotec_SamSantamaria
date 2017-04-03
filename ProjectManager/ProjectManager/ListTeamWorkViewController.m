//
//  ListTeamWorkViewController.m
//  ProjectManager
//
//  Created by Sam Santamaria on 4/2/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import <Realm/Realm.h>
#import "RealmManager.h"
#import "ListTeamWorkViewController.h"
#import "ListTeamWorkTableViewCell.h"
#import "UITableView+RegisterCustomCell.h"
#import "UITableViewCell+GetClassName.h"
#import "CreateTeamWorkTableViewController.h"
#import "TeamWork.h"

@interface ListTeamWorkViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) RLMResults *teamsWorkArray;
@end

@implementation ListTeamWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addProjectButton];
    [self.tableView registerCustomCellWithName:[ListTeamWorkTableViewCell getClassName]];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    self.teamsWorkArray = [RealmManager getAllTeamsWork];
    self.title = @"Listado grupo trabajo";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)addProjectButton{
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addProjectAction)];
    self.navigationItem.rightBarButtonItem = addButton;
}

-(void)addProjectAction{
    CreateTeamWorkTableViewController *createTeamWorkTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateTeamWorkTableViewController"];
    createTeamWorkTableViewController.teamWorkSelected = nil;
    [self.navigationController pushViewController:createTeamWorkTableViewController animated:true];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.teamsWorkArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListTeamWorkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ListTeamWorkTableViewCell getClassName]];
    
    TeamWork *currentTeamWork = self.teamsWorkArray[indexPath.row];
    
    [cell setupCustomCellWithTeamWork:currentTeamWork];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [RealmManager deleteRealmObject:self.teamsWorkArray[indexPath.row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CreateTeamWorkTableViewController *createTeamWorkTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateTeamWorkTableViewController"];
    
    TeamWork *teamWorkSelected = self.teamsWorkArray[indexPath.row];
    createTeamWorkTableViewController.teamWorkSelected = teamWorkSelected;
    
    [self.navigationController pushViewController:createTeamWorkTableViewController animated:true];
}


@end
