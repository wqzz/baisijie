//
//  UIImage+image.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/29.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)
+(instancetype)imageWithimaneName:(NSString *)image
{


    UIImage*images=[UIImage imageNamed:image];
    
    
    return [images imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    


}

-(instancetype)kerui_Crieimage
{







    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    //描述剪裁区域；
    UIBezierPath*path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    //设置剪裁区域
    
    [path addClip];
    
    //画图片
    
    [self drawAtPoint:CGPointZero];
    
    //取出图片
 UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();












    return image;




}
+(instancetype)kerui_Crieimagnamed:(NSString *)named
{



    return [[self  imageNamed:named]kerui_Crieimage];




}

@end
