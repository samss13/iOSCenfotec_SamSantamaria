// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Dog.m instead.

#import "_Dog.h"

@implementation DogID
@end

@implementation _Dog

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext *)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Dog" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Dog";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Dog" inManagedObjectContext:moc_];
}

- (DogID*)objectID {
	return (DogID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"ageValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"age"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic age;

- (int16_t)ageValue {
	NSNumber *result = [self age];
	return [result shortValue];
}

- (void)setAgeValue:(int16_t)value_ {
	[self setAge:@(value_)];
}

- (int16_t)primitiveAgeValue {
	NSNumber *result = [self primitiveAge];
	return [result shortValue];
}

- (void)setPrimitiveAgeValue:(int16_t)value_ {
	[self setPrimitiveAge:@(value_)];
}

@dynamic color;

@dynamic contactInformation;

@dynamic image;

@dynamic location;

@dynamic name;

@end

@implementation DogAttributes 
+ (NSString *)age {
	return @"age";
}
+ (NSString *)color {
	return @"color";
}
+ (NSString *)contactInformation {
	return @"contactInformation";
}
+ (NSString *)image {
	return @"image";
}
+ (NSString *)location {
	return @"location";
}
+ (NSString *)name {
	return @"name";
}
@end

