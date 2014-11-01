//
//  CURLaunchScreenBuilder_iPhone.m
//  BTC-exchange
//
//  Created by   Doro on 10/29/14.
//  Copyright (c) 2014 CuriousIT. All rights reserved.
//

#import "TDLaunchiPhoneScreenBuilder.h"
#import "SlideMenuController.h"
#import "TDHomePageController.h"
#import "TDLaunchScreenHelper.h"
#import "TDWelcomePageController.h"

@implementation TDLaunchiPhoneScreenBuilder

+(void) setupLaunchWindow: (UIWindow*) window
{
    UIViewController *rootVC = nil;
    TDLaunchScreenHelper *helper = [[TDLaunchScreenHelper alloc] init];
    
    if ([helper shouldShowLoginPage])
    {
        rootVC = [[TDHomePageController alloc] initWithNibName:NSStringFromClass(TDHomePageController.class) bundle:nil];
    }
    else
    {
        rootVC = [[TDWelcomePageController alloc] initWithNibName:NSStringFromClass(TDWelcomePageController.class) bundle:nil];
//        CURLicensePageModel *model = [[CURLicensePageModel alloc] initWithManagerProvider:nil];
//        if ([rootVC respondsToSelector:@selector(model)])
//        {
//            [rootVC setValue:model forKey:@"model"];
//        }
    }
    
    SlideNavigationController *navVC = [[SlideNavigationController alloc] initWithRootViewController:rootVC];
    
    SlideMenuController *leftMenu = [[SlideMenuController alloc] initWithNibName:NSStringFromClass([SlideMenuController class]) bundle:nil];
    SlideMenuModel* model = [[SlideMenuModel alloc] initWithManagerProvider:nil];
    [leftMenu setValue:model forKeyPath:@"model"];
    
    UINavigationController*leftMenuNav = [[UINavigationController alloc] initWithRootViewController:leftMenu];
    
    navVC.leftMenu = leftMenuNav;
    
    window.rootViewController = navVC;
   

}
@end
