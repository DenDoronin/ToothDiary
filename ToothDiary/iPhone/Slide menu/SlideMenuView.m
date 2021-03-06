//
//  SlideMenuView.m
//  ToothDiary
//
//  Created by   Doro on 10/7/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import "SlideMenuView.h"

@implementation SlideMenuView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setBackgroundImageNamed: (NSString*) name
{
    UIImage *img = [UIImage imageNamed:name];
    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:img];
    [tempImageView setFrame:self.tableView.frame];
    self.tableView.opaque = YES;
    self.tableView.backgroundView = tempImageView;
}

@end
