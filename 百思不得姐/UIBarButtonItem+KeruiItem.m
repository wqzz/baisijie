//
//  UIBarButtonItem+KeruiItem.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/29.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "UIBarButtonItem+KeruiItem.h"

@implementation UIBarButtonItem (KeruiItem)

+(UIBarButtonItem*)ItemWithimage:(UIImage *)image hightimage:(UIImage *)hlightimage target:(id)target action:(SEL)actino
{


    UIButton*btn  =   [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:hlightimage forState:UIControlStateHighlighted];
    
    [btn addTarget:target action:actino forControlEvents:UIControlEventTouchUpInside];
    
    [btn sizeToFit];
    
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    
    
    
    
    
    
    
    
    
    

 




}

+(UIBarButtonItem*)backWithimage:(UIImage *)image hightimage:(UIImage *)hlightimage target:(id)target action:(SEL)actino title:(NSString *)title
{



    UIButton*btn  =   [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:hlightimage forState:UIControlStateHighlighted];
    
    [btn addTarget:target action:actino forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTintColor:[UIColor blackColor]];
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [btn sizeToFit];
    
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    
    
    
    //self.navigationItem.rightBarButtonItem=item;
    
    
    



}

@end
