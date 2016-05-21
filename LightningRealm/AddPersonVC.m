//
//  AddPersonVC.m
//  LightningRealm
//
//  Created by DetroitLabs on 5/18/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "AddPersonVC.h"

@interface AddPersonVC ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *ageTF;

@end

@implementation AddPersonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTextFields];
    _realm = [RLMRealm defaultRealm];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)savePerson:(id)sender {
    
    NSString *name = _nameTF.text;
    int age = [_ageTF.text intValue];

    if ([_nameTF.text isEqualToString:@""] || [_ageTF.text isEqualToString:@""]) {
        NSLog(@"Please make sure the person has a name and an age.");
    } else if (_person == nil) {
        
        //**************** Add TO REALM ***************
        [_realm beginWriteTransaction];
        NSString *uniqueID = [[NSUUID UUID] UUIDString];
        _person = [Person initWithName:name age:age uniqueID:uniqueID];
        [self writeToRealm:_person];
        [self resetTextFields];
        [self resetPersonObject];
    } else {
        
        //**************** UPDATE IN REALM ***************
        [_realm beginWriteTransaction];
        _person.name = name;
        _person.age = age;
        [self writeToRealm:_person];
        [self resetTextFields];
        [self resetPersonObject];
    }
}

-(void)writeToRealm:(Person *)person {
    
    //**************** ADD OR UPDATE REALM OBJECT ***************
    [_realm addOrUpdateObject:person];
    [_realm commitWriteTransaction];
}

-(void)resetTextFields {
    _nameTF.text = @"";
    _ageTF.text = @"";
}

-(void)resetPersonObject{
    _person = nil;
}

-(void)setTextFields {
    if (_person == nil) {
        [self resetTextFields];
    } else {
        _nameTF.text = _person.name;
        _ageTF.text = [NSString stringWithFormat:@"%d", _person.age];
    }
}


@end
