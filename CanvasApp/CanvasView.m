//
//  CanvasView.m
//  CanvasApp
//
//  Created by mocca on 2015. 9. 21..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "CanvasView.h"
#import "MCShape.h"

@implementation CanvasView

{
    //private
    NSMutableArray *shapes;
    MCShape *newShape;
    MCShape *lastShape;
}

@synthesize pointTransferDelegate = pointTransferDelegate;

#pragma mark Initialize method
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        shapes = [[NSMutableArray alloc] init];
        [self setBackgroundColor:[UIColor colorWithRed:250.0f/255.0f green:244.0f/255.0f blue:192.0f/255.0f alpha:1.0f]];
    }
    return self;
}

#pragma mark Rendering method
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    int shapeCount = (int)[shapes count];
    int i;
    for (i = 0; i < shapeCount; i++) {
        [self drawShape:[shapes objectAtIndex:i] withContext:context];
    }
}

- (void)drawShape:(MCShape *)shape withContext:(CGContextRef)context {
    int shapeSize = [shape shapeSize];
    MCPoint *currentPoint;
    int i;
    CGContextBeginPath(context);
    for (i = 0; i < shapeSize; i++) {
        currentPoint = [[shape mcPoints] objectAtIndex:i];
        if (i == 0) CGContextMoveToPoint(context, currentPoint.x, currentPoint.y);
        CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);
    }
    CGContextStrokePath(context);
}

#pragma mark Property control method
- (void)clear {
    shapes = nil;
    shapes = [[NSMutableArray alloc] init];
    [self setNeedsDisplay];
}

- (void)receiveMCPoint:(MCPoint *)mcPoint {
    if ([mcPoint isBeganPoint]) {
        newShape = [[MCShape alloc] initWithMCPoint:mcPoint];
        [shapes addObject:newShape];
    } else {
        lastShape = [shapes lastObject];
        [[lastShape mcPoints] addObject:mcPoint];
    }
    [self setNeedsDisplay];
}

#pragma mark Event method
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    MCPoint *mcPoint = [[MCPoint alloc] initWithCGPoint:point];
    [mcPoint setIsBeganPoint:true];
    [pointTransferDelegate sendMCPoint:mcPoint from:[self class]];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    MCPoint *mcPoint = [[MCPoint alloc] initWithCGPoint:point];
    [pointTransferDelegate sendMCPoint:mcPoint from:[self class]];
}
@end
