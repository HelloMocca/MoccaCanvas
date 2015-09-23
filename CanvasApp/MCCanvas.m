//
//  MCCanvas.m
//  CanvasApp
//
//  Created by mocca on 2015. 9. 22..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "MCCanvas.h"

@implementation MCCanvas

#pragma mark property
{
    //public
    bool           isRecordMode;
    
    //private
    NSMutableArray *shapes;
    MCShape        *newShape;
    MCShape        *lastShape;
    NSTimer        *timer;
    int currentShapeIndex;
    int currentPointIndex;
}

@synthesize isRecordMode = isRecordMode;
@synthesize pointTransferDelegate = pointTransferDelegate;

- (instancetype)init {
    self = [super init];
    if (self) {
        shapes = [[NSMutableArray alloc] init];
        isRecordMode = false;
        timer = nil;
    }
    return self;
}

- (void)play {
    if (timer != nil) return;
    currentShapeIndex = 0;
    currentPointIndex = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:.025 target:self selector:@selector(sendNextMCPoint) userInfo:nil repeats:"YES"];
}

- (void)clear {
    shapes = nil;
    shapes = [[NSMutableArray alloc] init];
}

- (void)sendNextMCPoint {
    if (currentShapeIndex >= [shapes count]) {
        [timer invalidate];
        timer = nil;
        return;
    }
    MCShape *currShape = [shapes objectAtIndex:currentShapeIndex];
    if (currentPointIndex >= [currShape shapeSize]) {
        currentPointIndex = 0;
        currentShapeIndex++;
        return;
    }
    MCPoint *currPoint = [[currShape mcPoints] objectAtIndex:currentPointIndex];
    [self sendMCPoint:currPoint];
    currentPointIndex++;
}

- (void)recieveMCPoint:(MCPoint *)mcPoint {
    if (isRecordMode) {
        [self recordMCpoint:mcPoint];
    }
    [self sendMCPoint:mcPoint];
}

- (void)recordMCpoint:(MCPoint *)mcPoint {
    if ([mcPoint isBeganPoint]) {
        newShape = [[MCShape alloc] initWithMCPoint:mcPoint];
        [shapes addObject:newShape];
    } else {
        lastShape = [shapes lastObject];
        [[lastShape mcPoints] addObject:mcPoint];
    }
}

- (void)sendMCPoint:(MCPoint *)mcPoint {
    [pointTransferDelegate sendMCPoint:mcPoint from:[self class]];
}

@end
