//
//  ZghCustomButton.m
//  MyFirstCocoaDemo
//
//  Created by zhouguanghui on 2023/3/30.
//

#import "ZGHCustomButton.h"
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "UIImage+ZGHGradient.h"

@interface ZGHCustomButton ()

@property (nonatomic, strong) UIButton *backGroundButton;//button
@property (nonatomic, strong) UILabel *titleLabel;//标题
@property (nonatomic, strong) UIImageView *buttonImageView;//按钮图片view
@property (nonatomic, copy) BUttonClickBlock buttonClickBlock;
@property (nonatomic, strong) UIImage *normalImage;//

@end


@implementation ZGHCustomButton

- (void)layoutSubviews {
    [super layoutSubviews];
    NSDictionary *textFont;
    if (!self.titleFont) {
        textFont = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    } else {
        textFont = @{NSFontAttributeName:self.titleFont};
    }
    CGSize textSize = [self.titleLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX,CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:textFont context:nil].size;
    
    CGFloat imageTextMarginOffset = (self.frame.size.width - self.buttonImageView.image.size.width - self.spacing - textSize.width)/2.0;
    
    switch (self.layoutStyle) {
        case ZGHButtonLayoutImageNormal: {
          //仅显示图片
            if ([self isEmptyString:self.title]) {
                [self.buttonImageView remakeConstraints:^(MASConstraintMaker *make) {
                    make.center.offset(0);
                    make.height.lessThanOrEqualTo(self.bounds.size.height);
                    make.width.lessThanOrEqualTo(self.bounds.size.width);
                }];
            }else{
                //仅显示文字
                [self.titleLabel remakeConstraints:^(MASConstraintMaker *make) {
                    make.center.offset(0);
                }];
            }
            
        }
            break;
            //图片在文字上方并设置间距
        case ZGHButtonLayoutImageTop:{
            [self.buttonImageView remakeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.mas_centerY).offset(- self.spacing/2.0);
                make.centerX.offset(0);
            }];
            [self.titleLabel remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_centerY).offset(self.spacing/2.0);
                make.centerX.offset(0);
            }];
        }
            break;
            //图片在文字下方并设置间距
        case ZGHButtonLayoutImageBottom:{
            
            [self.titleLabel remakeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.mas_centerY).offset(- self.spacing/2.0);
                make.centerX.offset(0);
            }];
            [self.buttonImageView remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_centerY).offset(self.spacing/2.0);
                make.centerX.offset(0);
            }];
        }
            break;
            //图片在文字左边并设置间距
        case ZGHButtonLayoutImageLeft:{
            [self.buttonImageView remakeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(imageTextMarginOffset);
                make.centerY.offset(0);
            }];
            [self.titleLabel remakeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-imageTextMarginOffset);
                make.centerY.offset(0);
            }];
        }
            break;
            //图片在文字右边并设置间距
        case ZGHButtonLayoutImageRight:{
            [self.titleLabel remakeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(imageTextMarginOffset);
                make.centerY.offset(0);
            }];
            [self.buttonImageView remakeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-imageTextMarginOffset);
                make.centerY.offset(0);
            }];
        }
            break;
            //图片在文字左并设置左右边距
        case ZGHButtonLayoutImageLeftMargin:{
           
            [self.buttonImageView remakeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(self.marginOffset);
                make.centerY.offset(0);
            }];
            [self.titleLabel remakeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-self.marginOffset);
                make.centerY.offset(0);
            }];
        }
            break;
            //图片在文字右并设置左右边距
        case ZGHButtonLayoutImageRightMargin:{
            [self.titleLabel remakeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(self.marginOffset);
                make.centerY.offset(0);
            }];
            [self.buttonImageView remakeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-self.marginOffset);
                make.centerY.offset(0);
            }];
        }
            break;
            //图片在文字上并设置上下边距
        case ZGHButtonLayoutImageTopMargin:{
            [self.buttonImageView remakeConstraints:^(MASConstraintMaker *make) {
                make.top.offset(self.marginOffset);
                make.centerX.offset(0);
            }];
            [self.titleLabel remakeConstraints:^(MASConstraintMaker *make) {
                make.bottom.offset(-self.marginOffset);
                make.centerX.offset(0);
            }];
        }
            break;
            //图片在文字下并设置上下边距
        case ZGHButtonLayoutImageBottomMargin:{
            [self.titleLabel remakeConstraints:^(MASConstraintMaker *make) {
                make.top.offset(self.marginOffset);
                make.centerX.offset(0);
            }];
            [self.buttonImageView remakeConstraints:^(MASConstraintMaker *make) {
                make.bottom.offset(-self.marginOffset);
                make.centerX.offset(0);
            }];
        }
            break;
            
        default:
            break;
    }
    
    
    [self layoutIfNeeded];
    
}

///创建时只设置标题
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title buttonClickBlock:(BUttonClickBlock)block {
    
    if (self = [super initWithFrame:frame]) {
        [self setupDefaultAttribute];
        self.title = title;
        [self.backGroundButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        self.buttonClickBlock = block;
    }
    return self;
}

///创建时只设置图片
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image buttonClickBlock:(BUttonClickBlock)block {
    
    if (self = [super initWithFrame:frame]) {
        [self setupDefaultAttribute];
        self.buttonImageView.image = image;
        self.normalImage = image;
        [self.backGroundButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        self.buttonClickBlock = block;
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image layoutStyle:(ZGHButtonLayoutStyle)layoutStyle spacing:(CGFloat)spacing buttonClickBlock:(BUttonClickBlock)buttonClickBlock {
    
    if (self = [super initWithFrame:frame]) {
        [self setupDefaultAttribute];
        self.title = title;
        self.buttonImageView.image = image;
        self.normalImage = image;
        self.layoutStyle = layoutStyle;
        self.spacing = spacing;
        [self.backGroundButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        self.buttonClickBlock = buttonClickBlock;
        
    }
    return self;
    
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title image:(UIImage *)image layoutStyle:(ZGHButtonLayoutStyle)layoutStyle marginOffset:(CGFloat)marginOffset buttonClickBlock:(BUttonClickBlock)buttonClickBlock{
    if (self = [super initWithFrame:frame]) {
        [self setupDefaultAttribute];
        self.title = title;
        self.buttonImageView.image = image;
        self.normalImage = image;
        self.layoutStyle = layoutStyle;
        self.marginOffset = marginOffset;
        [self.backGroundButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        self.buttonClickBlock = buttonClickBlock;
        
    }
    return self;
    
}


- (void)buttonClick:(UIButton*)sender {
    if (self.buttonClickBlock) {
        self.buttonClickBlock();
    }
}

///设置按钮的阴影
- (void)setBUttonShadowLayerRadius:(CGFloat)radius shadowColor:(UIColor *)color shadowCorner:(CGFloat)corner shadowSide:(ZGHButtonShadowSideType)side {
    CALayer  *layer = [CALayer layer];
    layer.name = @"shadow";
    layer.frame = self.backGroundButton.frame;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowColor = [color CGColor];
    layer.shadowOpacity = 0.8;
    layer.shadowRadius = radius;
    
    switch (side) {
        case ZGHButtonShadowAllSideType: {
            layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.backGroundButton.bounds.size.width, self.backGroundButton.bounds.size.height) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(corner, corner)].CGPath;
        }
            break;
        case ZGHButtonShadowTopSideType: {
            layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(radius/2.0, -radius, self.backGroundButton.bounds.size.width-radius, self.backGroundButton.bounds.size.height) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(corner, corner)].CGPath;
        }
            break;
        case ZGHButtonShadowBottomSideType: {
            layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(radius/2.0, radius, self.backGroundButton.bounds.size.width-radius, self.backGroundButton.bounds.size.height) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(corner, corner)].CGPath;
        }
            break;
        case ZGHButtonShadowLeftSideType: {
            layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(-radius, radius/2.0, self.backGroundButton.bounds.size.width, self.backGroundButton.bounds.size.height-radius) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(corner, corner)].CGPath;
        }
            break;
        case ZGHButtonShadowRightSideType: {
            layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(radius, radius/2.0, self.backGroundButton.bounds.size.width, self.backGroundButton.bounds.size.height-radius) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(corner, corner)].CGPath;
        }
            break;
            
        default:
            break;
    }
    
    [self.layer insertSublayer:layer below:self.backGroundButton.layer];
    
}

///设置渐变色
- (void)setButtonGradientColors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    UIImage *backGroundImage;
    if (startPoint.x == endPoint.x && endPoint.y > startPoint.x) {
        backGroundImage = [UIImage zgh_gradientColorImageFromColors:colors gradientType:ZGHGradientTypeTopToBottom imageSize:self.backGroundButton.bounds.size];
    } else if (startPoint.x < endPoint.x&&startPoint.y == endPoint.y) {
        
        backGroundImage = [UIImage zgh_gradientColorImageFromColors:colors gradientType:ZGHGradientTypeLeftToRight imageSize:self.backGroundButton.bounds.size];
        
    } else if (startPoint.x < endPoint.x && startPoint.y < endPoint.y) {
       
        backGroundImage = [UIImage zgh_gradientColorImageFromColors:colors gradientType:ZGHGradientTypeUpleftToLowright imageSize:self.backGroundButton.bounds.size];

    }else{
        backGroundImage = [UIImage zgh_gradientColorImageFromColors:colors gradientType:ZGHGradientTypeUprightToLowleft imageSize:self.backGroundButton.bounds.size];
    }
    
    [self.backGroundButton setImage:backGroundImage forState:UIControlStateNormal];
}

- (void)setupDefaultAttribute {
    self.titleColor = [UIColor blackColor];
    self.titleFont = [UIFont systemFontOfSize:15];
    self.norBackgroundColor = [UIColor whiteColor];
    self.spacing = 2;
    self.marginOffset = 2;
    self.select = NO;
}

#pragma mark - setter
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
    [self layoutSubviews];
}

- (void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
    self.titleLabel.font = titleFont;
    [self layoutSubviews];
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    self.titleLabel.textColor = titleColor;
    [self layoutSubviews];
}

- (void)setNorBackgroundColor:(UIColor *)norBackgroundColor {
    _norBackgroundColor = norBackgroundColor;
    self.backgroundColor = norBackgroundColor;
    [self layoutSubviews];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor{
    UIImage *bgImage = [UIImage zgh_createImageWithColor:backgroundColor withSize:self.backGroundButton.bounds.size];
    [self.backGroundButton setImage:bgImage forState:UIControlStateNormal];
}


- (void)setButtonCornerRadius:(CGFloat)radius {
    self.backGroundButton.imageView.layer.cornerRadius = radius;
    self.backGroundButton.imageView.clipsToBounds = YES;
    [self layoutSubviews];
}

- (void)setSpacing:(CGFloat)spacing {
    _spacing = spacing;
    [self layoutSubviews];
}

- (void)setMarginOffset:(CGFloat)marginOffset {
    _marginOffset = marginOffset;
    [self layoutSubviews];
}

- (void)setLayoutStyle:(ZGHButtonLayoutStyle)layoutStyle {
    _layoutStyle = layoutStyle;
    [self layoutSubviews];
}

- (void)setSelect:(BOOL)select {
    _select = select;
    if (select) {
        if (self.selectBackGroundColor) {
            self.backgroundColor = self.selectBackGroundColor;
        }
        if (self.selectImage) {
            self.buttonImageView.image = self.selectImage;
        }
    }else{
        if (self.norBackgroundColor) {
            self.backgroundColor = self.norBackgroundColor;
        }
        if (self.normalImage) {
            self.buttonImageView.image = self.normalImage;
        }
    }
}


#pragma mark - lazy init

- (UIButton *)backGroundButton {
    
    if (!_backGroundButton) {
        _backGroundButton = [[UIButton alloc]init];
        [self addSubview:_backGroundButton];
        _backGroundButton.frame = self.bounds;
    }
    return _backGroundButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self.backGroundButton addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UIImageView *)buttonImageView {
    if (!_buttonImageView) {
        _buttonImageView = [[UIImageView alloc] init];
        _buttonImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.backGroundButton addSubview:_buttonImageView];
    }
    return _buttonImageView;
}

#pragma mark - Privacy func
- (BOOL)isEmptyString:(NSString *)titleStr {
    if (!titleStr) {
        return YES;
    }
    if ([titleStr isKindOfClass:[NSNull class]]) {
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [titleStr stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    return NO;
}


@end
