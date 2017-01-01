//
//  KeruiADviewController.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/29.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//


#define XMGCode2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"






#define iphone6P (KeruiScreenH ==736)
#define iphone6 (KeruiScreenH ==667)
#define iphone5 (KeruiScreenH ==568)
#define iphone4 (KeruiScreenH ==480)


#define  url  @"http://www.baidu.com"
#import "KeruiADviewController.h"
#import "KeruiAdItem.h"
#import "keruiTabbarController.h"




@interface KeruiADviewController  ()

@property (weak, nonatomic) IBOutlet UIImageView *AdimageView;

@property (weak, nonatomic) IBOutlet UIView *AdView;
@property (weak, nonatomic) IBOutlet UIButton *Timebtn;

@property(nonatomic,weak)UIImageView*image;

@property(nonatomic,strong)KeruiAdItem*item;
@property(nonatomic,strong)NSTimer*timer;

@property(nonatomic,assign)NSInteger timcount;

@end
@implementation KeruiADviewController

-(UIImageView*)image
{

    if (_image==nil)
    {
       
        
        UIImageView*images=[[UIImageView alloc]init];
        
        
        
        
        [self.AdView addSubview:images];
        
        _image.userInteractionEnabled=YES;
        
        UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(top)];

        [_image addGestureRecognizer:tap];
        _image=images;
    }




    return _image;


}

-(void)viewDidLoad
{

    [super viewDidLoad];




    self.AdimageView.userInteractionEnabled=YES;
    
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(top)];
    
    
    [self.AdimageView addGestureRecognizer:tap];
   


  [self setupLuangImage];


    [self loadDate];

}


-(void)top
{




    UIApplication*canopen=[UIApplication sharedApplication];
    
    if ([canopen canOpenURL:[NSURL URLWithString:url]])
    {
        
        
        [canopen openURL:[NSURL URLWithString:url]];
    }




    NSLog(@"%@",_item.ori_curl);





}

-(void)loadDate
{





    AFHTTPSessionManager*mgr=[AFHTTPSessionManager manager];
    
    NSMutableDictionary*dic=[NSMutableDictionary dictionary];
    dic[@"code2"]=XMGCode2;
    
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        //http://pic6.huitu.com/res/20130116/84481_20130116142820494200_1.jpg
        //http://mobads.baidu.com/cpro/ui/mads.php
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        
        NSLog(@"%@",responseObject);
        
        
        NSDictionary*date=[responseObject[@"ad"]firstObject];
        
        KeruiAdItem*item=[KeruiAdItem mj_objectWithKeyValues:date];
        
//        if (item.W<=0) {
//            return ;
//        }
//        CGFloat W=KeruiScreenW;
//        CGFloat h=KeruiScreenW/item.W*item.H;
      //  [UIScreen mainScreen].bounds.size.width;
        self.image.frame=CGRectMake(0, 0, KeruiScreenW, KeruiScreenH);
    
        
        [self.image sd_setImageWithURL:[NSURL URLWithString:@"http://pic6.huitu.com/res/20130116/84481_20130116142820494200_1.jpg"] ];
        
        
        _item=item;
        
      //  NSLog(@"%@",item);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        NSLog(@"%@",error);
    }];
    
    



    NSTimer*timer=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerc) userInfo:nil repeats:YES];



    self.timer=timer;




}

-(void)timerc
{



    [self.Timebtn setTitle:[NSString stringWithFormat:@"跳过 (%ds)",3-self.timcount] forState:UIControlStateNormal];




    self.timcount++;
    if (self.timcount==4)
    {
        
        [self cleartime];
        
    }
    




}

-(void)cleartime
{

 
 [self.timer invalidate];
    
    self.title=nil;
    
    

    [self droprootVieController];




}

-(void)droprootVieController
{

    keruiTabbarController*tab=[[keruiTabbarController alloc]init];
    
    

    [UIApplication sharedApplication].keyWindow.rootViewController=tab;
    [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
    





}
-(void)setupLuangImage
{



    if (iphone6P) {
        
        self.AdimageView.image=[UIImage imageNamed:@"LaunchImage-800-Protrait-736h@3x"];
    }else if (iphone6)
    {
    
        self.AdimageView.image=[UIImage imageNamed:@"LaunchImage-800-667h@2x"];

    
    }else if (iphone5)
    {
    
        self.AdimageView.image=[UIImage imageNamed:@"LaunchImage-700-568h@2x"];

    
    }else if (iphone4)
    {
    
        self.AdimageView.image=[UIImage imageNamed:@"LaunchImage"];

    
    }










}
- (IBAction)btnclick:(id)sender
{
    
    
    [self timerc];
    
    [self cleartime];
    
}

@end
