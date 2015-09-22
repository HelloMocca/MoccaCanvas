//
//  Shape.h
//  CanvasApp
//
//  Created by mocca on 2015. 9. 22..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCPoint.h"

@interface Shape : NSObject

@property (nonatomic, readonly) NSMutableArray* mcPoints;

-(instancetype)initWithCGPoint:(CGPoint) cgPoint;

-(void)addMcPointsFromCGPoint:(CGPoint) cgPoint;

-(int)shapeSize;

@end
