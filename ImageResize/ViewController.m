//
//  ViewController.m
//  ImageResize
//
//  Created by ChenYuanfu on 2019/5/23.
//  Copyright © 2019 ChenYuanfu. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Resize.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"resourceImage" ofType:@"jpg"];
    
    UIImage *sourceImage = [UIImage imageWithContentsOfFile:path];

    UIImage *scaleFillImage =  [sourceImage resize:CGSizeMake(1000, 1000) fillColor:UIColor.redColor mode:ImageResizeModeScaleFill];
    
    UIImage *aspectFitImage =  [sourceImage resize:CGSizeMake(1000, 1000) fillColor:UIColor.redColor mode:ImageResizeModeAspectFit];
    
    UIImage *aspectFillImage =  [sourceImage resize:CGSizeMake(1000, 1000) fillColor:UIColor.redColor mode:ImageResizeModeAspectFill];
    
    NSLog(@"");
}

@end
