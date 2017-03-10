//
//  DogsViewController.m
//  Tarea4
//
//  Created by SYSCO on 2/28/17.
//  Copyright © 2017 SYSCO. All rights reserved.
//

#import "DogsViewController.h"
#import "DogsTableViewCell.h"
#import "Dog.h"
#import "DogsDetailTableViewController.h"
#import "RealmManager.h"

@interface DogsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) RLMResults *dogsArray;
@end

@implementation DogsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCustomCell];
    self.dogsArray = [RealmManager getAllDogs];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registerCustomCell{
    UINib *nib = [UINib nibWithNibName:@"DogsTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"DogsTableViewCell"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dogsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DogsTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"DogsTableViewCell"];
    
    Dog *dog = self.dogsArray[indexPath.row];
    
    [cell setupCustomCell:dog];

    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background"]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:TRUE];
    DogsDetailTableViewController *dogsDetailTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DogsDetailTableViewController"];
    
    Dog *dog = self.dogsArray[indexPath.row];
    dogsDetailTableViewController.dog = dog;
    
    [self.navigationController pushViewController:dogsDetailTableViewController animated:TRUE];
}

@end
