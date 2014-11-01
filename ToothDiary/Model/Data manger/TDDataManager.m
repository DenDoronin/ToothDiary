//
//  ITGDataManager.m
//  GOSpay
//
//  Created by   Doro on 12/23/13.
//  Copyright (c) 2013 ITGroups. All rights reserved.
//

#import "TDDataManager.h"
#define MR_SHORTHAND
#import "CoreData+MagicalRecord.h"
#import "NSManagedObjectContext+MagicalSaves.h"



@interface TDDataManager()

@property (nonatomic, retain) NSString *push_id;

@end


@implementation TDDataManager

static TDDataManager *shared = nil;
__weak TDDataManager *weakSelf;

+(TDDataManager *)sharedDataManager {
    return shared;
}

+(void) initialize {
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared = [[TDDataManager alloc] init];
    });
}

- (id)init {
    if(shared == nil)
    {
        self = [super init];
        if (self) {
            [self setupDB];
            weakSelf = self;
            
        }
        return self;
    }
    else
    {
        return shared;
    }
}

- (void)setupDB
{
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:[self dbStoreName]];
}


- (NSString *)dbStoreName
{
    NSString *bundleID = (NSString *)[[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleIdentifierKey];
    return [NSString stringWithFormat:@"%@.sqlite", bundleID];
}

- (void)dropDatabase
{
    NSString *dbStore = [self dbStoreName];
    
    NSError *error = nil;
    
    NSURL *storeURL = [NSPersistentStore MR_urlForStoreName:dbStore];
    
    [MagicalRecord cleanUp];
    
    if([[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error]){
        [self setupDB];
    }
    else{
        NSLog(@"An error has occurred while deleting %@", dbStore);
        NSLog(@"Error description: %@", error.description);
    }
    [self setupDB];
}


-(void) entitiesForClass: (Class) class
             ByAttribute:(NSString*) attribute
               WithValue:(id) value
              Completion:(SuccessBlock)completion
{
    NSOperationQueue *eQueue = [[NSOperationQueue alloc] init];
    eQueue.name = @"Fetching by value entity queue";
    // check if class can perfom find method
    if (attribute &&
        value &&
        [class respondsToSelector:@selector(MR_findByAttribute:withValue:inContext:)])
    {
        // Create a child context of our main context
        NSManagedObjectContext *privateContext = [NSManagedObjectContext MR_context];
        // When using private contexts you must execute the core data code in it's private queue using performBlock: or performBlockAndWait:
        [privateContext performBlock:^{
            // Execute your fetch
            NSArray *privateObjects = [class MR_findByAttribute:attribute withValue: value inContext:privateContext];
            // Convert your fetched objects into object IDs which can be pulled out of the main context
            NSArray *privateObjectIDs = [privateObjects valueForKey:@"objectID"];
            // Return to our main thread
            dispatch_async(dispatch_get_main_queue(), ^{
                // Create a new predicate to use to pull our objects out
                NSPredicate *mainPredicate = [NSPredicate predicateWithFormat:@"self IN %@", privateObjectIDs];
                // Execute your fetch
                NSArray *finalResults = [class MR_findAllWithPredicate:mainPredicate];
                completion(finalResults,nil);
                // Now you can use finalResults however you need from the main thread
            });
        }];
    }
    else
    {
        NSError *error = [NSError errorWithDomain:@"ITG.xSport" code:-1 userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(@"Error while fetching entities by atribute", nil), NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Atribute, value are nil OR class does not respond to findByAttribute:withValue:", nil)}];
         if (completion) completion(nil,error);
    }
}

-(void) entitiesForClass: (Class) class
             ByAttribute:(NSString*) attribute
               ascending:(BOOL) ascending
              Completion:(SuccessBlock)completion
{
    NSOperationQueue *eQueue = [[NSOperationQueue alloc] init];
    eQueue.name = @"Fetching by value entity queue";
    // check if class can perfom find method
    if (attribute &&
        [class respondsToSelector:@selector(MR_findAllSortedBy:ascending:inContext:)])
    {
        // Create a child context of our main context
        NSManagedObjectContext *privateContext = [NSManagedObjectContext MR_context];
        // When using private contexts you must execute the core data code in it's private queue using performBlock: or performBlockAndWait:
        [privateContext performBlock:^{
            // Execute your fetch
            NSArray *privateObjects = [class MR_findAllSortedBy:attribute ascending:ascending  inContext:privateContext];
            // Convert your fetched objects into object IDs which can be pulled out of the main context
            NSArray *privateObjectIDs = [privateObjects valueForKey:@"objectID"];
            // Return to our main thread
            dispatch_async(dispatch_get_main_queue(), ^{
                // Create a new predicate to use to pull our objects out
                NSPredicate *mainPredicate = [NSPredicate predicateWithFormat:@"self IN %@", privateObjectIDs];
                // Execute your fetch
                NSArray *finalResults = [class MR_findAllSortedBy:attribute ascending:ascending withPredicate:mainPredicate];
                completion(finalResults,nil);
                // Now you can use finalResults however you need from the main thread
            });
        }];    }
    else
    {
        NSError *error = [NSError errorWithDomain:@"ITG.xSport" code:-1 userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(@"Error while fetching entities by atribute", nil), NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Atribute, value are nil OR class does not respond to findByAttribute:withValue:", nil)}];
        if (completion) completion(nil,error);
    }
}

-(void) entitiesForClass: (Class) class
             ByPredicate:(NSPredicate*) predicate
              Completion:(SuccessBlock)completion

{
    NSOperationQueue *eQueue = [[NSOperationQueue alloc] init];
    eQueue.name = @"Fetching by predicate entity queue";
    // check if class can perfom find method
    if (predicate &&
        [class respondsToSelector:@selector(MR_findAllWithPredicate:inContext:)])
    {
        // Create a child context of our main context
        NSManagedObjectContext *privateContext = [NSManagedObjectContext MR_context];
        // When using private contexts you must execute the core data code in it's private queue using performBlock: or performBlockAndWait:
        [privateContext performBlock:^{
            // Execute your fetch
            NSArray *privateObjects = [class MR_findAllWithPredicate:predicate inContext:privateContext];
            // Convert your fetched objects into object IDs which can be pulled out of the main context
            NSArray *privateObjectIDs = [privateObjects valueForKey:@"objectID"];
            // Return to our main thread
            dispatch_async(dispatch_get_main_queue(), ^{
                // Create a new predicate to use to pull our objects out
                NSPredicate *mainPredicate = [NSPredicate predicateWithFormat:@"self IN %@", privateObjectIDs];
                // Execute your fetch
                NSArray *finalResults = [class MR_findAllWithPredicate:mainPredicate];
                completion(finalResults,nil);
                // Now you can use finalResults however you need from the main thread
            });
        }];
    }
    else
    {
        NSError *error = [NSError errorWithDomain:@"ITG.xSport" code:-1 userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(@"Error while fetching entities by predicate", nil), NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Predicate should not be nil", nil)}];
        if (completion) completion(nil,error);
    }
}

-(void) entitiesForClass: (Class) class
             ByAttribute:(NSString*) attribute
               ascending:(BOOL) ascending
             WithPredicate:(NSPredicate*) predicate
              Completion:(SuccessBlock)completion

{
    if (attribute  &&
        [class respondsToSelector:@selector(MR_findAllSortedBy: ascending: withPredicate:inContext:)])
    {
        // Create a child context of our main context
        NSManagedObjectContext *privateContext = [NSManagedObjectContext MR_context];
        // When using private contexts you must execute the core data code in it's private queue using performBlock: or performBlockAndWait:
        [privateContext performBlock:^{
            // Execute your fetch
            NSArray *privateObjects = [class MR_findAllSortedBy:attribute ascending:ascending withPredicate:predicate inContext:privateContext];
            // Convert your fetched objects into object IDs which can be pulled out of the main context
            NSArray *privateObjectIDs = [privateObjects valueForKey:@"objectID"];
            // Return to our main thread
            dispatch_async(dispatch_get_main_queue(), ^{
                // Create a new predicate to use to pull our objects out
                NSPredicate *mainPredicate = [NSPredicate predicateWithFormat:@"self IN %@", privateObjectIDs];
                // Execute your fetch
                NSArray *finalResults = [class MR_findAllSortedBy:attribute ascending:ascending withPredicate:mainPredicate];
                completion(finalResults,nil);
                // Now you can use finalResults however you need from the main thread
            });
        }];
    }
    else
    {
        NSError *error = [NSError errorWithDomain:@"ITG.xSport" code:-1 userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(@"Error while fetching entities by atribute with predicate", nil), NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Predicate should not be nil", nil)}];
        if (completion) completion(nil,error);
    }
    
}

-(void) entitiesForClass: (Class) class
        sortedByComparator: (NSComparator) comparator
          WithCompletion:(SuccessBlock)completion

{
    NSOperationQueue *eQueue = [[NSOperationQueue alloc] init];
    eQueue.name = @"Fetching entity queue";
    // check if class can perfom find method
    if ([class respondsToSelector:@selector(MR_findAllInContext:)])
    {
        
        // Create a child context of our main context
        NSManagedObjectContext *privateContext = [NSManagedObjectContext MR_context];
        // When using private contexts you must execute the core data code in it's private queue using performBlock: or performBlockAndWait:
        [privateContext performBlock:^{
            // Execute your fetch
            NSArray *privateObjects = [class MR_findAllInContext:privateContext];
            // Convert your fetched objects into object IDs which can be pulled out of the main context
            if (comparator)
                privateObjects = [privateObjects sortedArrayUsingComparator:comparator];
            NSArray *privateObjectIDs = [privateObjects valueForKey:@"objectID"];
            // Return to our main thread
            dispatch_async(dispatch_get_main_queue(), ^{
                // Create a new predicate to use to pull our objects out
                NSPredicate *mainPredicate = [NSPredicate predicateWithFormat:@"self IN %@", privateObjectIDs];
                // Execute your fetch
                NSArray *finalResults = [class MR_findAllWithPredicate:mainPredicate];
                completion(finalResults,nil);
                // Now you can use finalResults however you need from the main thread
            });
        }];
        
    }
    else
    {
        NSError *error = [NSError errorWithDomain:@"ITG.xSport" code:-1 userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(@"Error while fetching entities", nil), NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"class does not respond 'findAll' selector", nil)}];
        if (completion) completion(nil,error);
    }
}


-(void) removeAllDataFromKeychain
{
    NSArray *secItemClasses = @[(__bridge id)kSecClassGenericPassword,
                                (__bridge id)kSecClassInternetPassword,
                                (__bridge id)kSecClassCertificate,
                                (__bridge id)kSecClassKey,
                                (__bridge id)kSecClassIdentity];
    for (id secItemClass in secItemClasses) {
        NSDictionary *spec = @{(__bridge id)kSecClass: secItemClass};
        SecItemDelete((__bridge CFDictionaryRef)spec);
    }
}




-(void) setPushIDForUser: (NSString*) pushId
{
       _push_id = pushId;
}

-(NSString*) pushIDForUser
{
    return _push_id;
}


- (NSOperation *)registrationWithemail:(NSString *)email
                              password:(NSString *)password
                             cellphone:(NSString *)cellphone
                            completion:(void (^)(NSNumber *result, NSError *error))completion
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        if (completion)
            completion(@YES,nil);
    });
    
//    ITGApiClient *apiClient = [[ITGApiClient alloc] init];
//    
//    return [apiClient registrationWithMD5:[self md5] login:login password:password email:email name:name agree:agree completion:^(id response, NSString *error) {
//        __block NSError *errorLogin = nil;
//        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
//            NSDictionary *loginResponce = response;
//            if ([[loginResponce objectForKey:@"Status"] isEqualToString:@"Ok"])
//            {
//                ITGUser *user = [ITGUser MR_findFirstInContext:localContext];
//                if (!user) user = [ITGUser MR_createInContext:localContext];
//                user.login = login;
//                user.email = email;
//                user.name = name;
//                user.password = password;
//                user.authorized = [NSNumber numberWithBool:YES];
//                user.subscribe_push = @YES;
//            }
//            else
//            {
//                NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
//                NSArray *errorIds = [loginResponce objectForKey:@"ErrorID"];
//                NSArray *errorTexts = [loginResponce objectForKey:@"ErrorText"];
//                for (int i = 0; i<[errorIds count] ; i++) {
//                    NSString *key = [errorIds objectAtIndex:i];
//                    NSString *text = [errorTexts objectAtIndex:i];
//                    [userInfo setObject:text forKey:key];
//                }
//                errorLogin = [NSError errorWithDomain:@"ITG.com" code:-1 userInfo:userInfo
//                                  ];
//            }
//        } completion:^(BOOL success, NSError *error) {
//            if (completion)
//            {
//                if (errorLogin)
//                    completion(@NO, errorLogin);
//                else
//                    completion(@YES, errorLogin);
//            }
//        }] ;
//        
//    }];
    return nil;
}

- (NSOperation *)loginWithLogin:(NSString *)login
                       password:(NSString *)password
                     completion:(void (^)(NSNumber *result, NSError *error))completion
{
//    ITGApiClient *apiClient = [[ITGApiClient alloc] init];
//    
//    return [apiClient loginWithMD5:[self md5] login:login password:password completion:^(id responce, NSString *error){
//        __block NSError *errorLogin = nil;
//        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext){
//            NSDictionary *loginResponce = responce;
//            ITGUser *user = [ITGUser MR_findFirstInContext:localContext];
//            if ([[loginResponce objectForKey:@"Status"] isEqualToString:@"Ok"]) {
//               
//                if (user) {
//                    user.authorized = [NSNumber numberWithBool:YES];
//                } else {
//                    user = [ITGUser MR_createInContext:localContext];
//                    user.login = login;
//                    user.password = password;
//                    user.authorized = [NSNumber numberWithBool:YES];
//                    user.subscribe_push = @YES;
//                }
//            } else {
//                user.authorized = [NSNumber numberWithBool:NO];
//                NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
//                NSArray *errorIds = [loginResponce objectForKey:@"ErrorID"];
//                NSArray *errorTexts = [loginResponce objectForKey:@"ErrorText"];
//                for (int i = 0; i<[errorIds count] ; i++) {
//                    NSString *key = [errorIds objectAtIndex:i];
//                    NSString *text = [errorTexts objectAtIndex:i];
//                    [userInfo setObject:text forKey:key];
//                }
//                errorLogin = [NSError errorWithDomain:@"ITG.com" code:-1 userInfo:userInfo
//                              ];
//            }
//        } completion:^(BOOL success, NSError *error) {
//            if (completion)
//            {
//                if (errorLogin)
//                    completion(@NO, errorLogin);
//                else
//                    completion(@YES, errorLogin);
//            }
//        } ];
//    }];
    return nil;
}


- (NSOperation *)logoutWithCompletion:(void (^)(NSNumber *result, NSError *error))completion
{
//    ITGApiClient *apiClient = [[ITGApiClient alloc] init];
//    
//    return [apiClient logoutWithMD5:[self md5] completion:^(id responce, NSString *error){
//        __block NSError *errorLogout = nil;
//        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext){
//            NSDictionary *logoutResponce = responce;
//            if ([[logoutResponce objectForKey:@"Status"] isEqualToString:@"Ok"]) {
//                ITGUser *user = [ITGUser MR_findFirstInContext:localContext];
//                user.authorized = [NSNumber numberWithBool:NO];
//            }
//            else {
//                NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
//                NSArray *errorIds = [logoutResponce objectForKey:@"ErrorID"];
//                NSArray *errorTexts = [logoutResponce objectForKey:@"ErrorText"];
//                for (int i = 0; i<[errorIds count] ; i++) {
//                    NSString *key = [errorIds objectAtIndex:i];
//                    NSString *text = [errorTexts objectAtIndex:i];
//                    [userInfo setObject:text forKey:key];
//                }
//                errorLogout = [NSError errorWithDomain:@"ITG.com" code:-1 userInfo:userInfo
//                              ];
//            }
//        } completion:^(BOOL success, NSError *error) {
//            if (completion)
//            {
//                if (errorLogout)
//                    completion(@NO, errorLogout);
//                else
//                    completion(@YES, errorLogout);
//            }
//        }];
//    }];
    return nil;
}

@end
