//
//  keruiTabbarController.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/29.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "keruiTabbarController.h"
#import "KeruiPostViewController.h"
#import "KeruiNewsController.h"
#import "KeruiNavgationController.h"
#import "KeruiMeviewController.h"
#import "KeruiFoucscontroller.h"
#import "Keruidistill.h"
#import "KeruitabBar.h"

@interface keruiTabbarController ()

@property(nonatomic,strong)NSMutableArray*item;

//@property(nonatomic,strong)keruiTabbarController*Tabvc;



@end

@implementation keruiTabbarController

-(NSMutableArray*)item
{
    if (!_item) {
        
        
        _item=[NSMutableArray array];
    }





    return _item;



}

+(void)load
{


    
    UITabBarItem*item=[UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    
    NSMutableDictionary*srt=[[NSMutableDictionary alloc]init];
    
    srt[NSForegroundColorAttributeName]=[UIColor blackColor];
    
    
    [item setTitleTextAttributes:srt forState:UIControlStateNormal ];
    
    



    
    NSMutableDictionary*front=[[NSMutableDictionary alloc]init];
    
   front[NSForegroundColorAttributeName]=[UIColor blackColor];
    
    front[NSFontAttributeName]=[UIFont systemFontOfSize:14];
    
    
    
    [item setTitleTextAttributes:front forState:UIControlStateNormal ];
    
    




}

-(void)viewDidLoad
{


    [super viewDidLoad];



    [self setupallController];

    [self setTabBar];
    
   // [NSNotificationCenter defaultCenter]addObserver:self selector:@selector() name:<#(nullable NSNotificationName)#> object:<#(nullable id)#>


}

//-(void)viewWillAppear:(BOOL)animated
//{
//
//    [super viewWillAppear:animated];
//    
//    self.navigationController.tabBarController.tabBar.hidden=YES;
//
//
//
//
//}

-(void)setTabBar
{



    KeruitabBar*tab=[[KeruitabBar alloc]initWithFrame:self.tabBar.frame];
    
    // self.tabBar=tab 因为self。tabBar 是只读复值修改不了，所以用kvc；
    [self setValue:tab forKey:@"tabBar"];
 




}

-(void)setupallController
{


    Keruidistill*distall=[[Keruidistill alloc]init];
    
      [self setController:distall Tiltle:@"精华" image:[UIImage imageWithimaneName:@"tabBar_essence_icon" ] select:[UIImage imageWithimaneName:@"tabBar_essence_click_icon"]];
    
    
    
    
    
    
    

    KeruiNewsController*News=[[KeruiNewsController alloc]init];
    
    
    
    News.view.backgroundColor=[UIColor whiteColor];
    
    [self setController:News Tiltle:@"发帖" image:[UIImage imageWithimaneName:@"tabBar_friendTrends_icon" ] select:[UIImage imageWithimaneName:@"tabBar_friendTrends_click_icon"]];
    

    

  
    


    KeruiFoucscontroller*foucs=[[KeruiFoucscontroller alloc]init];
    
    
    
    [self setController:foucs Tiltle:@"发现" image:[UIImage imageWithimaneName:@"tabBar_new_icon" ] select:[UIImage imageWithimaneName:@"tabBar_new_click_icon"]];
    
    

    
    

  
    
    UIStoryboard *stryboard=[UIStoryboard storyboardWithName:NSStringFromClass([KeruiMeviewController class]) bundle:nil];
    KeruiMeviewController*me=[stryboard instantiateInitialViewController];
    
       
    [self setController:me Tiltle:@"我" image:[UIImage imageWithimaneName:@"tabBar_me_icon" ] select:[UIImage imageWithimaneName:@"tabBar_me_click_icon"]];
    

    
 





}

-(void)setController:(UIViewController*)vc Tiltle:(NSString*)title image:(UIImage*)img  select:(UIImage*)selectimage

{



    vc.tabBarItem.title=title;
    
    vc .tabBarItem.image=img;
    vc.tabBarItem.selectedImage=selectimage;
    
    
    
    KeruiNavgationController*NA=[[KeruiNavgationController alloc]initWithRootViewController:vc];
    
    
    
    [self .item addObject:NA];
    
    [self addChildViewController:NA];










}



@end
