//
//  MCPointTransferProtocol.h
//  CanvasApp
//
//  Created by mocca on 2015. 9. 23..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCPoint.h"

@protocol MCPointTransferProtocol <NSObject>

@required

- (void)sendMCPoint:(MCPoint *)mcPoint from:(Class)aClass;

@end