//
//  ITGApiClient.m
//  xSport
//
//  Created by   Doro on 7/22/14.
//  Copyright (c) 2014 ITGroups. All rights reserved.
//

#import "TDApiClient.h"



@implementation TDApiClient

- (instancetype)init
{
    if (self = [super init])
    {
        NSURL *baseURL = [NSURL URLWithString:kBaseURL];
        _manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
        [[_manager operationQueue] setMaxConcurrentOperationCount:2];
    }
    return self;
}

- (void)handleResponse:(id)responseObject complete:(CompletionBlock)completion
{
//    DPDataMapper *mapper = [DPDataMapper new];
//    [mapper setResponse:responseObject];
//    
//    if ([[mapper stringFromKey:kStatus] isEqualToString:@"OK"])
//    {
//        if ([mapper dictionaryForKey:kData])
//        {
//            completion([mapper dictionaryForKey:kData], nil);
//        }
//    }
//    else
//    {
//        completion(nil, @"Error user authorization !");
//    }
    completion(responseObject,nil);
//#if DEBUG
//    NSLog(@"Server response:%@", responseObject);
//#endif
}

- (void)handleError:(NSError *)error complete:(CompletionBlock)completion
{
    completion(nil, error.localizedDescription);
    
#if DEBUG
    NSLog(@"Server error:%@", error);
#endif
}

@end
