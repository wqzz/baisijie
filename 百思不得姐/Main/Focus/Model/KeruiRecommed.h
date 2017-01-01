//
//  KeruiRecommed.h
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/22.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeruiRecommed : NSObject
@property(nonatomic,assign)NSInteger ID;

@property(nonatomic,strong)NSMutableArray*users;

@property(nonatomic,copy)NSString*name;

@property(nonatomic,assign)NSInteger count;

/** 总数 */
@property (nonatomic, assign) NSInteger total;
/** 当前页码 */
@property (nonatomic, assign) NSInteger currentPage;


@end
