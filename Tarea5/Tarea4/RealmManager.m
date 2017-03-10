//
//  RealmManager.m
//  Tarea5
//
//  Created by SYSCO on 3/9/17.
//  Copyright © 2017 SYSCO. All rights reserved.
//

#import "RealmManager.h"
#import "Dog.h"

@implementation RealmManager

+(RLMResults*)getAllDogs{
    RLMResults<Dog*> *dogs = [Dog allObjects];
    
    if (dogs.count > 0) {
        return dogs;
    }
    
    return [RealmManager insertDogs];
}

+(Dog*)createDogWithName:(NSString*)name image:(NSString*)image color:(NSString*)color location:(NSString*)location age:(NSNumber*)age contactInformation:(NSString*)contactInformation{
    Dog* dog = [Dog new];
    
    dog.name = name;
    dog.image = image;
    dog.color = color;
    dog.location = location;
    dog.age = age;
    dog.contactInformation = contactInformation;
    
    return dog;
}

+(RLMResults*)insertDogs{
    Dog *hercules = [RealmManager createDogWithName:@"Hercules" image:@"Hercules" color:@"Black" location:@"San Jose" age:[NSNumber numberWithFloat:3] contactInformation:@"Sam Santamaria"];
    Dog *boby = [RealmManager createDogWithName:@"Boby" image:@"Boby" color:@"Brown" location:@"Heredia" age:[NSNumber numberWithFloat:5] contactInformation:@"Hector Rodriguez"];
    Dog *toby = [RealmManager createDogWithName:@"Toby" image:@"Toby" color:@"Beige" location:@"Alajuela" age:[NSNumber numberWithFloat:3] contactInformation:@"Carlos Duarte"];
    Dog *zeus = [RealmManager createDogWithName:@"Zeus" image:@"Zeus" color:@"Beige" location:@"Cartago" age:[NSNumber numberWithFloat:4] contactInformation:@"Daniel Hidalgo"];
    Dog *duke = [RealmManager createDogWithName:@"Duke" image:@"Duke" color:@"Black" location:@"Escazu" age:[NSNumber numberWithFloat:3] contactInformation:@"Andres Lopez"];
    Dog *milu = [RealmManager createDogWithName:@"Milu" image:@"Milu" color:@"White" location:@"Sabana" age:[NSNumber numberWithFloat:2] contactInformation:@"Paola Saenz"];
    Dog *hachi = [RealmManager createDogWithName:@"Hachi" image:@"Hachi" color:@"Brown" location:@"Tibas" age:[NSNumber numberWithFloat:3] contactInformation:@"Sofia Herrera"];
    Dog *beethoven = [RealmManager createDogWithName:@"Beethoven" image:@"Beethoven" color:@"Brown" location:@"Orotina" age:[NSNumber numberWithFloat:4] contactInformation:@"Laura Salas"];
    Dog *marley = [RealmManager createDogWithName:@"Marley" image:@"Marley" color:@"Beige" location:@"Desamparados" age:[NSNumber numberWithFloat:3] contactInformation:@"Luis Guzman"];
    Dog *lassie = [RealmManager createDogWithName:@"Lassie" image:@"Lassie" color:@"Brown" location:@"Uruca" age:[NSNumber numberWithFloat:4] contactInformation:@"Virginia Perez"];
    
    [RealmManager saveRealmObject:hercules];
    [RealmManager saveRealmObject:boby];
    [RealmManager saveRealmObject:toby];
    [RealmManager saveRealmObject:zeus];
    [RealmManager saveRealmObject:duke];
    [RealmManager saveRealmObject:milu];
    [RealmManager saveRealmObject:hachi];
    [RealmManager saveRealmObject:beethoven];
    [RealmManager saveRealmObject:marley];
    [RealmManager saveRealmObject:lassie];
    
    return [RealmManager getAllDogs];
}

+(void)saveRealmObject:(RLMObject*)realmObject{
    RLMRealm *realm = [RLMRealm defaultRealm];

    [realm beginWriteTransaction];
    [realm addObject:realmObject];
    [realm commitWriteTransaction];
}

@end
