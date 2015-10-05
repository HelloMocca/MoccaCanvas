//
//  MCCanvas.h
//  CanvasApp
//
//  Created by mocca on 2015. 9. 22..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCPointTransferProtocol.h"
#import "MCShape.h"

@interface MCCanvas : NSObject

@property (nonatomic, readonly) bool isRecordMode;
@property (nonatomic, readonly) bool isPlayMode;
@property (nonatomic, weak) id<MCPointTransferProtocol> pointTransferDelegate;

- (void)recieveMCPoint:(MCPoint *)mcPoint;

- (void)play;

- (void)stop;

- (void)record;

- (void)clear;

@end
