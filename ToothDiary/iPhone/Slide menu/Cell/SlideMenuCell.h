//
//  SlideMenuCell.h
//  ToothDiary
//
//  Created by   Doro on 10/7/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideMenuCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ivTitleImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

+(SlideMenuCell*) new;
@end
