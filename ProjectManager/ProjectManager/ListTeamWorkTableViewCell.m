//
//  ListTeamWorkTableViewCell.m
//  ProjectManager
//
//  Created by Sam Santamaria on 4/2/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import "ListTeamWorkTableViewCell.h"
#import "TeamWork.h"

@interface ListTeamWorkTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *teamWorkNameLabel;
@end

@implementation ListTeamWorkTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setupCustomCellWithTeamWork:(TeamWork*)teamWork{
   self.teamWorkNameLabel.text = teamWork.name;
}

@end
