//
//  ListProjectsCustomTableViewCell.m
//  ProjectManager
//
//  Created by Sam Santamaria on 3/25/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import "ListProjectsCustomTableViewCell.h"
#import "Proyecto.h"

@interface ListProjectsCustomTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UIView *estadoColorView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionProjectLabel;
@property (weak, nonatomic) IBOutlet UILabel *identifierProjectLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateProjectLabel;

@end

@implementation ListProjectsCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setupCustomCellWithProject:(Proyecto*)project{
    self.descriptionProjectLabel.text = project.descripcionProject;
    self.identifierProjectLabel.text = project.identificador;
    self.stateProjectLabel.text = project.estado;
    
    
     if ([project.estado  isEqual: @"Analisis"]) {
        [self.estadoColorView setBackgroundColor:[UIColor colorWithRed:112/255.0 green:135/255.0 blue:156/255.0 alpha:1]];
     }else if ([project.estado  isEqual: @"Ejecucion"]){
         [self.estadoColorView setBackgroundColor:[UIColor colorWithRed:199/255.0 green:191/255.0 blue:178/255.0 alpha:1]];
     }else if ([project.estado  isEqual: @"Pruebas"]){
         [self.estadoColorView setBackgroundColor:[UIColor colorWithRed:124/255.0 green:125/255.0 blue:127/255.0 alpha:1]];
     }else if ([project.estado  isEqual: @"PreQA"]){
         [self.estadoColorView setBackgroundColor:[UIColor colorWithRed:152/255.0 green:186/255.0 blue:198/255.0 alpha:1]];
     }else if ([project.estado  isEqual: @"QA"]){
         [self.estadoColorView setBackgroundColor:[UIColor colorWithRed:116/255.0 green:194/255.0 blue:180/255.0 alpha:1]];
     }else if ([project.estado  isEqual: @"Finalizado"]){
         [self.estadoColorView setBackgroundColor:[UIColor colorWithRed:189/255.0 green:110/255.0 blue:97/255.0 alpha:1]];
     }
}

@end
