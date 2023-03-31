//
//  ViewController.m
//  ZGHCustomButtonDemo
//
//  Created by zhouguanghui on 2023/3/30.
//

#import "ViewController.h"
#import "ZGHCustomButton.h"
@interface ViewController ()

@property(nonatomic, strong)UIScrollView *backScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.backScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.backScrollView];
    
    //只有标题按钮
    ZGHCustomButton *titleButton = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(30, 100, 100, 50) title:@"只有标题按钮" buttonClickBlock:^{
        NSLog(@"只有标题按钮");
    }];
    titleButton.norBackgroundColor = [UIColor cyanColor];
    titleButton.titleColor = [UIColor redColor];
    titleButton.titleFont = [UIFont systemFontOfSize:12];
    [self.backScrollView addSubview:titleButton];
    
    //只有图片按钮
    ZGHCustomButton *imageButton = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(160, 100, 100, 50) image:[UIImage imageNamed:@"contact_p_select"] buttonClickBlock:^{
        NSLog(@"只有图片按钮");
    }];
    imageButton.norBackgroundColor = [UIColor cyanColor];
    [self.backScrollView addSubview:imageButton];
    
    //设置圆角
    ZGHCustomButton *cornerButton = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(30, 180, 100, 50) image:[UIImage imageNamed:@"contact_p_select"] buttonClickBlock:^{
        NSLog(@"设置圆角");
    }];
    cornerButton.norBackgroundColor = [UIColor cyanColor];
    [cornerButton setButtonCornerRadius:15];
    [self.backScrollView addSubview:cornerButton];
    
    //图片在文字上方并设置间距
    ZGHCustomButton *topImageBtBtn = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(30, 260, 80, 100) title:@"图片在上方" image:[UIImage imageNamed:@"contact_p_select"] layoutStyle:ZGHButtonLayoutImageTop spacing:10 buttonClickBlock:^{
        NSLog(@"图片在上方并设置图片文字间距");
    }];
    topImageBtBtn.backgroundColor = [UIColor cyanColor];
    [self.backScrollView addSubview:topImageBtBtn];
    
    
    //图片在文字下方并设置间距
    ZGHCustomButton *bottomImageBtBtn = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(160, 260, 80, 100) title:@"图片在下方" image:[UIImage imageNamed:@"contact_p_select"] layoutStyle:ZGHButtonLayoutImageBottom spacing:10 buttonClickBlock:^{
        NSLog(@"图片在下方并设置图片文字间距");
    }];
    bottomImageBtBtn.backgroundColor = [UIColor cyanColor];
    [self.backScrollView addSubview:bottomImageBtBtn];
    
    //图片在文字左方并设置间距
    ZGHCustomButton *leftImageBtBtn = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(30, 400, 200,50 ) title:@"图片在左方" image:[UIImage imageNamed:@"contact_p_select"] layoutStyle:ZGHButtonLayoutImageLeft spacing:10 buttonClickBlock:^{
        NSLog(@"图片在左方并设置图片文字间距");
    }];
    leftImageBtBtn.backgroundColor = [UIColor cyanColor];
    [self.backScrollView addSubview:leftImageBtBtn];
    
    //图片在文字右方并设置间距
    ZGHCustomButton *rightImageBtBtn = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(30, 480, 200,50 ) title:@"图片在右方" image:[UIImage imageNamed:@"contact_p_select"] layoutStyle:ZGHButtonLayoutImageRight spacing:10 buttonClickBlock:^{
        NSLog(@"图片在右方并设置图片文字间距");
    }];
    rightImageBtBtn.backgroundColor = [UIColor cyanColor];
    [self.backScrollView addSubview:rightImageBtBtn];
    
    //图片在文字左并设置左右边距
    ZGHCustomButton *leftImageMarginBtn = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(30, 560, 200,50 ) title:@"图片在左方" image:[UIImage imageNamed:@"contact_p_select"] layoutStyle:ZGHButtonLayoutImageLeftMargin marginOffset:15 buttonClickBlock:^{
        NSLog(@"图片在文字左并设置左右边距");
    }];
    leftImageMarginBtn.backgroundColor = [UIColor cyanColor];
    [self.backScrollView addSubview:leftImageMarginBtn];
    
    //图片在文字右并设置左右边距
    ZGHCustomButton *rightImageMarginBtn = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(30, 640, 200,50 ) title:@"图片在右方" image:[UIImage imageNamed:@"contact_p_select"] layoutStyle:ZGHButtonLayoutImageRightMargin marginOffset:15 buttonClickBlock:^{
        NSLog(@"图片在文字右并设置左右边距");
    }];
    rightImageMarginBtn.backgroundColor = [UIColor cyanColor];
    [self.backScrollView addSubview:rightImageMarginBtn];
    
    //图片在文字上并设置上下边距
    ZGHCustomButton *topImageMarginBtn = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(30, 720, 150,150 ) title:@"图片在上方" image:[UIImage imageNamed:@"contact_p_select"] layoutStyle:ZGHButtonLayoutImageTopMargin marginOffset:15 buttonClickBlock:^{
        NSLog(@"图片在文字上并设置上下边距");
    }];
    topImageMarginBtn.backgroundColor = [UIColor cyanColor];
    [self.backScrollView addSubview:topImageMarginBtn];
    
    //图片在文字下并设置上下边距
    ZGHCustomButton *bottomImageMarginBtn = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(210, 720, 150,150 ) title:@"图片在下方" image:[UIImage imageNamed:@"contact_p_select"] layoutStyle:ZGHButtonLayoutImageBottomMargin marginOffset:15 buttonClickBlock:^{
        NSLog(@"图片在文字上并设置上下边距");
    }];
    bottomImageMarginBtn.backgroundColor = [UIColor cyanColor];
    [self.backScrollView addSubview:bottomImageMarginBtn];
  
    
    //设置按钮阴影 所有边都设置
    ZGHCustomButton *title1Button = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(30, 900, 100, 50) title:@"只有标题按钮" buttonClickBlock:^{
        NSLog(@"只有标题按钮");
    }];
    title1Button.norBackgroundColor = [UIColor cyanColor];
    title1Button.titleColor = [UIColor redColor];
    title1Button.titleFont = [UIFont systemFontOfSize:15];
    [self.backScrollView addSubview:title1Button];
    [title1Button setBUttonShadowLayerRadius:5 shadowColor:[UIColor blackColor] shadowCorner:0 shadowSide:ZGHButtonShadowAllSideType];
    
    //设置按钮顶部阴影
    ZGHCustomButton *title2Button = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(30, 980, 100, 50) title:@"只有标题按钮" buttonClickBlock:^{
        NSLog(@"只有标题按钮");
    }];
    title2Button.norBackgroundColor = [UIColor cyanColor];
    title2Button.titleColor = [UIColor redColor];
    title2Button.titleFont = [UIFont systemFontOfSize:15];
    [self.backScrollView addSubview:title2Button];
    [title2Button setBUttonShadowLayerRadius:5 shadowColor:[UIColor blackColor] shadowCorner:0 shadowSide:ZGHButtonShadowTopSideType];
    
    //设置按钮底部阴影
    ZGHCustomButton *title3Button = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(160, 980, 100, 50) title:@"只有标题按钮" buttonClickBlock:^{
        NSLog(@"只有标题按钮");
    }];
    title3Button.norBackgroundColor = [UIColor cyanColor];
    title3Button.titleColor = [UIColor redColor];
    title3Button.titleFont = [UIFont systemFontOfSize:15];
    [self.backScrollView addSubview:title3Button];
    [title3Button setBUttonShadowLayerRadius:5 shadowColor:[UIColor blackColor] shadowCorner:0 shadowSide:ZGHButtonShadowBottomSideType];
    
    //设置按钮左边阴影
    ZGHCustomButton *title4Button = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(30, 1060, 100, 50) title:@"只有标题按钮" buttonClickBlock:^{
        NSLog(@"只有标题按钮");
    }];
    title4Button.norBackgroundColor = [UIColor cyanColor];
    title4Button.titleColor = [UIColor redColor];
    title4Button.titleFont = [UIFont systemFontOfSize:15];
    [self.backScrollView addSubview:title4Button];
    [title4Button setBUttonShadowLayerRadius:5 shadowColor:[UIColor blackColor] shadowCorner:0 shadowSide:ZGHButtonShadowLeftSideType];
    
    //设置按钮右边阴影
    ZGHCustomButton *title5Button = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(160, 1060, 100, 50) title:@"只有标题按钮" buttonClickBlock:^{
        NSLog(@"只有标题按钮");
    }];
    title5Button.norBackgroundColor = [UIColor cyanColor];
    title5Button.titleColor = [UIColor redColor];
    title5Button.titleFont = [UIFont systemFontOfSize:15];
    [self.backScrollView addSubview:title5Button];
    [title5Button setBUttonShadowLayerRadius:5 shadowColor:[UIColor blackColor] shadowCorner:0 shadowSide:ZGHButtonShadowRightSideType];
    
    //设置按钮背景渐变色
    ZGHCustomButton *title6Button = [[ZGHCustomButton alloc]initWithFrame:CGRectMake(30, 1140, 100, 50) title:@"只有标题按钮" buttonClickBlock:^{
        NSLog(@"只有标题按钮");
    }];
    title6Button.norBackgroundColor = [UIColor cyanColor];
    title6Button.titleColor = [UIColor redColor];
    title6Button.titleFont = [UIFont systemFontOfSize:15];
    [self.backScrollView addSubview:title6Button];
    [title6Button setButtonGradientColors:@[[UIColor redColor],[UIColor blueColor]] startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 1)];
    
    
    [self.backScrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, title6Button.frame.origin.y + 200)];
}


@end
