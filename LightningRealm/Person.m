//
//  Person.m
//  LightningRealm
//
//  Created by DetroitLabs on 5/18/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)initWithName:(NSString *)name age:(int)age uniqueID:(NSString *)uniqueID {
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _uniqueID = uniqueID;
    }
    return self;
}

+(id)initWithName:(NSString *)name age:(int)age uniqueID:(NSString *)uniqueID {
    return [[self alloc]initWithName:name age:age uniqueID:uniqueID];
}

+ (NSString *)primaryKey {
    return @"uniqueID";
}

@end
