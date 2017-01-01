//
//  KeruisenderWorderrViewController.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/26.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruisenderWorderrViewController.h"

@interface KeruisenderWorderrViewController ()

@end

@implementation KeruisenderWorderrViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"发表文字";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStyleDone target:self action:@selector(post)];
    
    self.navigationItem.rightBarButtonItem.enabled = NO; // 默认不能点击
    

}

-(void)cancel
{

    [self dismissViewControllerAnimated:YES completion:nil];



}

-(void)post
{




    NSLog(@"sender");



}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
