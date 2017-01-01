//
//  KeruiSetting.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/29.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiSetting.h"

@implementation KeruiSetting

-(void)viewDidLoad
{



    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];








}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    self.navigationController.tabBarController.tabBar.hidden=YES;
    
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated
{



    [super viewWillDisappear:animated];
    
    

    self.navigationController.tabBarController.tabBar.hidden=NO;
    





}

@end
