//
//  TDToothInfo.h
//  ToothDiary
//
//  Created by   Doro on 10/28/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TDUser;

@interface TDToothInfo : NSManagedObject

@property (nonatomic, retain) NSNumber * tooth_id;
@property (nonatomic, retain) NSNumber * isRoot;
@property (nonatomic, retain) NSMutableSet *historyItems;
@property (nonatomic, retain) TDUser *user;
@end

@interface TDToothInfo (CoreDataGeneratedAccessors)

- (void)addHistoryItemsObject:(NSManagedObject *)value;
- (void)removeHistoryItemsObject:(NSManagedObject *)value;
- (void)addHistoryItems:(NSSet *)values;
- (void)removeHistoryItems:(NSSet *)values;

@end
