//
//  CreateTeamWorkTableViewController.m
//  ProjectManager
//
//  Created by Sam Santamaria on 4/2/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import "CreateTeamWorkTableViewController.h"
#import "RealmManager.h"

@interface CreateTeamWorkTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTeamWorkTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTeamWorkTextField;
@property (weak, nonatomic) IBOutlet UITextView *teamTextField;

@end

@implementation CreateTeamWorkTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDataToModify];
    [self saveProjectButton];
    self.navigationItem.backBarButtonItem.title = @"Back";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)loadDataToModify{
    if (self.teamWorkSelected != nil) {
        
        self.nameTeamWorkTextField.text = self.teamWorkSelected.name;
        self.descriptionTeamWorkTextField.text = self.teamWorkSelected.descripcionTeamWork;
        self.teamTextField.text = self.teamWorkSelected.team;
    }
}

-(void)saveProjectButton{
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveTeamWorkAction)];
    self.navigationItem.rightBarButtonItem = addButton;
}

-(void)saveTeamWorkAction{
    if (self.teamWorkSelected == nil) {
        [RealmManager createTeamWorkWithName:self.nameTeamWorkTextField.text description:self.descriptionTeamWorkTextField.text team:self.teamTextField.text];
        [self.navigationController popViewControllerAnimated:true];
    }else{
        [RealmManager modifyTeamWorkWithName:self.nameTeamWorkTextField.text description:self.descriptionTeamWorkTextField.text team:self.teamTextField.text teamWork:self.teamWorkSelected];
        [self.navigationController popViewControllerAnimated:true];
    }
}

@end
