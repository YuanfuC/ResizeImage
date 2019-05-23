//
//  UIImage+Resize.m
//  ImageResize
//
//  Created by ChenYuanfu on 2019/5/23.
//  Copyright © 2019 ChenYuanfu. All rights reserved.
//

#import "UIImage+Resize.h"

@implementation UIImage (Resize)


- (UIImage *)resize:(CGSize)size fillColor:(UIColor *)color mode:(ImageResizeMode)mode {
    
    CGSize imageSize = self.size;
    
    CGFloat widthRatio = size.width/imageSize.width;
    CGFloat heightRatio = size.height/imageSize.height;
    CGRect targetImageDrawRect = CGRectMake(0, 0, 0, 0);
    
    switch (mode) {
        case ImageResizeModeScaleFill:
        {
            targetImageDrawRect = CGRectMake(0, 0, size.width, size.height);
        }
            break;
            
        case ImageResizeModeAspectFit:
        {
            if (widthRatio > heightRatio) {
                targetImageDrawRect = CGRectMake((size.width - imageSize.width * heightRatio) * 0.5,
                                                 0,
                                                 imageSize.width * heightRatio,
                                                 imageSize.height * heightRatio);
            } else {
                targetImageDrawRect = CGRectMake(0,
                                                 (size.height - imageSize.height * widthRatio) * 0.5,
                                                 imageSize.width * widthRatio,
                                                 imageSize.height * widthRatio);
            }
        }
            break;
        case ImageResizeModeAspectFill:
        {
            if (widthRatio > heightRatio) {
                
                targetImageDrawRect = CGRectMake(0,
                                                 (size.height - imageSize.height * widthRatio) * 0.5,
                                                 imageSize.width * widthRatio,
                                                 imageSize.height * widthRatio);
            } else {
                targetImageDrawRect = CGRectMake((size.width - imageSize.width * heightRatio) * 0.5,
                                                 0,
                                                 imageSize.width * heightRatio,
                                                 imageSize.height * heightRatio);
            }
        }
            break;
            
    }
    
    UIGraphicsBeginImageContextWithOptions(size, false, 1.0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    
    [self drawInRect:targetImageDrawRect blendMode:kCGBlendModeCopy alpha:1.0];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)resize:(CGSize)size {
    return [self resize:size fillColor:[UIColor blackColor] mode:ImageResizeModeAspectFit];
}

- (UIImage *)resize:(CGSize)size fillColor:(UIColor *)color {
    return [self resize:size fillColor:color mode:ImageResizeModeAspectFit];
}

- (UIImage *)resize:(CGSize)size mode:(ImageResizeMode)mode {
    return [self resize:size fillColor:[UIColor blackColor] mode:mode];
}


@end
