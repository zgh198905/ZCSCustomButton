//
//  UIImage+ZGHGradient.h
//  MyFirstCocoaDemo
//
//  Created by zhouguanghui on 2023/3/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 CxGradientType：图片所填充位置类型
 */
typedef NS_ENUM(NSInteger,ZGHGradientType) {
    ZGHGradientTypeTopToBottom = 0,   //从上到下
    ZGHGradientTypeLeftToRight,       //从左到右
    ZGHGradientTypeUpleftToLowright,  //左上到右下
    ZGHGradientTypeUprightToLowleft,  //右上到左下
};


@interface UIImage (ZGHGradient)


/**
 通过颜色值来填充图片
 color:             UIColor    颜色
 imageSize： CGSize 图片大小
 */
+ (UIImage *)zgh_createImageWithColor:(UIColor *)color withSize:(CGSize)imageSize;

/**
通过颜色数组来填充按钮背景图
 colors:                NSArray<UIColor *> 颜色数组
 gradientType:    CxGradientType 填充类型
 imagSize:            CGSize 图片大小
 */
+ (UIImage *)zgh_gradientColorImageFromColors:(NSArray *)colors gradientType:(ZGHGradientType)gradientType imageSize:(CGSize)imagSize;


@end

NS_ASSUME_NONNULL_END
