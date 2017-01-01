//
//  Keruiuser.h
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/22.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Keruiuser : NSObject

/** 头像 */
@property (nonatomic, copy) NSString *header;
/** 粉丝数(有多少人关注这个用户) */
@property (nonatomic, assign) NSInteger fans_count;
/** 昵称 */
@property (nonatomic, copy) NSString *screen_name;


@end
