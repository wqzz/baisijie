//
//  KeruiaddNewView.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/24.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiaddNewView.h"
#import "Keruivitebtn.h"
#import "KeruisenderWorderrViewController.h"
#import "KeruiNavgationController.h"


static  CGFloat const keryufac = 10;
static CGFloat  const delatime = 0.2;



@implementation KeruiaddNewView



+(instancetype)publishView
{


   return  [[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;



}

    static UIWindow *window_;
+ (void)show {
        window_ = [[UIWindow alloc] init];
        window_.frame = boundss ;
        window_.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.95];
        window_.hidden = NO;
        // 添加发布界面
        KeruiaddNewView*publish = [KeruiaddNewView publishView];
        publish.frame = window_.bounds;
        [window_ addSubview:publish];
        
    }





-(void)awakeFromNib
{


    [super awakeFromNib];
    
    UIImageView*solagview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"app_slogan"]];
    
    [self addSubview:solagview];
 
    
    NSArray*images=@[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];

    NSArray*titles=@[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    
    int macCols=3;
    
    CGFloat btnW=60;
    
    CGFloat btnH=btnW+30;
    
    CGFloat btnStarY=(KeruiScreenH-2*btnH)*0.5;
    
    CGFloat btnStaryX=20;
    
    CGFloat maigx = (KeruiScreenW-2*btnStaryX-macCols*btnW)/(macCols-1);
    
    for (NSInteger i =0; i<images.count ;i++)
    {
        
        
        Keruivitebtn*btn=[[Keruivitebtn alloc]init];
        
        [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        
        
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        btn.titleLabel.font=[UIFont systemFontOfSize:14];
        
        btn.tag=i;
        
        [btn addTarget:self action:@selector(butionclich: ) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        
        
        NSInteger row = i/macCols;
        NSInteger cols = i%macCols;
        
        CGFloat btnX = btnStaryX +cols*(btnW+maigx);
        CGFloat btnendY =btnStarY+row*btnH;
        
        CGFloat btnbeginY = btnendY-KeruiScreenH;
        
        btn.frame=CGRectMake(btnX, btnbeginY, btnW, btnH);
        

        
        POPSpringAnimation*antion=[POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
        
        antion.fromValue=[NSValue valueWithCGRect:btn.frame];
        
        antion.toValue =[NSValue valueWithCGRect:CGRectMake(btnX, btnendY, btnW, btnH)];
        
        
        antion.springSpeed = keryufac;
        antion.springBounciness = keryufac ;
        
        antion.beginTime = CACurrentMediaTime() +delatime*i;
        
        
        [btn pop_addAnimation:antion forKey:nil];
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    


    POPSpringAnimation*amtion=[POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    
    CGFloat slegcenterX = KeruiScreenW*0.5;
    
    CGFloat slgecentedY = KeruiScreenH *0.3;
    
    CGFloat slgestaryY = slgecentedY-KeruiScreenH;
    
    solagview.center= CGPointMake(slegcenterX, slgestaryY);
    
    
    
    amtion.fromValue=[NSValue valueWithCGPoint:solagview.center];
    
    amtion.toValue =[NSValue valueWithCGPoint:CGPointMake(slegcenterX, slgecentedY)];
    
    
    amtion.springSpeed = keryufac;
    amtion.springBounciness = keryufac ;
    
    amtion.beginTime = CACurrentMediaTime() +delatime;
    
    
    [amtion setCompletionBlock:^(POPAnimation *amtion, BOOL finshed) {
        
        self.userInteractionEnabled=YES;
        
    }];
    
    
    [solagview pop_addAnimation:amtion forKey:nil];
    










}



-(void)canclebtonclick:(void(^)())complackblock
{


    self.userInteractionEnabled=NO;
    
    NSInteger index=1;
    
    NSInteger count = self.subviews.count;
    
    for (NSInteger i =index; i<count; i++)
    {
        
        
        UIView*subview=self.subviews[count-1+index-i];
        
        
        POPSpringAnimation*atio=[POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
        
        CGFloat centerendY=subview.Kerui_centerY+KeruiScreenH;
        
        atio.fromValue=[NSValue valueWithCGPoint:CGPointMake(subview.Kerui_centerX, subview.Kerui_centerY)];
        
        atio.toValue=[NSValue valueWithCGPoint:CGPointMake(subview.Kerui_centerX, centerendY)];
        
        atio.beginTime=CACurrentMediaTime()+(i-index)*delatime;
        
        [subview pop_addAnimation:atio forKey:nil];
        
        
        if (index ==(count-1+index-i))
        {
            
            
            [atio setCompletionBlock:^(POPAnimation *ation, BOOL finshed)
             {
                
                
                 self.userInteractionEnabled=YES;
                 window_.hidden=YES;
                 
                 window_=nil;
                
                
                 if (complackblock)
                 {
                     
                     
                     complackblock();
                 }
                
                
            }];
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
    }









}



- (IBAction)diss:(UIButton*)sender
{
    
    [self canclebtonclick:nil];
    
    
    
    
    
    
}


-(void)butionclich: (UIButton*)bton
{
    
    [self canclebtonclick:^{
        
        if (bton.tag==0) {
            NSLog(@"sender video");
        }else if (bton.tag==1)
        {
            NSLog(@"sender picther");
            
        }
        
        else if (bton.tag==2)
        {
        
        
            KeruisenderWorderrViewController*word=[[KeruisenderWorderrViewController alloc]init];
            
            
            KeruiNavgationController*nav=[[KeruiNavgationController alloc]initWithRootViewController:word];
            
            [keruiWindows .rootViewController presentViewController:nav animated:YES completion:nil];
        
        
        
        
        }

        
        
        
        
        
    }];
    
    
    






}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self canclebtonclick:nil];



}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
