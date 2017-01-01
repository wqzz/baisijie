//
//  UITextField+Keruiplacehlodercolor.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/12/3.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "UITextField+Keruiplacehlodercolor.h"
#import <objc/message.h>

@implementation UITextField (Keruiplacehlodercolor)


+(void)load
{

    //run 交换方法；
  Method   setPlacehloderMethod  = class_getInstanceMethod(self, @selector(setPlaceholder:));
    
    
    
    Method   setkerui_placerMethod  = class_getInstanceMethod(self, @selector(kerui_placerholder:));
    
    


    method_exchangeImplementations(setPlacehloderMethod, setkerui_placerMethod);




}

-(void)setPlacehlodecolor:(UIColor *)placehlodecolor
{

//给成员属性赋值 ，runtime给系统的类添加成员属性
    
    objc_setAssociatedObject(self, @"placehlodecolor", placehlodecolor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    
    
    UILabel*placeholderlabel=[self valueForKey:@"placeholderLabel"];
    
    
    placeholderlabel.textColor=placehlodecolor;






}

-(UIColor*)placehlodecolor
{




    return objc_getAssociatedObject(self, @"placehlodecolor");

}
-(void)kerui_placerholder:(NSString *)placehloder
{

//
   // self.placeholder=placehloder;／／拿到label，的placehloder；
    
    [self kerui_placerholder:placehloder];//已经换了=placehlodecolor
    
    
    self.placehlodecolor=self.placehlodecolor;//=placehloder
    







}
@end
