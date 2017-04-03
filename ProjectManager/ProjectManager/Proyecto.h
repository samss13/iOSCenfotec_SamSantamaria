//
//  Proyecto.h
//  ProjectManager
//
//  Created by Sam Santamaria on 3/26/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
@class TeamWork;

@interface Proyecto : RLMObject
@property NSString *identificador;
@property NSString *descripcionProject;
@property NSString *coordinadorIce;
@property NSDate *fechaInicial;
@property NSDate *fechaFinal;
@property NSNumber<RLMInt> *horasEstimadas;
@property NSNumber<RLMInt> *horasConsumidas;
@property NSNumber<RLMInt> *horasTotales;
@property NSString *estado;
@property TeamWork *teamWork;
@end
RLM_ARRAY_TYPE(Proyecto)
