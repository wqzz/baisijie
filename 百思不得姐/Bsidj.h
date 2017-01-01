//
//  Bsidj.h
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/29.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

//#ifndef Bsidj_h
//#define Bsidj_h
//
//
//#endif /* Bsidj_h */

#import "UIImage+image.h"
#import "UIView+Frame.h"
#import "UIBarButtonItem+KeruiItem.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "SVProgressHUD.h"
#import <SDImageCache.h>
#import "KeruiConGes.h"
#import "UIImageView+KeruiUIimageVIew.h"
#import "MJRefresh.h"
#import "POPSpringAnimation.h"


#define KeruiScreenH   [UIScreen mainScreen].bounds.size.height


#define KeruiScreenW    [UIScreen mainScreen].bounds.size.width

#define  keruiXRemcolr   [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0  blue:arc4random_uniform(255)/255.0  alpha:1]


#define kecolor(r,g,b)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0  blue:(b)/255.0  alpha:1]

#define boundss  [UIScreen mainScreen].bounds

#define keruiWindows  [UIApplication sharedApplication].keyWindow


// 设置颜色
#define JYJColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]



//#define kecolorr   kecolor(r,g,b)



#define keruiFunc   keruiLog (@"%s",__func__)

#ifdef debug

#define keruiLog (...) NSLog(__VA_ARGS__);

#else

#define keruiLog(...)

# endif
