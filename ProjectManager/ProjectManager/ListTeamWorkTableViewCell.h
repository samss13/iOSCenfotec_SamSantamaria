//
//  ListTeamWorkTableViewCell.h
//  ProjectManager
//
//  Created by Sam Santamaria on 4/2/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TeamWork;

@interface ListTeamWorkTableViewCell : UITableViewCell
-(void)setupCustomCellWithTeamWork:(TeamWork*)teamWork;
@end
