//
//  MCCanvas.m
//  CanvasApp
//
//  Created by mocca on 2015. 9. 22..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "MCCanvas.h"

@implementation MCCanvas

{
    NSMutableArray *shapes;
    bool           isRecordMode;
    bool           isPlayMode;
    MCShape        *newShape;
    MCShape        *lastShape;
    NSTimer        *timer;
    int            currentShapeIndex;
}

@synthesize isRecordMode = isRecordMode;
@synthesize isPlayMode = isPlayMode;
@synthesize pointTransferDelegate = pointTransferDelegate;

- (instancetype)init {
    self = [super init];
    if (self) {
        shapes = [[NSMutableArray alloc] init];
        isRecordMode = false;
        isPlayMode = false;
        timer = nil;
    }
    return self;
}

- (void)play {
    if (timer != nil) return;
    isPlayMode = true;
    currentShapeIndex = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:.025 target:self selector:@selector(sendNextMCPoint) userInfo:nil repeats:"YES"];
}

- (void)stop {
    [timer invalidate];
    timer = nil;
    isPlayMode = false;
}

- (void)record {
    isRecordMode = !isRecordMode;
}

- (void)clear {
    shapes = nil;
    shapes = [[NSMutableArray alloc] init];
}

- (void)sendNextMCPoint {
    if (currentShapeIndex >= [shapes count]) {
        [self stop];
        return;
    }
    MCShape *currShape = [shapes objectAtIndex:currentShapeIndex];
    MCPoint *currPoint = [currShape next];
    if (currPoint == nil) {
        currentShapeIndex++;
        return;
    }
    [self sendMCPoint:currPoint];
}

- (void)recieveMCPoint:(MCPoint *)mcPoint {
    if (isPlayMode) return;
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
        [lastShape addMCPoint:mcPoint];
    }
}

- (void)sendMCPoint:(MCPoint *)mcPoint {
    [pointTransferDelegate sendMCPoint:mcPoint from:[self class]];
}

@end
