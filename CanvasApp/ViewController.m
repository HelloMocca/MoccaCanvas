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

{
    CanvasView *canvasView;
    MCCanvas *mcCanvas;
    CGSize screenSize;
    
    UIButton *recordBtn;
    UIButton *playBtn;
}

#pragma mark ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    mcCanvas = [[MCCanvas alloc] init];
    [mcCanvas setPointTransferDelegate:self];
    screenSize = [[UIScreen mainScreen] bounds].size;
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    [self addSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Protocol
- (void)sendMCPoint:(MCPoint *)mcPoint from:(Class)aClass{
    if ([[[aClass alloc] init] isKindOfClass:[CanvasView class]]) {
        [mcCanvas recieveMCPoint:mcPoint];
    } else {
        [canvasView receiveMCPoint:mcPoint];
    }
}

#pragma mark Event method
- (IBAction)recordCanvas:(id)sender {
    if ([mcCanvas isRecordMode]) {
        [mcCanvas setIsRecordMode:false];
        [recordBtn setTitle:@"RECORD" forState:UIControlStateNormal];
        [recordBtn setBackgroundColor:[UIColor darkGrayColor]];
        [playBtn setBackgroundColor:[UIColor darkGrayColor]];
    } else {
        [mcCanvas setIsRecordMode:true];
        [canvasView clear];
        [mcCanvas clear];
        [recordBtn setTitle:@"STOP" forState:UIControlStateNormal];
        [recordBtn setBackgroundColor:[UIColor redColor]];
        [playBtn setBackgroundColor:[UIColor lightGrayColor]];
    }
}

- (IBAction)playCanvas:(id)sender {
    if ([mcCanvas isRecordMode]) return;
    [canvasView clear];
    [mcCanvas play];
}

- (IBAction)clearCanvas:(id)sender {
    if ([mcCanvas isRecordMode]) [mcCanvas clear];
    [canvasView clear];
}

#pragma mark Setup method
- (void)addSubViews {
    CGFloat width = screenSize.width;
    CGFloat height = screenSize.height;
    canvasView = [[CanvasView alloc] initWithFrame:CGRectMake(0, 20, width, height-80)];
    [canvasView setPointTransferDelegate:self];
    [[self view] addSubview:canvasView];
    [self setupButtons];
}

//TODO refactoring this
- (void)setupButtons {
    CGFloat width = screenSize.width;
    CGFloat height = screenSize.height;
    recordBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [recordBtn setFrame:CGRectMake(width * 0/3, height-60, width/3 - 1, 60)];
    [recordBtn setTitle:@"RECORD" forState:UIControlStateNormal];
    [recordBtn setBackgroundColor:[UIColor darkGrayColor]];
    [recordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [recordBtn addTarget:self action:@selector(recordCanvas:) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:recordBtn];
    
    playBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [playBtn setFrame:CGRectMake(width * 1/3, height-60, width/3 - 1, 60)];
    [playBtn setTitle:@"PLAY" forState:UIControlStateNormal];
    [playBtn setBackgroundColor:[UIColor lightGrayColor]];
    [playBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [playBtn addTarget:self action:@selector(playCanvas:) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:playBtn];
    
    UIButton *clearBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [clearBtn setFrame:CGRectMake(width * 2/3, height-60, width/3 - 1, 60)];
    [clearBtn setTitle:@"CLEAR" forState:UIControlStateNormal];
    [clearBtn setBackgroundColor:[UIColor darkGrayColor]];
    [clearBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(clearCanvas:) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:clearBtn];
}

@end
