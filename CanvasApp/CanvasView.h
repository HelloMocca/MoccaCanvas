//
//  CanvasView.h
//  CanvasApp
//
//  Created by mocca on 2015. 9. 21..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCCanvas.h"
#import "MCPointTransferProtocol.h"

@interface CanvasView : UIView

@property (nonatomic, weak) id<MCPointTransferProtocol> pointTransferDelegate;

-(instancetype)initWithFrame:(CGRect)frame;

-(void)clear;

-(void)receiveMCPoint:(MCPoint *)mcPoint;

@end
