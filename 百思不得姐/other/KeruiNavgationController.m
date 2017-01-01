//
//  KeruiNavgationController.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/29.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiNavgationController.h"



@interface KeruiNavgationController () <UIGestureRecognizerDelegate>

@end


@implementation KeruiNavgationController

+(void)load
{



 
    UINavigationBar*item=[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    
    NSMutableDictionary*front=[[NSMutableDictionary alloc]init];
    
     front[NSForegroundColorAttributeName]=[UIColor colorWithRed:240.0/255 green:60.0/255 blue:60.0/255. alpha:1];
    
    front[NSFontAttributeName]=[UIFont systemFontOfSize:20];
    
    
    
    [item setTitleTextAttributes:front ];
    
    
    
    //[item setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];



}


-(void)viewDidLoad
{

    [super viewDidLoad];



    self.interactivePopGestureRecognizer.delegate=self;
    
//    UIPanGestureRecognizer*grs=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(gespan)];
//    
    
//    [self.view addGestureRecognizer:grs];
//    grs.delegate=self;
    
   // self.interactivePopGestureRecognizer.enabled=NO;

}


-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{


    return self.childViewControllers.count>1;




}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
   
    if (self.childViewControllers.count>0) {
        
        viewController.hidesBottomBarWhenPushed=YES;
        
    viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem backWithimage:[UIImage imageNamed:@"navigationbar_back"]  hightimage:[UIImage imageNamed:@"navigationbar_back_hlighted"]  target:self action:@selector(back) title:@"反回"];
    


    
        
        
        
        
    
    }




    [super pushViewController:viewController animated:animated];






}

-(void)back
{



    [self popViewControllerAnimated:YES];



}

@end
