//
//  KeruiHuanCTOOL.h
//  百思不得姐
//
//  Created by 钟文秋 on 16/12/6.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeruiHuanCTOOL : NSObject
+(void)GetFile:(NSString*)dirtoary complation:(void(^)(NSInteger))complationed ;

+(void)RemoveDiretorypath:(NSString*)dirpath;

@end
