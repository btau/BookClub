//
//  Comment+CoreDataProperties.h
//  BookClub2
//
//  Created by Brett Tau on 1/28/16.
//  Copyright © 2016 Brett Tau. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Comment.h"

NS_ASSUME_NONNULL_BEGIN

@interface Comment (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *readerName;
@property (nullable, nonatomic, retain) NSString *review;
@property (nullable, nonatomic, retain) NSSet<Book *> *book;

@end

@interface Comment (CoreDataGeneratedAccessors)

- (void)addBookObject:(Book *)value;
- (void)removeBookObject:(Book *)value;
- (void)addBook:(NSSet<Book *> *)values;
- (void)removeBook:(NSSet<Book *> *)values;

@end

NS_ASSUME_NONNULL_END
