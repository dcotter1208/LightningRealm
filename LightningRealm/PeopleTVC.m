//
//  PeopleTVC.m
//  LightningRealm
//
//  Created by DetroitLabs on 5/18/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "PeopleTVC.h"
#import "AddPersonVC.h"

@interface PeopleTVC () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *peopleTableView;

@end

@implementation PeopleTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _realm = [RLMRealm defaultRealm];
    _people = [Person allObjects];
    NSLog(@"%@", _realm.configuration.fileURL);
    
}

-(void)viewWillAppear:(BOOL)animated {
    [_peopleTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _people.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Person *person = [_people objectAtIndex:indexPath.row];
    cell.textLabel.text = person.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Age: %d", person.age];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Person *person = [_people objectAtIndex:indexPath.row];
        [self removeFromRealm:person];
        [_peopleTableView reloadData];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"editPersonSegue"]) {
        NSIndexPath *selectedIndex = [_peopleTableView indexPathForSelectedRow];
        AddPersonVC *destinationVC = (AddPersonVC *)segue.destinationViewController;
        destinationVC.person = [_people objectAtIndex:selectedIndex.row];
    }
    
}

-(void)removeFromRealm:(Person *)person {
    [_realm beginWriteTransaction];
    [_realm deleteObject:person];
    [_realm commitWriteTransaction];
}

@end
