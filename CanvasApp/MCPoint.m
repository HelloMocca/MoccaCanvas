//
//  MCPoint.m
//  CanvasApp
//
//  Created by mocca on 2015. 9. 22..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "MCPoint.h"

@implementation MCPoint

#pragma mark property
{
    //public
    float x;
    float y;
    bool  isBeganPoint;
}

@synthesize x = x;
@synthesize y = y;
@synthesize isBeganPoint = isBeganPoint;


#pragma mark Initailze method
- (instancetype)initWithCGPoint:(CGPoint)cgPoint beganPoint:(bool)aBeganPoint{
    self = [super init];
    if (self) {
        x = cgPoint.x;
        y = cgPoint.y;
        isBeganPoint = aBeganPoint;
    }
    return self;
}

#pragma mark Property control method
- (void)setIsBeganPoint:(bool)_isBeganPoint {
    isBeganPoint = _isBeganPoint;
}

@end
