//
//  CURLaunchScreenBuilder_iPhone.h
//  BTC-exchange
//
//  Created by   Doro on 10/29/14.
//  Copyright (c) 2014 CuriousIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LaunchScreenProtocol.h"
@interface TDLaunchiPhoneScreenBuilder : NSObject<LaunchScreenProtocol>

+(void) setupLaunchWindow: (UIWindow*) window;
@end
