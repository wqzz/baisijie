//
//  KeruiRecommed.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/22.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiRecommed.h"
#import "MJExtension.h"

@implementation KeruiRecommed


-(NSMutableArray*)users
{

    if (!_users) {
        
        _users=[NSMutableArray array];
    }

    return _users;
}


+(NSDictionary*)mj_replacedKeyFromPropertyName
{


  return   @{
      
      @"ID":@"id"
      
      
      };




}

@end
