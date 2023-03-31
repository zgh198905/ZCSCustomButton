//
//  UIImage+ZGHGradient.m
//  MyFirstCocoaDemo
//
//  Created by zhouguanghui on 2023/3/30.
//

#import "UIImage+ZGHGradient.h"

@implementation UIImage (ZGHGradient)


#pragma mark  通过颜色值来填充图片
+ (UIImage *)zgh_createImageWithColor:(UIColor *)color withSize:(CGSize)imageSize {
    CGRect rect = CGRectMake(0.0f, 0.0f, imageSize.width, imageSize.height);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, color.CGColor);
    CGContextFillRect(contextRef, rect);
    UIImage *coverImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return coverImage;
}

#pragma mark  通过颜色数组来填充按钮背景图
+ (UIImage *)zgh_gradientColorImageFromColors:(NSArray *)colors gradientType:(ZGHGradientType)gradientType imageSize:(CGSize)imagSize {
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (UIColor *color in colors) {
        [mutableArray addObject:(id)color.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(imagSize, YES, 1.0);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSaveGState(contextRef);
    CGColorSpaceRef colorSpacrRef = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradientRef = CGGradientCreateWithColors(colorSpacrRef, (CFArrayRef)mutableArray, NULL);
    CGPoint startPoint;
    CGPoint endPoint;
    switch (gradientType) {
        case ZGHGradientTypeTopToBottom: {
            startPoint = CGPointMake(0.0, 0.0);
            endPoint = CGPointMake(0.0, imagSize.height);
        }
            break;
        case ZGHGradientTypeLeftToRight: {
            startPoint = CGPointMake(0.0, 0.0);
            endPoint = CGPointMake(imagSize.width, 0.0);
        }
            break;
        case ZGHGradientTypeUpleftToLowright: {
            startPoint = CGPointMake(0.0, 0.0);
            endPoint = CGPointMake(imagSize.width, imagSize.height);
        }
            break;
        case ZGHGradientTypeUprightToLowleft: {
            startPoint = CGPointMake(imagSize.width, 0.0);
            endPoint = CGPointMake(0.0, imagSize.height);
        }
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(contextRef, gradientRef, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation );
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradientRef);
    CGContextRestoreGState(contextRef);
    CGColorSpaceRelease(colorSpacrRef);
    UIGraphicsEndImageContext();
    return image;
    
}


@end
