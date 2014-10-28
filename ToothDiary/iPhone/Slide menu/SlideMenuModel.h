//
//  SlideMenuModel.h
//  ToothDiary
//
//  Created by   Doro on 10/7/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TDModelProtocol.h"

@interface SlideMenuModel : NSObject<TDModelProtocol>

@property (nonatomic, weak) id <TDModelActivityDelegate> delegate;
@property (nonatomic,strong) NSMutableArray* titles;

- (instancetype)initWithManagerProvider:(id)provider;

- (NSInteger)numberOfSection;
- (NSInteger)numberOfRowInSection:(NSInteger)section;

- (NSString*) titleForIndexPath: (NSIndexPath*) indexPath;
- (UIImage*) imageForIndexPath: (NSIndexPath*) indexPath;

- (void) didSelectRowAtIndexPath:(NSIndexPath*) indexPath;

@end
