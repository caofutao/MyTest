//
//  UIImage+CF.m
//  打水印
//
//  Created by 曹福涛 on 15/9/20.
//  Copyright (c) 2015年 曹福涛. All rights reserved.
//

#import "UIImage+CF.h"

@implementation UIImage (CF)
+ (instancetype)waterImageWithBg:(NSString *)bg logo:(NSString *)logo {
    UIImage *oldImage = [UIImage imageNamed:bg];
    // 1.创建一个基于位图（bitmap）的上下文（开启一个基于位图的上下文）
    // size：新图片的尺寸
    // opaque：YES：不透明，NO：透明
    // 这行代码过后，相当于创建一张新的bitmap，也就是新的UIImage对象
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0);
    // 2.画背景
    [oldImage drawInRect:CGRectMake(0, 0, oldImage.size.width, oldImage.size.height)];
    // 3.画水印
    UIImage *image = [UIImage imageNamed:logo];
    
    CGFloat scale = 0.5; // 按比例缩小图片
    CGFloat logoW = image.size.width * scale;
    CGFloat logoH = image.size.height * scale;
    CGFloat logoX = oldImage.size.width - logoW;
    CGFloat logoY = oldImage.size.height - logoH;
    [image drawInRect:CGRectMake(logoX, logoY, logoW, logoH)];
    // 4.从上下文中获取制作完毕的UIImage对象
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
