//
//  KeruiVideView.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/15.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiVideView.h"
#import "KeruiTopic.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "KRVideoPlayerController.h"

@interface KeruiVideView ()


@property (weak, nonatomic) IBOutlet UIButton *play;
@property (weak, nonatomic) IBOutlet UILabel *timelabel;
@property (weak, nonatomic) IBOutlet UILabel *playcount;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@property(nonatomic,strong)KRVideoPlayerController*videocontroller;




@end

@implementation KeruiVideView




-(void)awakeFromNib
{
    
    
    [super awakeFromNib];
    
    self.autoresizingMask=UIViewAutoresizingNone;//取消自动约束；
    
    
    
    
}


-(void)setTopic:(KeruiTopic *)topic
{

    _topic=topic;
    
    UIImage*placher=nil;
    
//    AFNetworkReachabilityManager*mger=[AFNetworkReachabilityManager sharedManager];
//    
//    UIImage*orimage=[[SDImageCache sharedImageCache]imageFromDiskCacheForKey:topic.image1];
//    if (orimage) {
//        
//        self.imageView.image=orimage;
//    }
//    else
//    {
//        if (mger.isReachableViaWiFi)
//        {
//            
//             [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.image1]placeholderImage:placher];
//        }else if (mger.isReachableViaWWAN)
//        {
//            BOOL  dowenloadorimageWhen3GOr4G=YES;
//            
//            if (dowenloadorimageWhen3GOr4G)
//            {
//                
//                
//                   [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.image1]placeholderImage:placher];
//                
//                
//            }else
//            {
//            
//            
//               [self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.image0]placeholderImage:placher];
//            
//            
//            }
//        
//        
//        
//        }else
//        {
//        
//            UIImage*thimage=[[SDImageCache sharedImageCache]imageFromMemoryCacheForKey:topic.image0];
//            
//            if (thimage)
//            {
//                self.imageView.image=thimage;
//            }
//        
//        else
//        {
//        
//        
//        
//            self.imageView.image=placher;
//        
//        }
//        
//        }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    }
//    
//   
    
      //[self.imageView sd_setImageWithURL:[NSURL URLWithString:topic.image1]placeholderImage:placher];
    
    [self.imageView Kerui_orimageView:topic.image1 thimage:topic.image0 placeher:placher completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if(!image)return ;
        
        
        
    }];
    
    self.playcount.text=[NSString stringWithFormat:@"%zd播放",topic.playcount];
    self.timelabel.text=[NSString stringWithFormat:@"%02zd:%02zd",topic.videotime/60,topic.videotime%60];


    
    //self.videocontroller = [[KRVideoPlayerController alloc] initWithFrame:self.imageView.bounds];

   
    





}








- (IBAction)player:(UIButton*)sender
{
    
    [self playing];
    
  }


-(void)playing
{



    [self  playVideoWithURL:[NSURL URLWithString:self.topic.videouri]];
    
    [self addSubview:self.videocontroller.view];
    
    






}

//-(void)paused
//{
//
//
//    [self.videocontroller pause];
//    [self.videocontroller play];
//
//
//}


- (void)playVideoWithURL:(NSURL *)url {
    if (!self.videocontroller) {
        self.videocontroller = [[KRVideoPlayerController alloc] initWithFrame:self.imageView.bounds];
        __weak typeof(self)weakSelf = self;
        [self.videocontroller setDimissCompleteBlock:^{
            weakSelf.videocontroller = nil;
        }];
    }
    self.videocontroller.contentURL = url;
    
    
}


//停止视频的播放
- (void)reset {
    [self.videocontroller dismiss];
    self.videocontroller = nil;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
