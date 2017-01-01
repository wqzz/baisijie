//
//  KeruiVideoViewController.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/8.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiVideoViewController.h"
#import "KRVideoPlayerController.h"
#import "KeruiVideView.h"



@interface KeruiVideoViewController ()

@property(nonatomic,strong)KRVideoPlayerController*vidercontroller;
@property(nonatomic,weak)KeruiVideView*video;

@end

@implementation KeruiVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
//    self.view.backgroundColor=keruiXRemcolr;
//    self.tableView.contentInset= UIEdgeInsetsMake(UInavGationH + UItitileH, 0, UITabBarH, 0);
//    
//
//    NSLog(@"[KeruiVideoViewController viewDidLoad]");
    
    
    //self.view.backgroundColor=[UIColor redColor];

}

-(void)viewDidDisappear:(BOOL)animated
{
    
    [super viewDidDisappear:animated];
    
    //[self.view removeFromSuperview];
    
    [_video reset];
    
    
    
    
    
    
}



-(void)stoplaying
{


    
    
    
    

    [self.vidercontroller dismiss];

    self.vidercontroller=nil;







}
-(keruitype)type
{




    return keruitypevideo;



}


@end
