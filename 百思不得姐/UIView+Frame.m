//
//  UIView+Frame.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/29.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

+(instancetype)kerui_loadxib
{




    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];




}
-(void)setKerui_Width:(CGFloat)Kerui_Width
{

    CGRect rect =self.frame;
    
    rect.size.width=Kerui_Width;
    
    self.frame=rect;
    



}

-(CGFloat)Kerui_Width
{



    return self.frame.size.width;

}


-(void)setKerui_height:(CGFloat)Kerui_height
{
    
    CGRect rect =self.frame;
    
    rect.size.height=Kerui_height;
    
    self.frame=rect;
    
    
    
    
}

-(CGFloat)Kerui_height
{
    
    
    
    return self.frame.size.height;
    
}

-(void)setKerui_y:(CGFloat)Kerui_y
{


    CGRect rect =self.frame;
    
    rect.origin.y=Kerui_y;
    
    
    self.frame=rect;
    
    





}

-(CGFloat)Kerui_y
{




    return self.frame.origin.y;


}


-(void)setKerui_x:(CGFloat)Kerui_x
{
    
    
    CGRect rect =self.frame;
    
    rect.origin.x=Kerui_x;
    
    
    self.frame=rect;
    
    
    
    
    
    
    
}

-(CGFloat)Kerui_x
{
    
    
    
    
    return self.frame.origin.x;
    
    
}

-(void)setKerui_centerX:(CGFloat)Kerui_centerX
{

    CGPoint center=self.center;
    
    center.x=Kerui_centerX;
    
    self.center=center;
    


}


-(CGFloat)Kerui_centerX
{




    return self.center.x;

}


-(void)setKerui_centerY:(CGFloat)Kerui_centerY
{
    
    CGPoint center=self.center;
    
    center.y=Kerui_centerY;
    
    self.center=center;
    
    
    
}


-(CGFloat)Kerui_centerY
{
    
    
    
    
    return self.center.y;
    
}


@end
