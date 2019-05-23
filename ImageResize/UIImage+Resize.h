//
//  UIImage+Resize.h
//  ImageResize
//
//  Created by ChenYuanfu on 2019/5/23.
//  Copyright © 2019 ChenYuanfu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ImageResizeMode) {
    ImageResizeModeScaleFill,
    ImageResizeModeAspectFit,
    ImageResizeModeAspectFill
};

@interface UIImage (Resize)

- (UIImage *)resize:(CGSize)size;

- (UIImage *)resize:(CGSize)size fillColor:(UIColor *)color;

- (UIImage *)resize:(CGSize)size mode:(ImageResizeMode)mode;

- (UIImage *)resize:(CGSize)size fillColor:(UIColor *)color mode:(ImageResizeMode)mode;
@end

NS_ASSUME_NONNULL_END
