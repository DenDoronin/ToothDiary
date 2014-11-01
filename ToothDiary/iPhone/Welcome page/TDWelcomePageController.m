//
//  TDWelcomePageController.m
//  ToothDiary
//
//  Created by   Doro on 11/1/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import "TDWelcomePageController.h"
#import "TDWelcomePageView.h"
@interface TDWelcomePageController ()

@property (nonatomic, strong) TDWelcomePageView *view;

@end

@implementation TDWelcomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    [self.view.btnAdd addTarget:self action:@selector(addButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) addButtonPressed: (id) sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
