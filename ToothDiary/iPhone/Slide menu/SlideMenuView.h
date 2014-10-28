//
//  SlideMenuView.h
//  ToothDiary
//
//  Created by   Doro on 10/7/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideMenuView : UIView

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (void)setBackgroundImageNamed: (NSString*) name;

@end
