//
//  KeruiTopic.h
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/12.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum  {


keruitypeAll=1,
    
keruitypepicture=10,

keruitypevoice=31,
    
keruitypevideo=41,
    
    
keruitypeword=29,


}keruitype;


@interface KeruiTopic : NSObject
@property(nonatomic,copy)NSString*name;
@property(nonatomic,copy)NSString*profile_image;
@property(nonatomic,copy)NSString*text;
@property(nonatomic,copy)NSString*passtime;

@property(nonatomic,assign)NSInteger ding;
@property(nonatomic,assign)NSInteger cai;
@property(nonatomic,assign)NSInteger repost;
@property(nonatomic,assign)NSInteger comment;

@property(nonatomic,assign)CGFloat cellhelight;
@property(nonatomic,strong)NSArray *top_cmt;
    
@property(nonatomic,assign)keruitype  type;


@property(nonatomic,assign)NSInteger width;

@property(nonatomic,assign)NSInteger height;

@property(nonatomic,assign)CGRect MiddFrame;
/* 大中小图*/
@property(nonatomic,copy)NSString*image0;
@property(nonatomic,copy)NSString*image1;
@property(nonatomic,copy)NSString*image2;
@property(nonatomic,copy)NSString*bimageuri;


/*播放时间次数 */

@property(nonatomic,assign)NSInteger viocetime;

@property(nonatomic,assign)NSInteger videotime;

@property(nonatomic,assign) NSInteger   playcount;



@property(nonatomic,copy)NSString*videouri;

@property(nonatomic,copy)NSString*voiceuri;

@property(nonatomic,assign)NSInteger userId;


@property(nonatomic,assign,getter=isBigpicture)BOOL  Bigpicture;


@property(nonatomic,assign)BOOL is_gif;

@property (nonatomic, assign, readonly) CGRect pictureF;

@property(nonatomic,assign)CGFloat pressivew;

@end
