//
//  CommentViewController.m
//  BookClub2
//
//  Created by Brett Tau on 1/27/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import "CommentViewController.h"
#import "AppDelegate.h"
#import "Comment.h"

@interface CommentViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *comments;
@property NSManagedObjectContext *moc;

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;
    
}



- (void)loadComments {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Comment"];
    
    NSSortDescriptor *sortByComment = [[NSSortDescriptor alloc] initWithKey:@"review" ascending:YES];
    
    request.sortDescriptors = @[sortByComment];
    
    NSError *error;
    
    self.comments = [self.moc executeFetchRequest:request error:&error];
    
    if (error == nil) {
        [self.tableView reloadData];
    } else {
        NSLog(@"AN ERROR OCCURRED");
    }
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    Comment *comment = [NSEntityDescription insertNewObjectForEntityForName:@"Comment" inManagedObjectContext:self.moc];
    comment.review = textField.text;
    
    NSError *error;
    
    if ([self.moc save:&error]) {
        [self loadComments];
    } else {
        NSLog(@"AN ERROR HAS OCCURRED : %@", error);
    }
    
    textField.text = nil;
    return [textField resignFirstResponder];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.comments.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
    
    Comment *comment = [self.comments objectAtIndex:indexPath.row];
    
    cell.textLabel.text = comment.review;
    cell.detailTextLabel.text = comment.readerName;
    
    return cell;

}


@end
