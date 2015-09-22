//
//  MCPoint.m
//  CanvasApp
//
//  Created by mocca on 2015. 9. 22..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "MCPoint.h"

@implementation MCPoint

{
    float x;
    float y;
}

@synthesize x = x;
@synthesize y = y;

-(instancetype)initWithCGPoint:(CGPoint)cgPoint {
    self = [super init];
    if (self) {
        x = cgPoint.x;
        y = cgPoint.y;
    }
    return self;
}

@end
