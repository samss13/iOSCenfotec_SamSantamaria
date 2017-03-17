#import "Dog.h"
#import "MagicalRecord/MagicalRecord.h"

@interface Dog ()

// Private interface goes here.

@end

@implementation Dog

// Custom logic goes here.

+(id)insertDogWithName:(NSString*)name image:(NSString*)image color:(NSString*)color location:(NSString*)location age:(NSInteger)age contactInformation:(NSString*)contactInformation{
    Dog *dog = [Dog MR_createEntity];
    dog.name = name;
    dog.image = image;
    dog.color = color;
    dog.location = location;
    dog.ageValue = age;
    dog.contactInformation = contactInformation;
    
    return dog;
}

@end
