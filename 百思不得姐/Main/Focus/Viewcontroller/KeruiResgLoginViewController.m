//
//  KeruiResgLoginViewController.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/12/1.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiResgLoginViewController.h"

@interface KeruiResgLoginViewController ()

@end

@implementation KeruiResgLoginViewController

+(instancetype)loginView
{





    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]firstObject];






}
+(instancetype)regVlogView
{





    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];






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
