//
//  DogsTableViewCell.h
//  Tarea4
//
//  Created by SYSCO on 2/28/17.
//  Copyright © 2017 SYSCO. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Dog;

@interface DogsTableViewCell : UITableViewCell
-(void)setupCustomCell:(Dog*)dog;
@end
