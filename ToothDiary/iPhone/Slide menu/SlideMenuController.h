//
//  SlideMenuController.h
//  ToothDiary
//
//  Created by   Doro on 10/7/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideMenuModel.h"
#import "SlideMenuCell.h"

@interface SlideMenuController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) SlideMenuModel *model;

@end
