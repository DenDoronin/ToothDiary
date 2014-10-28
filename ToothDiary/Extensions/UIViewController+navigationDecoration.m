//
//  UIViewController+navigationDecoration.m
//  ToothDiary
//
//  Created by   Doro on 10/7/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import "UIViewController+navigationDecoration.h"

@implementation UIViewController (navigationDecoration)

-(void)decorateNavigationBarAppearance
{
    
    [self.navigationController.navigationBar setOpaque:YES];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationItem setPrompt:@" "];
    [self.navigationController.navigationBar setBarTintColor: navBarColor];
    [self.navigationController.navigationBar setTintColor:RGB(255, 255, 255)]; // this will change the back
     //[self.navigationController.navigationBar setTintColor:RGB(168, 92, 101)]; // this will change the back button tint

}

-(void) setTitleWithName: (NSString*) name andDate: (NSDate*) date
{
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:18.0]];
    [titleLabel setTextColor:RGB(168, 92, 101)];
    [titleLabel setText:name];
    [titleLabel sizeToFit];
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, titleLabel.bounds.size.height, 0, 0)];
    [dateLabel setFont:[UIFont fontWithName:@"Helvetica-Light" size:12.0]];
    [dateLabel setTextColor:RGB(168, 92, 101)];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd MMMM YYYY"];
    [dateLabel setText:[dateFormatter stringFromDate:date]];
    [dateLabel sizeToFit];
    
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 80, 50)];
    [container setBackgroundColor:[UIColor clearColor]];
    
    titleLabel.center =  CGPointMake(container.center.x, 20);
    dateLabel.center = CGPointMake(container.center.x,titleLabel.bounds.size.height+20);
    
    [container addSubview:titleLabel];
    [container addSubview:dateLabel];
    
    [self.navigationItem setTitleView:container];
}

@end
