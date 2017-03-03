//
//  Dog.m
//  Tarea4
//
//  Created by SYSCO on 2/28/17.
//  Copyright © 2017 SYSCO. All rights reserved.
//

#import "Dog.h"

@interface Dog()

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* image;
@property (strong, nonatomic) NSString* color;
@property (strong, nonatomic) NSString* location;
@property (strong, nonatomic) NSNumber* age;
@property (strong, nonatomic) NSString* contactInformation;

@end

@implementation Dog

-(id)initWithName:(NSString*) name image:(NSString*)image color:(NSString*)color location:(NSString*)location age:(NSNumber*)age contactInformation:(NSString*)contactInformation{
    if (self = [super init]) {
        _name = name;
        _image = image;
        _color = color;
        _location = location;
        _age = age;
        _contactInformation = contactInformation;
        
    }
    return self;
}

@end
