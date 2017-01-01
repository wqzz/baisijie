//
//  UIBarButtonItem+KeruiItem.h
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/29.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (KeruiItem)

+(UIBarButtonItem*)backWithimage:(UIImage*)image hightimage:(UIImage*)hlightimage target:(id)target action:(SEL)actino title:(NSString*)title;

+(UIBarButtonItem*)ItemWithimage:(UIImage*)image hightimage:(UIImage*)hlightimage target:(id)target action:(SEL)actino ;


@end
