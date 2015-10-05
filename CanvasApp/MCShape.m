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
    NSUInteger      enumerateIndex;
}

#pragma mark Initialize method
- (instancetype)initWithMCPoint:(MCPoint *)mcPoint {
    self = [super init];
    if (self) {
        mcPoints = [[NSMutableArray alloc] init];
        [mcPoints addObject:mcPoint]; //retain
        enumerateIndex = 0;
    }
    return self;
}

#pragma mark Property control method
- (void)addMCPoint:(MCPoint *)mcPoint {
    [mcPoints addObject:mcPoint];
}

- (MCPoint *)mcPointAtIndex:(NSUInteger)index {
    return [mcPoints objectAtIndex:index];
}

- (int)count{
    return (int)[mcPoints count];
}

#pragma mark Enumerate
- (void)enumerateInit {
    enumerateIndex = 0;
}

- (id)next {
    if (enumerateIndex >= [self count]) {
        enumerateIndex = 0;
        return nil;
    }
    MCPoint *mcPoint = [mcPoints objectAtIndex:enumerateIndex];
    enumerateIndex++;
    return mcPoint;
}

@end
