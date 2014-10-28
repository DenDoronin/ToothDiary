//
//  TDHistoryItem.h
//  ToothDiary
//
//  Created by   Doro on 10/28/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TDToothInfo;

@interface TDHistoryItem : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * toothDescription;
@property (nonatomic, retain) TDToothInfo *toothHolder;

@end
