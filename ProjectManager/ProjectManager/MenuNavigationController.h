//
//  MenuNavigationController.h
//  ProjectManager
//
//  Created by Sam Santamaria on 3/31/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REMenu.h"

@interface MenuNavigationController : UINavigationController

@property (strong, nonatomic) REMenu *menu;

- (void)toggleMenu;

@end
