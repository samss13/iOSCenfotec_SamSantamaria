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

@interface DogsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dogsArray;
@end

@implementation DogsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCustomCell];
    [self loadDogsArray];
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

-(void)loadDogsArray{
    Dog *hercules = [[Dog alloc] initWithName:@"Hercules" image:@"Hercules" color:@"Black" location:@"San Jose" age:[NSNumber numberWithFloat:3] contactInformation:@"Sam Santamaria"];
    Dog *boby = [[Dog alloc] initWithName:@"Boby" image:@"Boby" color:@"Brown" location:@"Heredia" age:[NSNumber numberWithFloat:5] contactInformation:@"Hector Rodriguez"];
    Dog *toby = [[Dog alloc] initWithName:@"Toby" image:@"Toby" color:@"Beige" location:@"Alajuela" age:[NSNumber numberWithFloat:3] contactInformation:@"Carlos Duarte"];
    Dog *zeus = [[Dog alloc] initWithName:@"Zeus" image:@"Zeus" color:@"Beige" location:@"Cartago" age:[NSNumber numberWithFloat:4] contactInformation:@"Daniel Hidalgo"];
    Dog *duke = [[Dog alloc] initWithName:@"Duke" image:@"Duke" color:@"Black" location:@"Escazu" age:[NSNumber numberWithFloat:3] contactInformation:@"Andres Lopez"];
    Dog *milu = [[Dog alloc] initWithName:@"Milu" image:@"Milu" color:@"White" location:@"Sabana" age:[NSNumber numberWithFloat:2] contactInformation:@"Paola Saenz"];
    Dog *hachi = [[Dog alloc] initWithName:@"Hachi" image:@"Hachi" color:@"Brown" location:@"Tibas" age:[NSNumber numberWithFloat:3] contactInformation:@"Sofia Herrera"];
    Dog *beethoven = [[Dog alloc] initWithName:@"Beethoven" image:@"Beethoven" color:@"Brown" location:@"Orotina" age:[NSNumber numberWithFloat:4] contactInformation:@"Laura Salas"];
    Dog *marley = [[Dog alloc] initWithName:@"Marley" image:@"Marley" color:@"Beige" location:@"Desamparados" age:[NSNumber numberWithFloat:3] contactInformation:@"Luis Guzman"];
    Dog *lassie = [[Dog alloc] initWithName:@"Lassie" image:@"Lassie" color:@"Brown" location:@"Uruca" age:[NSNumber numberWithFloat:4] contactInformation:@"Virginia Perez"];
    
    self.dogsArray = [[NSMutableArray alloc] initWithObjects:hercules, boby, toby, zeus, duke, milu, hachi, beethoven, marley, lassie, nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dogsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DogsTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"DogsTableViewCell"];
    
    Dog *dog = self.dogsArray[indexPath.row];
    
    [cell setupCustomCell:dog];
    
    if (indexPath.row % 2 == 0) {
       [cell setBackgroundColor:[UIColor colorWithRed:0/255.0 green:255/255.0 blue:255/255.0 alpha:1.0]];
    }else{
        [cell setBackgroundColor:[UIColor whiteColor]];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DogsDetailTableViewController *dogsDetailTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DogsDetailTableViewController"];
    
    Dog *dog = self.dogsArray[indexPath.row];
    dogsDetailTableViewController.dog = dog;
    
    [self.navigationController pushViewController:dogsDetailTableViewController animated:TRUE];
}

@end
