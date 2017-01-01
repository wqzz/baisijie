//
//  KeruiVoiceViewController.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/8.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiVoiceViewController.h"

@interface KeruiVoiceViewController ()

@end

@implementation KeruiVoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor=keruiXRemcolr;
//    self.tableView.contentInset= UIEdgeInsetsMake(UInavGationH + UItitileH, 0, UITabBarH, 0);
//    
// NSLog(@"[KeruiVoiceViewController viewDidLoad]");
    
    
    
    

}

-(void)viewDidDisappear:(BOOL)animated
{








}

////添加播放按钮通知
//-(void)setupPlayBtnNotification {
//    
//    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"playVideo" object:nil] subscribeNext:^(NSNotification *noti) {
//        XFTopicModel *topic = noti.userInfo[@"Video"];
//        [self playVideoWithURL:[NSURL URLWithString:topic.videouri]];
//    }];
//    
//}


-(keruitype)type
{
    
    
    
    
    return keruitypevoice;
    
    
    
}



@end
