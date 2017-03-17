// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Dog.h instead.

#if __has_feature(modules)
    @import Foundation;
    @import CoreData;
#else
    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface DogID : NSManagedObjectID {}
@end

@interface _Dog : NSManagedObject
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_;
+ (NSString*)entityName;
+ (nullable NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DogID *objectID;

@property (nonatomic, strong, nullable) NSNumber* age;

@property (atomic) int16_t ageValue;
- (int16_t)ageValue;
- (void)setAgeValue:(int16_t)value_;

@property (nonatomic, strong, nullable) NSString* color;

@property (nonatomic, strong, nullable) NSString* contactInformation;

@property (nonatomic, strong, nullable) NSString* image;

@property (nonatomic, strong, nullable) NSString* location;

@property (nonatomic, strong, nullable) NSString* name;

@end

@interface _Dog (CoreDataGeneratedPrimitiveAccessors)

- (nullable NSNumber*)primitiveAge;
- (void)setPrimitiveAge:(nullable NSNumber*)value;

- (int16_t)primitiveAgeValue;
- (void)setPrimitiveAgeValue:(int16_t)value_;

- (nullable NSString*)primitiveColor;
- (void)setPrimitiveColor:(nullable NSString*)value;

- (nullable NSString*)primitiveContactInformation;
- (void)setPrimitiveContactInformation:(nullable NSString*)value;

- (nullable NSString*)primitiveImage;
- (void)setPrimitiveImage:(nullable NSString*)value;

- (nullable NSString*)primitiveLocation;
- (void)setPrimitiveLocation:(nullable NSString*)value;

- (nullable NSString*)primitiveName;
- (void)setPrimitiveName:(nullable NSString*)value;

@end

@interface DogAttributes: NSObject 
+ (NSString *)age;
+ (NSString *)color;
+ (NSString *)contactInformation;
+ (NSString *)image;
+ (NSString *)location;
+ (NSString *)name;
@end

NS_ASSUME_NONNULL_END
