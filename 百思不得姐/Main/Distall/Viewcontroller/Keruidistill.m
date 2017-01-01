//
//  Keruidistill.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/29.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "Keruidistill.h"
#import "KeruiSetting.h"
#import "KeruiBtn.h"
#import "KeruiAllTableVController.h"
#import "KeruiVideoViewController.h"
#import "KeruiVoiceViewController.h"
#import "KeruiPicteViewController.h"
#import "KeruiFuncViewController.h"

@interface Keruidistill ()<UIScrollViewDelegate>

@property(nonatomic,weak)UIView*titleVIew;

@property(nonatomic,weak)KeruiBtn*prebtn;
@property(nonatomic,weak)UIView*unline;
@property(nonatomic,weak)UIScrollView*scr;

@end
@implementation Keruidistill

-(void)viewDidLoad
{


    [super viewDidLoad];
    
    self.title=@"精华";
    
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem ItemWithimage:[UIImage imageNamed:@"tabbar_profile"] hightimage:[UIImage imageNamed:@"tabbar_profile_hlighted"] target:self action:@selector(game)];
    

    [self setupallChidvis];
    

    [self setupSCrow];
    
    [self settilteView];
    
    [self AddUIscrviewindexchiverders:0];
    
   
   }

-(void)setupallChidvis
{


    [self addChildViewController:[[KeruiAllTableVController alloc]init]];
     [self addChildViewController:[[KeruiVideoViewController alloc]init]];
    [self addChildViewController:[[KeruiVoiceViewController alloc]init]];
    [self addChildViewController:[[KeruiPicteViewController alloc]init]];
    [self addChildViewController:[[KeruiFuncViewController alloc]init]];


    















}

-(void)setupSCrow
{

    self.automaticallyAdjustsScrollViewInsets=NO;//不允许擅自修改scrview的内边距；
    UIScrollView*scr=[[UIScrollView alloc]init];
    
    scr.frame=self.view.bounds;
    
    scr.backgroundColor=[UIColor whiteColor];
    
    scr.showsHorizontalScrollIndicator=NO;
    scr.showsVerticalScrollIndicator=NO;
    
    scr.pagingEnabled=YES;
    
    scr.delegate=self;
    
    self.scr=scr;
    
    
    
    [self.view addSubview:scr];
    
//    for (int i=0; i<5;i++ )
//    {
//        
//        CGFloat SCRW=i*scr.Kerui_Width;
//        CGFloat SCRH=scr.Kerui_height;
//        UIView*chiledview=self.childViewControllers[i].view;
//        
//
//        
//        chiledview.frame=CGRectMake(SCRW, 0, scr.Kerui_Width, SCRH);
//        
//      
//        [scr addSubview:chiledview];
//        
//            //  NSLog(@"%@",NSStringFromCGRect(chiledview.frame));
//        
//    }

    /*上面屏蔽掉的原因是一运行所有的子控制器都加载了，这是不对的所以用懒加载一个一个加进去*/

    scr.contentSize=CGSizeMake(5*scr.Kerui_Width, 0);
    




}

-(void)settilteView
{

    UIView*titleView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.Kerui_Width, 35)];
    
    
    titleView.backgroundColor=[UIColor whiteColor];
    
    self.titleVIew=titleView;
    [self.view addSubview:titleView];


    [self settitlibutton];

    [self setunderlined];




}

-(void)settitlibutton
{

    NSArray*titlbtn=@[@"全部",@"视频",@"声音",@"图片",@"段子"];
     NSInteger count =titlbtn.count;
    CGFloat btnW=self.titleVIew.Kerui_Width/count;
    CGFloat btnH=self.titleVIew.Kerui_height;

    
    for (NSInteger i=0; i<count; i++)
    {
        
        
       KeruiBtn *btuon=[[KeruiBtn alloc]init];
        btuon.tag=i;
        
        [btuon setTitle:titlbtn[i] forState:UIControlStateNormal];
        
        [btuon addTarget:self action:@selector(Titlebtonclick:) forControlEvents:UIControlEventTouchUpInside];
      //  btuon.backgroundColor=[UIColor colorWithRed:234/255.0 green:234/225.0 blue:234/255.0 alpha:1];
        btuon.backgroundColor=[UIColor clearColor];
        
        [btuon setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btuon setTitleColor:[UIColor redColor ] forState:UIControlStateSelected];
        
        

        
        

        
        btuon.frame=CGRectMake(i*btnW, 0, btnW, btnH);
        
        [self.titleVIew addSubview:btuon];
        
        
        
        
        
        
    }






}


-(void)setunderlined
{

    
    KeruiBtn*firstbtn=self.titleVIew.subviews.firstObject;
    
    
    UIView*underline=[[UIView alloc]init];
    
   // underline.Kerui_Width =70;
    underline.Kerui_height=1;
    underline.Kerui_y=self.titleVIew.Kerui_height-underline.Kerui_height;
    
    
   // underline.frame=CGRectMake(0, Y, W, 1);
    underline.backgroundColor=[firstbtn titleColorForState:UIControlStateSelected];
    [self.titleVIew addSubview:underline];
    
    _unline=underline;
    
    
    firstbtn.selected=YES;
    
    self.prebtn=firstbtn;
    
    
    [firstbtn.titleLabel sizeToFit];
    
    self.unline.Kerui_Width=firstbtn.titleLabel.Kerui_Width+10;
    self.unline.Kerui_centerX=firstbtn.Kerui_centerX;
    

    

    
    
    








}

-(IBAction)Titlebtonclick:(KeruiBtn*)btn
{
    
    
    if (self.prebtn==btn)
    {
        [[NSNotificationCenter defaultCenter]postNotificationName:keruiTitlebuttondidRepeatNotication object:nil];
    }
    
    [self detailbuttonClick:btn];//解决view移到一半返回原view还会上拉刷新的问题；然后scrviewdidend调用这个方法就不会接受上面的通知刷新；
    
    
    
}

-(void)detailbuttonClick:(KeruiBtn*)btn
{


    self.prebtn.selected=NO;
    btn.selected=YES;
    
       self.prebtn=btn;
    
    NSInteger index=btn.tag;
    [UIView animateWithDuration:0.4 animations:^{
        
        // self.unline.Kerui_Width=[btn.currentTitle sizeWithAttributes:@{NSFontAttributeName:btn.titleLabel.font}].width;
        
        self.unline.Kerui_Width=btn.titleLabel.Kerui_Width+10;
        self.unline.Kerui_centerX=btn.Kerui_centerX;
        
        CGFloat offX =self.scr.Kerui_Width*index;
        
        self.scr.contentOffset=CGPointMake(offX, self.scr.contentOffset.y);
        
        //contentOffset 偏移量 最左边的内容减去最左边的frame；
        
    }completion:^(BOOL finished) {
        
        
        [self AddUIscrviewindexchiverders:index];
        
    }];
    
    //监听状态栏的区域解读；思路是当uiscreView的scrviewtop等于yes(chive控制器的tag等于chive的view)，其他的view设置为no；
    
    //拿到所有得view遍历一下
    
    for (NSInteger i ; i<self.childViewControllers.count;i++)
    {
        UIViewController*chivers=self.childViewControllers[i];
        
        if (!chivers.isViewLoaded) continue;
        
        UIScrollView*scr=(UIScrollView*)chivers.view;
        if (![scr isKindOfClass:[UIScrollView class]]) continue;
        //        if (i==index) {
        //
        //            scr.scrollsToTop=YES;
        //
        //          //  NSLog(@"%d",index);
        //        }else{
        //
        //
        //
        //            scr.scrollsToTop=NO;
        //
        //
        //        }
        
        scr.scrollsToTop=(i==index);
        
    }
    
    
















}
-(void)AddUIscrviewindexchiverders:(NSInteger)index
{


    UIViewController*chivder=self.childViewControllers[index];
    if ([chivder isViewLoaded]) return;

    CGFloat SCRW=self.scr.Kerui_Width;
    CGFloat SCRH=self.scr.Kerui_height;
    UIView*chivderVIew=chivder.view;
    
    chivderVIew.frame=CGRectMake(index*SCRW, 0, SCRW, SCRH);
    
    [self.scr addSubview:chivderVIew];



/* 上面比下面好的好处是chivderView加载过就不会在加载了；下面只要点击就会加载还会重计算frame，减少内存；
 
 CGFloat SCRW=self.scr.Kerui_Width;
 CGFloat SCRH=self.scr.Kerui_height;
 
 
 UIView*chivderVIew=self.childViewControllers[index].view;
 
 
  chivderVIew.frame=CGRectMake(index*SCRW, 0, SCRW, SCRH);

 
 [self.scr addSubview:chivderVIew]
 
 
 
 */





    NSLog(@"%zd,%p",index,chivder);



}

#pragma 移动tableview的时候滚动

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{


    NSInteger indeX=self.scr.contentOffset.x/scrollView.Kerui_Width;
    
    KeruiBtn*btn=self.titleVIew.subviews[indeX];
    
    [self detailbuttonClick:btn];
    

  



}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (scrollView.contentOffset.x<0) {
        
        
        [scrollView setContentOffset:CGPointMake(0, scrollView.contentOffset.y) animated:NO];
        
        
    }
    
}



-(void)game
{


    KeruiSetting*set=[[KeruiSetting alloc]init];
    
    
    
    [self.navigationController pushViewController:set animated:YES];







}

@end
