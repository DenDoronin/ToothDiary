//
//  FourthQuaterView.h
//  ToothDiary
//
//  Created by   Doro on 10/7/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDToothButton.h"
@interface FourthQuaterView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *ivBackGroundImageView;
@property (weak, nonatomic) IBOutlet TDToothButton *tooth48;
@property (weak, nonatomic) IBOutlet TDToothButton *tooth47;
@property (weak, nonatomic) IBOutlet TDToothButton *tooth46;
@property (weak, nonatomic) IBOutlet TDToothButton *tooth45;
@property (weak, nonatomic) IBOutlet TDToothButton *tooth44;
@property (weak, nonatomic) IBOutlet TDToothButton *tooth43;
@property (weak, nonatomic) IBOutlet TDToothButton *tooth42;
@property (weak, nonatomic) IBOutlet TDToothButton *tooth41;

- (void) setupView;

@end
