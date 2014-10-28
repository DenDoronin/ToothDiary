//
//  SlideMenuModel.m
//  ToothDiary
//
//  Created by   Doro on 10/7/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import "SlideMenuModel.h"

@interface SlideMenuModel()

@property (nonatomic, assign) BOOL canEdit;

@end

@implementation SlideMenuModel

- (instancetype)initWithManagerProvider:(id)provider
{
    if (self = [super init])
    {
        _canEdit = YES;
        [self setup];
    }
    return self;
}

- (void)setup
{
    _titles = [NSMutableArray new];
    [_titles addObject:NSLocalizedString(@"FourthQuater", nil)];
    // Do any additional setup after loading the view.
}


- (void)startActivity
{
    _canEdit = NO;
    //NSParameterAssert(self.delegate);
    if ([self.delegate respondsToSelector:@selector(modelDidStartActivity:)])
    {
        [self.delegate modelDidStartActivity:self];
    }
}

- (void)finishActivity
{
    _canEdit = YES;
    //NSParameterAssert(self.delegate);
    if ([self.delegate respondsToSelector:@selector(modelDidFinishActivity:)])
    {
        [self.delegate modelDidFinishActivity:self];
    }
}

-(NSInteger) numberOfSection
{
    return 1;
}

-(NSInteger) numberOfRowInSection:(NSInteger)section
{
    return [_titles count];
}

-(NSString*) titleForIndexPath:(NSIndexPath *)indexPath
{
    return [_titles objectAtIndex:indexPath.row];
}

-(UIImage*) imageForIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

-(void) didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
