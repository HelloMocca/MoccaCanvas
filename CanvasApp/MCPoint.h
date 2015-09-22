//
//  MCPoint.h
//  CanvasApp
//
//  Created by mocca on 2015. 9. 22..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCPoint : NSObject

@property (nonatomic, readonly) float x;
@property (nonatomic, readonly) float y;

-(instancetype)initWithCGPoint:(CGPoint) cgPoint;

@end
