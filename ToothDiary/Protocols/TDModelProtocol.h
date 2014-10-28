//
//  TDModelProtocol.h
//  ToothDiary
//
//  Created by   Doro on 10/7/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TDModelProtocol <NSObject>

- (instancetype)initWithManagerProvider:(id)provider;

@optional

- (void)startActivity;
- (void)finishActivity;

@end

@protocol TDModelActivityDelegate <NSObject>
@required

- (void)modelDidUpdate:(id)model;

@optional

- (void)modelDidFetchData;

- (void)modelDidStartActivity:(id)model;
- (void)modelDidFinishActivity:(id)model;

@end


@protocol TDTableModelActivityDelegate <TDModelActivityDelegate>

@required

- (void) shouldUpdateCellAtIndexPath:(NSIndexPath*)indexPath;

@optional

- (void) shouldInsertCellsAtIndexPaths: (NSArray*) indexPaths;
- (void) shouldShowContext: (id) context;

@end
