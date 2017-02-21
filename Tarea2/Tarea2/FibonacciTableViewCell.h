//
//  FibonacciTableViewCell.h
//  Tarea2
//
//  Created by SYSCO on 2/21/17.
//  Copyright © 2017 SYSCO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FibonacciTableViewCell : UITableViewCell
    -(void)setupCustomCellWithNumber:(NSString*)number;
    +(NSString*)getIdentifier;
@end
