//
//  BookClubViewController.m
//  BookClub2
//
//  Created by Brett Tau on 1/27/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import "BookClubViewController.h"
#import "Reader.h"
#import "AppDelegate.h"

@interface BookClubViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *readers;
@property NSManagedObjectContext *moc;

@end

@implementation BookClubViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends" ofType:@"json"]];
    self.readers = [NSArray arrayWithArray:[NSJSONSerialization JSONObjectWithData:data
                                                                           options:NSJSONReadingMutableContainers
                                                                             error:nil]];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;
    
    [self.moc save:nil];
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Reader *friend = [NSEntityDescription insertNewObjectForEntityForName:@"Reader" inManagedObjectContext:self.moc];
    friend.name = [[[tableView cellForRowAtIndexPath:indexPath]textLabel]text];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
   
    
    NSError *error;
    
    if (!friend.isFriend && cell.accessoryType == UITableViewCellAccessoryNone) {
        friend.isFriend = @1;
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        if ([self.moc save:&error]) {
            NSLog(@"Save good");
        }
        else {
            NSLog(@"Save unsuccessful");
        }
    }
    else {
        friend.isFriend = @0;
        [self.moc deleteObject:friend];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.readers.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookClubCell"];
    
    cell.textLabel.text = [self.readers objectAtIndex:indexPath.row];
    
    return cell;
}

@end
