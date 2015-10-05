//
//  MCShape.m
//  CanvasApp
//
//  Created by mocca on 2015. 9. 22..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "MCShape.h"

@implementation MCShape

#pragma mark property
{
    NSMutableArray* mcPoints;
}

@synthesize mcPoints = mcPoints;

#pragma mark Initialize method
- (instancetype)initWithMCPoint:(MCPoint *) mcPoint {
    self = [super init];
    if (self) {
        mcPoints = [[NSMutableArray alloc] init];
        [mcPoints addObject:mcPoint]; //retain
    }
    return self;
}

#pragma mark Property control method
- (int)shapeSize{
    return (int)[mcPoints count];
}

@end
