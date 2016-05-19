//
//  Person.h
//  LightningRealm
//
//  Created by DetroitLabs on 5/18/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Realm/Realm.h"

@interface Person : RLMObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic) int age;
@property(nonatomic, strong) NSString *uniqueID;

-(id)initWithName:(NSString *)name age:(int)age uniqueID:(NSString *)uniqueID;
+(id)initWithName:(NSString *)name age:(int)age uniqueID:(NSString *)uniqueID;

@end
