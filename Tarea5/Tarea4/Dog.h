//
//  Dog.h
//  Tarea4
//
//  Created by SYSCO on 2/28/17.
//  Copyright © 2017 SYSCO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Realm/Realm.h"

@interface Dog : RLMObject
@property NSString* name;
@property NSString* image;
@property NSString* color;
@property NSString* location;
@property NSNumber<RLMInt>* age;
@property NSString* contactInformation;

@end
RLM_ARRAY_TYPE(Dog)
