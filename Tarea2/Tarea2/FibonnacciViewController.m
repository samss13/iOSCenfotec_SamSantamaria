//
//  FibonnacciViewController.m
//  Tarea2
//
//  Created by SYSCO on 2/21/17.
//  Copyright © 2017 SYSCO. All rights reserved.
//

#import "FibonnacciViewController.h"
#import "FibonacciTableViewCell.h"

@interface FibonnacciViewController () <UITableViewDataSource, UITableViewDelegate>
    @property (weak, nonatomic) IBOutlet UITableView *tableView;
    @property (strong, nonatomic) NSMutableArray *numbersArray;
@end

@implementation FibonnacciViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCustomCell];
    [self loadDataArray];
    // Do any additional setup after loading the view.
}

-(void)loadDataArray{
    self.numbersArray = [NSMutableArray new];
    for(int i=1; i <= 21; i++){
        [self.numbersArray addObject:[NSString stringWithFormat: @"%d", [self fibonnacciWithNumber:i]]];
    }
}

-(int)fibonnacciWithNumber:(int)number{
    if (number == 0) {
        return 0;
    }
    if (number == 1) {
        return 1;
    }
    return [self fibonnacciWithNumber:number - 1] + [self fibonnacciWithNumber:number - 2];
}

-(void)registerCustomCell{
    UINib *nib = [UINib nibWithNibName:[FibonacciTableViewCell getIdentifier] bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:[FibonacciTableViewCell getIdentifier]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.numbersArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FibonacciTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:[FibonacciTableViewCell getIdentifier]];
    
    [cell setupCustomCellWithNumber:self.numbersArray[indexPath.row]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 190;
}

@end
