//
//  CanvasView.m
//  CanvasApp
//
//  Created by mocca on 2015. 9. 21..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "CanvasView.h"
#import "Shape.h"

@implementation CanvasView

{
    CGPoint prevPoint;
    CGPoint point;
    NSMutableArray* shapes;
    Shape* tempShape;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        shapes = [[NSMutableArray alloc] init];
        [self setBackgroundColor:[UIColor colorWithRed:250.0f/255.0f green:244.0f/255.0f blue:192.0f/255.0f alpha:1.0f]];
    }
    NSLog(@"initView");
    return self;
}

-(void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    int shapeCount = (int)[shapes count];
    MCPoint* currentPoint;
    int i;
    for (i = 0; i < shapeCount; i++) {
        [self drawShape:[shapes objectAtIndex:i] withContext:context];
    }
    CGContextBeginPath(context);
    int tmpShapeSize = (int)[tempShape shapeSize];
    for (i = 0; i < tmpShapeSize; i++) {
        currentPoint = [[tempShape mcPoints] objectAtIndex:i];
        if (i == 0) CGContextMoveToPoint(context, currentPoint.x, currentPoint.y);
        CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);
    }
    CGContextStrokePath(context);
}

-(void)drawShape:(Shape *)shape withContext:(CGContextRef)context {
    int shapeSize = [shape shapeSize];
    MCPoint* currentPoint;
    int i;
    CGContextBeginPath(context);
    for (i = 0; i < shapeSize; i++) {
        currentPoint = [[shape mcPoints] objectAtIndex:i];
        if (i == 0) CGContextMoveToPoint(context, currentPoint.x, currentPoint.y);
        CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);
    }
    CGContextStrokePath(context);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    tempShape = [[Shape alloc] initWithCGPoint:[[touches anyObject] locationInView:self]];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    point = [touch locationInView:self];
    [tempShape addMcPointsFromCGPoint:point];
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [shapes addObject:tempShape];
}

@end
