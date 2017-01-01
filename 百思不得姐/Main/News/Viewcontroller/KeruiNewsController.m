//
//  KeruiNewsController.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/29.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiNewsController.h"
#import "KeruiDingruViewController.h"

@implementation KeruiNewsController

-(void)viewDidLoad
{


    [super viewDidLoad];
    
    
    
    self.title=@"百思不得姐";
    
    
   // self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];

    

    [self setNAv];
    
  


}

-(void)setNAv
{
    
    
    
    
    UIButton*btn  =   [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:@"navigationbar_more"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationbar_more_hlighted"] forState:UIControlStateHighlighted];
    
    [btn addTarget:self action:@selector(game) forControlEvents:UIControlEventTouchUpInside];
    
    [btn sizeToFit];
    
    
    UIBarButtonItem*item=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    
    
    
    self.navigationItem.leftBarButtonItem=item;
    
    
    
    
    
    
    
    
    
    
    
}


-(void)game
{
    
    
    KeruiDingruViewController*set=[[KeruiDingruViewController alloc]init];
    
    
    
    [self.navigationController pushViewController:set animated:YES];
    
    
    
    
    
    
    
}


@end
