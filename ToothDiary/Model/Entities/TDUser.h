//
//  TDUser.h
//  ToothDiary
//
//  Created by   Doro on 10/28/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TDUser;

@interface TDUser : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSData * photoData;
@property (nonatomic, retain) NSString * eMail;
@property (nonatomic, retain) NSMutableSet *familyMembers;
@property (nonatomic, retain) NSMutableSet *teethInfo;
@end

@interface TDUser (CoreDataGeneratedAccessors)

- (void)addFamilyMembersObject:(TDUser *)value;
- (void)removeFamilyMembersObject:(TDUser *)value;
- (void)addFamilyMembers:(NSSet *)values;
- (void)removeFamilyMembers:(NSSet *)values;

- (void)addTeethInfoObject:(NSManagedObject *)value;
- (void)removeTeethInfoObject:(NSManagedObject *)value;
- (void)addTeethInfo:(NSSet *)values;
- (void)removeTeethInfo:(NSSet *)values;

@end
