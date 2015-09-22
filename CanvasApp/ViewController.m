//
//  ViewController.m
//  CanvasApp
//
//  Created by mocca on 2015. 9. 21..
//  Copyright (c) 2015년 mocca. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CanvasView *canvasView = [[CanvasView alloc] initWithFrame:CGRectMake(0, 20, screenRect.size.width, screenRect.size.height - 80)];
    NSLog(@"addSubView");
    [[self view] addSubview:canvasView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
