//
//  Book.h
//  BookClub2
//
//  Created by Brett Tau on 1/28/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comment, Reader;

NS_ASSUME_NONNULL_BEGIN

@interface Book : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "Book+CoreDataProperties.h"
