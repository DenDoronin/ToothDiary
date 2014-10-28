//
//  UIViewController+navigationDecoration.h
//  ToothDiary
//
//  Created by   Doro on 10/7/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (navigationDecoration)

-(void)decorateNavigationBarAppearance;
-(void) setTitleWithName: (NSString*) name andDate: (NSDate*) date;
@end
