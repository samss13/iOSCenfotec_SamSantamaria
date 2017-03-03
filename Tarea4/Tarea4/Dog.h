//
//  Dog.h
//  Tarea4
//
//  Created by SYSCO on 2/28/17.
//  Copyright © 2017 SYSCO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
@property (readonly) NSString* name;
@property (readonly) NSString* image;
@property (readonly) NSString* color;
@property (readonly) NSString* location;
@property (readonly) NSNumber* age;
@property (readonly) NSString* contactInformation;

-(id)initWithName:(NSString*) name image:(NSString*)image color:(NSString*)color location:(NSString*)location age:(NSNumber*)age contactInformation:(NSString*)contactInformation;
@end
