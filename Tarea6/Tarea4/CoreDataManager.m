	//
//  CoreDataManager.m
//  Tarea6
//
//  Created by SYSCO on 3/16/17.
//  Copyright © 2017 SYSCO. All rights reserved.
//

#import "CoreDataManager.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Dog.h"

@implementation CoreDataManager

+(void)saveContext{
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError *error) {
        if (contextDidSave) {
            NSLog(@"You successfully saved your context.");
        }else if(error){
            NSLog(@"Error saving context: %@", error.description);
        }
    }];
}

+(NSArray*)getAllDogs{
    NSArray *dogs = [Dog MR_findAll];
    
    if (dogs.count > 0) {
        return dogs;
    }
    
    return [CoreDataManager insertDogs];
}

+(NSArray*) insertDogs{
    [Dog insertDogWithName:@"Hercules" image:@"Hercules" color:@"Black" location:@"San Jose" age:3 contactInformation:@"Sam Santamaria"];
    [Dog insertDogWithName:@"Boby" image:@"Boby" color:@"Brown" location:@"Heredia" age:5 contactInformation:@"Hector Rodriguez"];
    [Dog insertDogWithName:@"Toby" image:@"Toby" color:@"Beige" location:@"Alajuela" age:3 contactInformation:@"Carlos Duarte"];
    [Dog insertDogWithName:@"Zeus" image:@"Zeus" color:@"Beige" location:@"Cartago" age:4 contactInformation:@"Daniel Hidalgo"];
    [Dog insertDogWithName:@"Duke" image:@"Duke" color:@"Black" location:@"Escazu" age:3 contactInformation:@"Andres Lopez"];
    [Dog insertDogWithName:@"Milu" image:@"Milu" color:@"White" location:@"Sabana" age:2 contactInformation:@"Paola Saenz"];
    [Dog insertDogWithName:@"Hachi" image:@"Hachi" color:@"Brown" location:@"Tibas" age:3 contactInformation:@"Sofia Herrera"];
    [Dog insertDogWithName:@"Beethoven" image:@"Beethoven" color:@"Brown" location:@"Orotina" age:4 contactInformation:@"Laura Salas"];
    [Dog insertDogWithName:@"Marley" image:@"Marley" color:@"Beige" location:@"Desamparados" age:3 contactInformation:@"Luis Guzman"];
    [Dog insertDogWithName:@"Lassie" image:@"Lassie" color:@"Brown" location:@"Uruca" age:4 contactInformation:@"Virginia Perez"];
    
    [CoreDataManager saveContext];
    
    return [CoreDataManager getAllDogs];
}

@end
