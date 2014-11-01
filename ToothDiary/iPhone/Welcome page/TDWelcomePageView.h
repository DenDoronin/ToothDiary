//
//  TDWelcomePageView.h
//  ToothDiary
//
//  Created by   Doro on 11/1/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDWelcomePageView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UILabel *lblLogo;
@property (weak, nonatomic) IBOutlet UIView *splitLine;
@property (weak, nonatomic) IBOutlet UILabel *lblWelcome;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UILabel *lblCreateTitle;
@end
