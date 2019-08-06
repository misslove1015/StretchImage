//
//  ViewController.m
//  Stretch
//
//  Created by miss on 16/10/12.
//  Copyright © 2016年 mukr. All rights reserved.
//

#import "ViewController.h"

#define  SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始图片
    UIImage *initialImage = [UIImage imageNamed:@"jiantou"];
    //拉伸图片右侧
    UIImage *rightStretchImage = [initialImage stretchableImageWithLeftCapWidth:initialImage.size.width *0.8 topCapHeight:initialImage.size.height *0.5];
    //拉伸后的宽度=总宽度/2+初始图片宽度/2
    CGFloat stretchWidth = (SCREEN_WIDTH-60)/2+initialImage.size.width/2;
    //获得右侧拉伸过后的图片
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(stretchWidth, 90), NO, [UIScreen mainScreen].scale);
    [rightStretchImage drawInRect:CGRectMake(0, 0, stretchWidth, 90)];
    UIImage *firstStretchImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //拉伸图片左侧，获得最终图片
    UIImage *finalImage = [firstStretchImage stretchableImageWithLeftCapWidth:initialImage.size.width *0.2 topCapHeight:initialImage.size.height*0.5];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 200, SCREEN_WIDTH-60, 100)];
    imageView.image = finalImage;
    [self.view addSubview:imageView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
