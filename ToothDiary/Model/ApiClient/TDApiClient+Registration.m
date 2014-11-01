//
//  TDApiClient+Registration.m
//  ToothDiary
//
//  Created by   Doro on 11/1/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import "TDApiClient+Registration.h"

@implementation TDApiClient (Registration)

- (AFHTTPRequestOperation *)registrationWithMD5:(NSString *)md5 login:(NSString *)login password:(NSString *)password email:(NSString *)email name:(NSString *)name agree:(NSString *)agree completion:(CompletionBlock)completion
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary]; // check params
    [params setObject:md5 forKey:@"md5"];
    [params setObject:login forKey:@"login"];
    [params setObject:password forKey:@"password"];
    [params setObject:email forKey:@"email"];
    [params setObject:name forKey:@"name"];
    [params setObject:agree forKey:@"agree"];
    
    AFHTTPRequestOperation *operation = [self.manager GET:@"registration/" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self handleResponse:responseObject complete:completion];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self handleError:error complete:completion];
    }];
    
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.securityPolicy.allowInvalidCertificates = YES;
    [operation start];
    
    return operation;
}

@end
