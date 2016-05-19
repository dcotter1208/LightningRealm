//
//  PeopleTVC.h
//  LightningRealm
//
//  Created by DetroitLabs on 5/18/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Realm/Realm.h"
#import "Person.h"

@interface PeopleTVC : UIViewController

@property(nonatomic, strong) RLMResults *people;
@property(nonatomic, strong) RLMRealm *realm;

@end
