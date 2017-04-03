//
//  RealmManager.h
//  ProjectManager
//
//  Created by Sam Santamaria on 3/26/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
@class Proyecto;
@class TeamWork;

@interface RealmManager : NSObject
//Proyecto
+(RLMResults*)getAllProjects;
+(void)deleteRealmObject:(RLMObject*)realmObject;
+(void)createProjectWithIdentificador:(NSString*)identificador descripcion:(NSString*)descripcion coordinadorIce:(NSString*)coordinadorIce fechaInicial:(NSDate*)fechaInicial fechaFinal:(NSDate*)fechaFinal horasEstimadas:(NSNumber*)horasEstimadas horasConsumidas:(NSNumber*)horasConsumidas horasTotales:(NSNumber*)horasTotales estado:(NSString*)estado teamWork:(TeamWork*)teamWork;
+(Proyecto*)getProjectWithIdentificador:(NSString*)identificador;
+(void)modifyProjectWithIdentificador:(NSString*)identificador descripcion:(NSString*)descripcion coordinadorIce:(NSString*)coordinadorIce fechaInicial:(NSDate*)fechaInicial fechaFinal:(NSDate*)fechaFinal horasEstimadas:(NSNumber*)horasEstimadas horasConsumidas:(NSNumber*)horasConsumidas horasTotales:(NSNumber*)horasTotales estado:(NSString*)estado teamWork:(TeamWork*)teamWork project:(Proyecto*)project;

//TeamWork
+(RLMResults*)getAllTeamsWork;
+(void)createTeamWorkWithName:(NSString*)name description:(NSString*)description team:(NSString*)team;
+(TeamWork*)getTeamWorkWithName:(NSString*)name;
+(void)modifyTeamWorkWithName:(NSString*)name description:(NSString*)description team:(NSString*)team teamWork:(TeamWork*)teamWork;
@end
