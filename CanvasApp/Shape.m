//
//  Shape.m
//  CanvasApp
//
//  Created by mocca on 2015. 9. 22..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "Shape.h"

@implementation Shape

{
    NSMutableArray* mcPoints;
}

@synthesize mcPoints = mcPoints;

-(instancetype)initWithCGPoint:(CGPoint) cgPoint {
    self = [super init];
    if (self) {
        MCPoint* mcPoint = [[MCPoint alloc] initWithCGPoint:cgPoint];
        mcPoints = [[NSMutableArray alloc] init];
        [mcPoints addObject:mcPoint];
    }
    return self;
}

-(void)addMcPointsFromCGPoint:(CGPoint) cgPoint{
    MCPoint* mcPoint = [[MCPoint alloc] initWithCGPoint:cgPoint];
    [mcPoints addObject:mcPoint];
}

-(int)shapeSize{
    return (int)[mcPoints count];
}

@end
