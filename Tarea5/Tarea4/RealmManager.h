//
//  RealmManager.h
//  Tarea5
//
//  Created by SYSCO on 3/9/17.
//  Copyright © 2017 SYSCO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Realm/Realm.h"

@interface RealmManager : NSObject
+(RLMResults*)getAllDogs;
@end
