//
//  ListProjectsViewController.m
//  ProjectManager
//
//  Created by Sam Santamaria on 3/25/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import "ListProjectsViewController.h"
#import "ListProjectsCustomTableViewCell.h"
#import "UITableView+RegisterCustomCell.h"
#import "UITableViewCell+GetClassName.h"
#import "CreateProjectTableViewController.h"
#import <Realm/Realm.h>
#import "RealmManager.h"
#import "Proyecto.h"


@interface ListProjectsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) RLMResults *projectsArray;
@end

@implementation ListProjectsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addProjectButton];
    [self.tableView registerCustomCellWithName:[ListProjectsCustomTableViewCell getClassName]];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    self.projectsArray = [RealmManager getAllProjects];
    self.title = @"Listado proyectos";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)addProjectButton{
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addProjectAction)];
    self.navigationItem.rightBarButtonItem = addButton;
}

-(void)addProjectAction{
    CreateProjectTableViewController *createProjectTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateProjectTableViewController"];
    createProjectTableViewController.proyectoSelected = nil;
    [self.navigationController pushViewController:createProjectTableViewController animated:true];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.projectsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListProjectsCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ListProjectsCustomTableViewCell getClassName]];
    
    Proyecto *currentProject = self.projectsArray[indexPath.row];
    
    [cell setupCustomCellWithProject:currentProject];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [RealmManager deleteRealmObject:self.projectsArray[indexPath.row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CreateProjectTableViewController *createProjectTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CreateProjectTableViewController"];
    
    Proyecto *proyectoSelected = self.projectsArray[indexPath.row];
    createProjectTableViewController.proyectoSelected = proyectoSelected;
    
    [self.navigationController pushViewController:createProjectTableViewController animated:true];
}

@end
