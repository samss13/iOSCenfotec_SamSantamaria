//
//  RealmManager.m
//  ProjectManager
//
//  Created by Sam Santamaria on 3/26/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import "RealmManager.h"
#import "Proyecto.h"
#import "TeamWork.h"

@implementation RealmManager

+(void)saveRealmObject:(RLMObject*)realmObject{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:realmObject];
    [realm commitWriteTransaction];
}

+(void)deleteRealmObject:(RLMObject*)realmObject{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteObject:realmObject];
    [realm commitWriteTransaction];
}

//Proyectos

+(RLMResults*)getAllProjects{
    RLMResults<Proyecto *> *proyectos = [Proyecto allObjects];
    
    return proyectos;
}

+(void)createProjectWithIdentificador:(NSString*)identificador descripcion:(NSString*)descripcion coordinadorIce:(NSString*)coordinadorIce fechaInicial:(NSDate*)fechaInicial fechaFinal:(NSDate*)fechaFinal horasEstimadas:(NSNumber*)horasEstimadas horasConsumidas:(NSNumber*)horasConsumidas horasTotales:(NSNumber*)horasTotales estado:(NSString*)estado teamWork:(TeamWork*)teamWork{
    Proyecto *proyecto = [[Proyecto alloc] init];
    
    proyecto.identificador = identificador;
    proyecto.descripcionProject = descripcion;
    proyecto.coordinadorIce = coordinadorIce;
    proyecto.fechaInicial = fechaInicial;
    proyecto.fechaFinal = fechaFinal;
    proyecto.horasEstimadas = horasEstimadas;
    proyecto.horasConsumidas = horasConsumidas;
    proyecto.horasTotales = horasTotales;
    proyecto.estado = estado;
    proyecto.teamWork = teamWork;
    
    [RealmManager saveRealmObject:proyecto];
}

+(Proyecto*)getProjectWithIdentificador:(NSString*)identificador{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identificador = %@", identificador];
    
    RLMResults<Proyecto*> *proyectos = [Proyecto objectsWithPredicate:predicate];
    
    if (proyectos.count > 0) {
        return proyectos.firstObject;
    }
    
    return nil;
}

+(void)modifyProjectWithIdentificador:(NSString*)identificador descripcion:(NSString*)descripcion coordinadorIce:(NSString*)coordinadorIce fechaInicial:(NSDate*)fechaInicial fechaFinal:(NSDate*)fechaFinal horasEstimadas:(NSNumber*)horasEstimadas horasConsumidas:(NSNumber*)horasConsumidas horasTotales:(NSNumber*)horasTotales estado:(NSString*)estado teamWork:(TeamWork*)teamWork project:(Proyecto*)project{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];

    
    project.identificador = identificador;
    project.descripcionProject = descripcion;
    project.coordinadorIce = coordinadorIce;
    project.fechaInicial = fechaInicial;
    project.fechaFinal = fechaFinal;
    project.horasEstimadas = horasEstimadas;
    project.horasConsumidas = horasConsumidas;
    project.horasTotales = horasTotales;
    project.estado = estado;
    project.teamWork = teamWork;
    
    [realm addObject:project];
    [realm commitWriteTransaction];
}

//TeamWork

+(RLMResults*)getAllTeamsWork{
    RLMResults<TeamWork *> *teamsWork = [TeamWork allObjects];
    
    return teamsWork;
}

+(void)createTeamWorkWithName:(NSString*)name description:(NSString*)description team:(NSString*)team {
    TeamWork *teamWork = [[TeamWork alloc] init];
    
    teamWork.name = name;
    teamWork.descripcionTeamWork = description;
    teamWork.team = team;
    
    [RealmManager saveRealmObject:teamWork];
}

+(TeamWork*)getTeamWorkWithName:(NSString*)name{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
    
    RLMResults<TeamWork*> *teamsWork = [TeamWork objectsWithPredicate:predicate];
    
    if (teamsWork.count > 0) {
        return teamsWork.firstObject;
    }
    
    return nil;
}

+(void)modifyTeamWorkWithName:(NSString*)name description:(NSString*)description team:(NSString*)team teamWork:(TeamWork*)teamWork {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    
    
    teamWork.name = name;
    teamWork.descripcionTeamWork = description;
    teamWork.team = team;
    
    [realm addObject:teamWork];
    [realm commitWriteTransaction];
}

@end
