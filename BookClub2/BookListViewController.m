//
//  BookListViewController.m
//  BookClub2
//
//  Created by Brett Tau on 1/27/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import "BookListViewController.h"
#import "Book.h"
#import "AppDelegate.h"

@interface BookListViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *books;
@property NSManagedObjectContext *moc;

@end

@implementation BookListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;
    
}



- (void)loadBooks {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Book"];
    
    NSSortDescriptor *sortByTitle = [[NSSortDescriptor alloc] initWithKey:@"bookTitle" ascending:YES];
    
    request.sortDescriptors = @[sortByTitle];
    
    NSError *error;
    
    self.books = [self.moc executeFetchRequest:request error:&error];
    
    if (error == nil) {
        [self.tableView reloadData];
    } else {
        NSLog(@"AN ERROR OCCURRED");
    }
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    Book *book = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:self.moc];
    book.bookTitle = textField.text;
    
    NSError *error;
    
    if ([self.moc save:&error]) {
        [self loadBooks];
    } else {
        NSLog(@"AN ERROR HAS OCCURRED : %@", error);
    }
    
    
    textField.text = nil;
    return [textField resignFirstResponder];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.books.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookCell"];
    
    Book *book = [self.books objectAtIndex:indexPath.row];
    
    cell.textLabel.text = book.bookTitle;
    
    return cell;
}





@end
