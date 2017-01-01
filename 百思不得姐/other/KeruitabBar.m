//
//  KeruitabBar.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/29.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruitabBar.h"
#import "KeruiaddNewView.h"


@interface KeruitabBar ()

@property(nonatomic,strong)NSMutableArray*btn;

@property(nonatomic,weak)UIButton*plsbtn;
@property(nonatomic,weak)UIControl*prebtn;

@end

@implementation KeruitabBar


-(UIButton*)plsbtn
{

    if (!_plsbtn)
    {
      
        
        UIButton *bton = [UIButton buttonWithType:UIButtonTypeCustom];
        [bton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [bton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
      //  [bton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
      //  [bton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        
        [bton addTarget:self action:@selector(push ) forControlEvents:UIControlEventTouchUpInside];
        
        [bton sizeToFit];
        

        _plsbtn=bton;
        
        [self addSubview:bton];
        
        
        
        
    }









    return _plsbtn;




}

-(void)push
{



    [KeruiaddNewView  show];









}


-(void)layoutSubviews
{


    [super layoutSubviews];
    
    NSInteger count =self.items.count;
    CGFloat W=self.Kerui_Width;
    
    CGFloat H=self.Kerui_height;
    
    
    CGFloat BtnW=W/(count+1);
    
    CGFloat BtnH=H;
    
    CGFloat BtnY=0;
    
    CGFloat BtnX=0;
    
    NSInteger i=0;
    
    
    
     //原来是uiview*btn的但是btn继承自uicontrol所以为了监听tabbar的buton就用这个
    for (UIControl*btn in self.subviews)
    {
        
        if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
          
            if (i==0&&self.prebtn==nil) {
                
                self.prebtn=btn;
            }
        
        if (i==2)
        {
            
            
            i += 1;
            
        }
        
        
        BtnX=i*BtnW;
        
        
        btn.frame=CGRectMake(BtnX, BtnY, BtnW, BtnH);
        
            i++;
        
            NSLog(@"%@",btn.superclass);
            
            [btn addTarget:self action:@selector(Tabbarbtnclick:) forControlEvents:UIControlEventTouchUpInside];
        }
        
    }



    
    self.plsbtn.center=CGPointMake(self.Kerui_Width*0.5, self.Kerui_height*0.5);




}

-(void)Tabbarbtnclick:(UIControl*)btn
{
    
   // keruiFunc;
    //点击2次
    if(self.prebtn==btn)
    {
    
        //NSLog(@"%s",__func__);
    
    
        [[NSNotificationCenter defaultCenter]postNotificationName:keruiTabbarbuttondidRepeatNotication object:nil ];
    
    // 发出通知；
    
    }
    
    self.prebtn=btn;
    
    









}

@end
