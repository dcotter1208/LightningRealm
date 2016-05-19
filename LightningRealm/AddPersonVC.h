//
//  AddPersonVC.h
//  LightningRealm
//
//  Created by DetroitLabs on 5/18/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface AddPersonVC : UIViewController

@property(nonatomic, strong) Person *person;
@property(nonatomic, strong) RLMRealm *realm;

@end
