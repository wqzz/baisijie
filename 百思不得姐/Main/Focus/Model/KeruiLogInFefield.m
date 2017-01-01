//
//  KeruiLogInFefield.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/12/3.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiLogInFefield.h"
#import "UITextField+Keruiplacehlodercolor.h"

@implementation KeruiLogInFefield

-(void)awakeFromNib
{
    [super awakeFromNib];


//设置光标的颜色为白色
    self.tintColor=[UIColor whiteColor];
    
    //代理，监听文本狂的颜色；原则上不要自己成为自己的代理
    
    [self addTarget:self action:@selector(textBegin) forControlEvents:UIControlEventTouchUpInside];

    
     [self addTarget:self action:@selector(textEnd) forControlEvents:UIControlEventEditingDidEnd];

    
//    NSMutableDictionary*dic=[NSMutableDictionary dictionary];
//    
//    dic[NSForegroundColorAttributeName]=[UIColor lightGrayColor];
//    
//    self.attributedPlaceholder=[[NSAttributedString alloc]initWithString:self.placeholder attributes:dic];
//    
    
    //UILabel*placeholderlabel=[self valueForKey:@"placeholderLabel"];
    
    
   // placeholderlabel.textColor=[UIColor redColor];
  //  NSLog(@"%@",textField);
    
    self.placehlodecolor=[UIColor redColor];

}

-(void)textBegin
{


  //设置占位符的颜色为白色，


    NSMutableDictionary*dic=[NSMutableDictionary dictionary];
    
    dic[NSForegroundColorAttributeName]=[UIColor whiteColor];
    
    self.attributedPlaceholder=[[NSAttributedString alloc]initWithString:self.placeholder attributes:dic];




}

-(void)textEnd
{


    
    self.placehlodecolor=[UIColor redColor];

//    UILabel*placeholderlabel=[self valueForKey:@"placeholderLabel"];
//    
//    
//    placeholderlabel.textColor=[UIColor redColor];
    
//    NSMutableDictionary*dic=[NSMutableDictionary dictionary];
//    
//    dic[NSForegroundColorAttributeName]=[UIColor lightGrayColor];
//    
//    self.attributedPlaceholder=[[NSAttributedString alloc]initWithString:self.placeholder attributes:dic];









}
@end
