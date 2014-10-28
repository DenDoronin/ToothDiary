//
//  FourthQuaterViewController.m
//  ToothDiary
//
//  Created by   Doro on 10/7/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import "FourthQuaterViewController.h"
#import "FourthQuaterView.h"
#import "TDToothButton.h"

#import <QuartzCore/QuartzCore.h>

@interface FourthQuaterViewController ()

@property (nonatomic,strong) FourthQuaterView *view;

@end

@implementation FourthQuaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setupView];
    [self decorateNavigationBarAppearance];
    
    UIImage* photoImage = [UIImage imageNamed:@"Eminem"];
    UIButton *iv  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,40, 40)];
    [iv setImage:photoImage forState:UIControlStateNormal];
    //[iv setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    iv.layer.cornerRadius = 20.0;
    iv.clipsToBounds = YES;
    iv.enabled = NO;
    UIBarButtonItem *itemWithPhoto = [[UIBarButtonItem alloc] initWithCustomView:iv];
    
    [SlideNavigationController sharedInstance].navigationItem.rightBarButtonItem = itemWithPhoto;
    self.navigationItem.rightBarButtonItem = itemWithPhoto;
    
   
    
    [self setTitleWithName:@"Eminem Cool" andDate:[NSDate date]];
    // Do any additional setup after loading the view from its nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)toothButtonPressed:(id)sender {
    
    TDToothButton *tb = (TDToothButton*) sender;
    
    NSString *message = [NSString stringWithFormat:@"Tooth with number %@ was choosen",tb.toothIndex];
    
    UIAlertView *alertView=  [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Tooth Diary", nil) message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [alertView show];
}
@end
