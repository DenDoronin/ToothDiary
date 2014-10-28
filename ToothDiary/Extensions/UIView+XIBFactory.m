//
//  UIView+XIBFactory.m
//  ToothDiary
//
//  Created by   Doro on 10/7/14.
//  Copyright (c) 2014 ToothDiary. All rights reserved.
//

#import "UIView+XIBFactory.h"

@implementation UIView (XIBFactory)

+(instancetype) viewFromXIB
{
    id cell = nil;
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    for(id currentObject in topLevelObjects)
    {
        if([currentObject isKindOfClass:[self class]])
        {
            cell = currentObject;
            break;
        }
    }
    NSParameterAssert(cell);
    return cell;
}

@end
