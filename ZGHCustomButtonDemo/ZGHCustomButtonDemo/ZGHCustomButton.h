//
//  ZghCustomButton.h
//  MyFirstCocoaDemo
//
//  Created by zhouguanghui on 2023/3/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 按钮图片位置
 */
typedef NS_ENUM(NSInteger, ZGHButtonLayoutStyle) {
    ZGHButtonLayoutImageNormal = 0,    //仅图片或文字并剧中显示
    ZGHButtonLayoutImageTop,           //图片在文字上方并设置间距
    ZGHButtonLayoutImageBottom,        //图片在文字下方并设置间距
    ZGHButtonLayoutImageLeft,          //图片在文字左边并设置间距
    ZGHButtonLayoutImageRight,         //图片在文字右边并设置间距
    ZGHButtonLayoutImageLeftMargin,    //图片在文字左并设置左右边距
    ZGHButtonLayoutImageRightMargin,   //图片在文字右并设置左右边距
    ZGHButtonLayoutImageTopMargin,     //图片在文字上并设置上下边距
    ZGHButtonLayoutImageBottomMargin,  //图片在文字下并设置上下边距
};

/**
  按钮阴影位置
 */
typedef NS_ENUM(NSInteger, ZGHButtonShadowSideType) {
    ZGHButtonShadowAllSideType = 0,  //按钮全部添加阴影
    ZGHButtonShadowTopSideType,      //顶部添加阴影
    ZGHButtonShadowBottomSideType,   //底部添加阴影
    ZGHButtonShadowLeftSideType,     //左边添加阴影
    ZGHButtonShadowRightSideType,    //右边添加阴影
};

typedef void(^BUttonClickBlock)(void);


@interface ZGHCustomButton : UIView


@property (nonatomic, copy) NSString *title;//标题

@property (nonatomic, strong) UIFont *titleFont;//标题字体，默认15

@property (nonatomic, strong) UIColor *titleColor;//标题颜色，默认white

@property (nonatomic, strong) UIColor *norBackgroundColor;//背景色，默认white

@property (nonatomic, strong) UIColor *selectBackGroundColor;//选中背景色，默认white

@property (nonatomic, strong) UIImage *selectImage;//选中时的背景图片

@property (nonatomic, assign) BOOL select;//是否选中

@property (nonatomic, assign) ZGHButtonLayoutStyle layoutStyle;//默认CXButtonLayoutImageNormal

@property (nonatomic, assign) CGFloat spacing;//图片文字间距

@property (assign,nonatomic) CGFloat marginOffset;//图片文字内容两边边距

///创建时只设置标题
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title buttonClickBlock:(BUttonClickBlock)block;

///创建时只设置图片
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image buttonClickBlock:(BUttonClickBlock)block;

/**
 创建按钮
 title：标题
 image：图片
 layoutStyle：CXButtonLayoutStyle 图片布局样式
 spacing：图片文字间距
 buttonClickBlock：点击回调
 */
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image layoutStyle:(ZGHButtonLayoutStyle)layoutStyle spacing:(CGFloat)spacing buttonClickBlock:(BUttonClickBlock)buttonClickBlock;

/**
 创建按钮
 title：标题
 image：图片
 layoutStyle：CXButtonLayoutStyle 图片布局样式
 marginOffset：内容距离左右两边的距离
 buttonClickBlock：点击回调
 */
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image layoutStyle:(ZGHButtonLayoutStyle)layoutStyle marginOffset:(CGFloat)marginOffset buttonClickBlock:(BUttonClickBlock)buttonClickBlock;

/**
 radius:弧度
 */
- (void)setButtonCornerRadius:(CGFloat)radius;


/**
 设置按钮的阴影
 radius: 阴影的宽度
 corner:阴影的弧度
 side:阴影的方向
 */
- (void)setBUttonShadowLayerRadius:(CGFloat)radius shadowColor:(UIColor *)color shadowCorner:(CGFloat)corner shadowSide:(ZGHButtonShadowSideType)side;

/**
 设置渐变色
 startColor 初始色值
 endColor 结束色值
 startPoint,endPoint,当x相等,y不相等,方向是竖的;当y相等,x不相等,方向是横的;当x,y都不相等,则为斜线
 */
- (void)setButtonGradientColors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;


@end

NS_ASSUME_NONNULL_END
