//
//  ViewController.m
//  BookClub2
//
//  Created by Brett Tau on 1/27/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Reader.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *friends;
@property NSManagedObjectContext *moc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;
}


-(void)viewWillAppear:(BOOL)animated {
    [self loadFriends];
}


-(void)loadFriends {
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Reader"];
    
//    NSSortDescriptor *sortByName = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
//    NSSortDescriptor *sortByBudget = [[NSSortDescriptor alloc] initWithKey:@"budget" ascending:NO];
    
//    request.sortDescriptors = @[sortByBudget, sortByName];
    
//    NSPredicate *agePredicate = [NSPredicate predicateWithFormat:@"age >= %@", withAge];
//    request.predicate = agePredicate;
    
    NSError *error;
    
    self.friends = [self.moc executeFetchRequest:request error:&error];
    
    if (error == nil) {
        [self.tableView reloadData];
    } else {
        NSLog(@"AN ERROR OCCURRED");
    }
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.friends.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
    
    Reader *reader = [self.friends objectAtIndex:indexPath.row];
    
    cell.textLabel.text = reader.name;
    
    return cell;
}



@end
