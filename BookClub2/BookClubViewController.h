//
//  BookClubViewController.h
//  BookClub2
//
//  Created by Brett Tau on 1/27/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reader.h"

@protocol BookClubViewControllerDelegate <NSObject>

- (void)makeReaderAFriend:(Reader *)reader;

@end

@interface BookClubViewController : UIViewController

@property (nonatomic, assign) id<BookClubViewControllerDelegate> delegate;
@property NSMutableArray *friends;

@end
