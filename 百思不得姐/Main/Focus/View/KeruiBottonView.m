//
//  KeruiBottonView.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/12/2.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiBottonView.h"

@implementation KeruiBottonView
+(instancetype)BottomView
{





    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];

}

@end
