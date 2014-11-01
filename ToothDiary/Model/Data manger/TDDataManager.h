//
//  ITGDataManager.h
//  GOSpay
//
//  Created by   Doro on 12/23/13.
//  Copyright (c) 2013 ITGroups. All rights reserved.
//

#import <Foundation/Foundation.h>

// Entities


// client's Api

#import "TDApiClient+Registration.h"

//parsers


typedef void (^FinishingBlock)(NSString *responseString);
typedef void (^SuccessBlock)(id data, NSError *error);

static NSString * const kNotificationWillClearUpToDateContent = @"kNotificationWillClearUpToDateContent";

static NSString * const kNotificationDidClearUpToDateContent = @"kNotificationDidClearUpToDateContent";

@interface TDDataManager : NSObject

+ (TDDataManager *) sharedDataManager;

- (void)dropDatabase;
-(void) removeAllDataFromKeychain;


-(NSString*) pushIDForUser;
-(void) setPushIDForUser: (NSString*) pushId;


-(void) entitiesForClass: (Class) class ByAttribute:(NSString*) attribute WithValue:(id) value Completion:(SuccessBlock)completion;

-(void) entitiesForClass: (Class) class ByAttribute:(NSString*) attribute ascending:(BOOL) ascending Completion:(SuccessBlock)completion;

-(void) entitiesForClass: (Class) class ByPredicate:(NSPredicate*) predicate Completion:(SuccessBlock)completion;

-(void) entitiesForClass: (Class) class sortedByComparator: (NSComparator) comparator WithCompletion:(SuccessBlock)completion;

-(void) entitiesForClass: (Class) class ByAttribute:(NSString*) attribute ascending:(BOOL) ascending WithPredicate:(NSPredicate*) predicate Completion:(SuccessBlock)completion;



//- (NSOperation *)registrationWithemail:(NSString *)email
//                              password:(NSString *)password
//                             cellphone:(NSString *)cellphone
//                            completion:(void (^)(NSNumber *result, NSError *error))completion;

- (NSOperation *)registrationWithemail:(NSString *)email
                              password:(NSString *)password
                             cellphone:(NSString *)cellphone
                            completion:(void (^)(NSNumber *result, NSError *error))completion;

- (NSOperation *)loginWithLogin:(NSString *)login
                       password:(NSString *)password
                     completion:(void (^)(NSNumber *result, NSError *error))completion;

- (NSOperation *)logoutWithCompletion:(void (^)(NSNumber *result, NSError *error))completion;
@end
