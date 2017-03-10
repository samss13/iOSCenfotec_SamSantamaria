//
//  DogsDetailTableViewController.m
//  Tarea4
//
//  Created by SYSCO on 3/2/17.
//  Copyright © 2017 SYSCO. All rights reserved.
//

#import "DogsDetailTableViewController.h"
#import "Dog.h"

@interface DogsDetailTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactLabel;
@property (weak, nonatomic) IBOutlet UIImageView *dogImageView;

@end

@implementation DogsDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCustomCell];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void)setupCustomCell{
    self.nameLabel.text = self.dog.name;
    self.ageLabel.text = [NSString stringWithFormat:@"%@", self.dog.age];
    self.locationLabel.text = self.dog.location;
    self.colorLabel.text = self.dog.color;
    self.contactLabel.text = self.dog.contactInformation;
    self.dogImageView.image = [UIImage imageNamed:self.dog.image];
    
    self.dogImageView.clipsToBounds = YES;
    self.dogImageView.layer.cornerRadius = 10.0f;
}

@end
