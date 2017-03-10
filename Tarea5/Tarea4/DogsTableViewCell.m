//
//  DogsTableViewCell.m
//  Tarea4
//
//  Created by SYSCO on 2/28/17.
//  Copyright © 2017 SYSCO. All rights reserved.
//

#import "DogsTableViewCell.h"
#import "Dog.h"

@interface DogsTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *dogImage;
@end

@implementation DogsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupCustomCell:(Dog*)dog{
    self.nameLabel.text = dog.name;
    self.dogImage.image = [UIImage imageNamed:dog.image];
    
    self.dogImage.layer.cornerRadius = self.dogImage.frame.size.width / 2;
    self.dogImage.clipsToBounds = YES;
    self.dogImage.layer.borderWidth = 3.0f;
    self.dogImage.layer.borderColor = [UIColor whiteColor].CGColor;
    //self.dogImage.layer.cornerRadius = 10.0f;
}

@end
