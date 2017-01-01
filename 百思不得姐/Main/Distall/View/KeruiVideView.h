//
//  KeruiVideView.h
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/15.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KeruiTopic;
@interface KeruiVideView : UIView
@property(nonatomic,strong)KeruiTopic*topic;
-(void)reset;

@property(assign,nonatomic,getter=isplaying)BOOL playing;
@end
