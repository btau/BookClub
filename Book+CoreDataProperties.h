//
//  Book+CoreDataProperties.h
//  BookClub2
//
//  Created by Brett Tau on 1/28/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface Book (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *bookTitle;
@property (nullable, nonatomic, retain) NSSet<Comment *> *comment;
@property (nullable, nonatomic, retain) NSSet<Reader *> *reader;

@end

@interface Book (CoreDataGeneratedAccessors)

- (void)addCommentObject:(Comment *)value;
- (void)removeCommentObject:(Comment *)value;
- (void)addComment:(NSSet<Comment *> *)values;
- (void)removeComment:(NSSet<Comment *> *)values;

- (void)addReaderObject:(Reader *)value;
- (void)removeReaderObject:(Reader *)value;
- (void)addReader:(NSSet<Reader *> *)values;
- (void)removeReader:(NSSet<Reader *> *)values;

@end

NS_ASSUME_NONNULL_END
