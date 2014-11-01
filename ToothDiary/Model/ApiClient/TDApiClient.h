//
//  ITGApiClient.h
//  xSport
//
//  Created by   Doro on 7/22/14.
//  Copyright (c) 2014 ITGroups. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
////test
//static NSString * const kServerURL = @"https://91.223.102.121";
//static NSString * const kBaseURL = @"https://91.223.102.121/mobile/";
// production
static NSString * const kServerURL = @"http://xsport.ua";
static NSString * const kBaseURL = @"http://xsport.ua/mobile/";
typedef void (^CompletionBlock)(id response, NSString *error);

@interface TDApiClient : NSObject

@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

- (void)handleResponse:(id)responseObject complete:(CompletionBlock)completion;
- (void)handleError:(NSError *)error complete:(CompletionBlock)completion;

@end
