//
//  KeruiFoucscontroller.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/29.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiFoucscontroller.h"
#import "KeruiLogInViewController.h"
#import "UITextField+Keruiplacehlodercolor.h"
#import "KeruiRecommerViewViewController.h"

@interface KeruiFoucscontroller ()

@property (weak, nonatomic) IBOutlet UITextField *textfiled;



@end
@implementation KeruiFoucscontroller


-(void)viewDidLoad
{

    [super viewDidLoad];
    
    //分析为什么先设置占位文字颜色，就没有效果＝＝》占位文字的label拿不到；
    
    //想办法拿到再说；runtime交换设置系统的方法；
    _textfiled.placehlodecolor=[UIColor redColor];
    //[_textfiled kerui_placerholder:@"123"];
    
    _textfiled.placeholder=@"123";
    
    
    self.navigationItem.title=@"我的关注";
    
    
    
    
    
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem ItemWithimage:[UIImage imageNamed:@"cellmorebtnnormal"] hightimage:[UIImage imageNamed:@"cellmorebtnclick"] target:self action:@selector(paush )];


    self.view.backgroundColor=[UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];



}

-(void)paush
{


    KeruiRecommerViewViewController*Recommer=[[KeruiRecommerViewViewController alloc]init];
    
    
    
    [self.navigationController pushViewController:Recommer animated:YES];









}






- (IBAction)logInbtn:(id)sender
{
    
    KeruiLogInViewController*log=[[KeruiLogInViewController alloc]init];
    
    
    
    [self presentViewController:log animated:YES completion:nil];
    
    
    
}

@end
