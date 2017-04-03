//
//  TeamWork.h
//  ProjectManager
//
//  Created by Sam Santamaria on 4/2/17.
//  Copyright © 2017 arkkosoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface TeamWork : RLMObject
@property NSString *name;
@property NSString *descripcionTeamWork;
@property NSString *team;
@end
RLM_ARRAY_TYPE(Proyecto)
