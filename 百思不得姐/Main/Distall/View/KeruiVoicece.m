//
//  KeruiVoicece.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/20.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiVoicece.h"
#import "KeruiTopic.h"
#import "KeruiSeebigpicViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "XFVociePlayerController.h"

@interface KeruiVoicece ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *playcount;
@property (weak, nonatomic) IBOutlet UILabel *playtime;
@property (weak, nonatomic) IBOutlet UIImageView *placher;
@property (weak, nonatomic) IBOutlet UIButton *playBton;
@property(strong,nonatomic)XFVociePlayerController*voicePlayer;




@end

@implementation KeruiVoicece




-(void)awakeFromNib
{
    
    
    [super awakeFromNib];
    
    self.autoresizingMask=UIViewAutoresizingNone;
    
    self.imageView.userInteractionEnabled=YES;
    
    UITapGestureRecognizer*Tap  =  [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(seebigpicture)];
    [self.imageView addGestureRecognizer:Tap];
    
    

    
    
}

-(void)seebigpicture
{
    KeruiSeebigpicViewController*see=[[KeruiSeebigpicViewController alloc]init];
    
    
    see.topic=self.topic;
    
    
    [self.window.rootViewController presentViewController:see animated:YES completion:nil];








}

-(void)setTopic:(KeruiTopic *)topic
{
    
    
    _topic=topic;
    
    
    
    //UIImage*placher=nil;
    // [self.imageview Kerui_orimageView:topic.image1 thimage:topic.image1 placeher:placher];
    
    
    
    self.placher.hidden=NO;
    [self.imageView Kerui_orimageView:topic.image1 thimage:topic.image0 placeher:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (!image) return ;
        
        
        
        self.placher.hidden=YES;
        
    }];
    
    
    //[self.imageview sd_setImageWithURL:[NSURL URLWithString:topic.bimageuri]];、、
    
    if (topic.playcount>10000)
    {
        
        self.playcount.text=[NSString stringWithFormat:@"%.1f万播放",topic.playcount/10000.0];
        
  
    }else{
    
    
        self.playcount.text=[NSString stringWithFormat:@"%zd播放",topic.playcount];

    
    
    }
    
    
    
    
    self.playtime.text=[NSString stringWithFormat:@"%02zd:%02zd",topic.viocetime/60,topic.viocetime%60];
    
    
    
    
    
    
    
    
    
    
    
    
}





- (IBAction)playBton:(UIButton*)sender
{
    self.playBton.hidden = YES;
    self.voicePlayer = [[XFVociePlayerController alloc]initWithNibName:@"XFVociePlayerController" bundle:nil];
    self.voicePlayer.url = self.topic.voiceuri;
    self.voicePlayer.totalTime = self.topic.viocetime;
    self.voicePlayer.view.Kerui_Width = self.imageView.Kerui_Width;
    self.voicePlayer.view.Kerui_y = self.imageView.Kerui_height - self.voicePlayer.view.Kerui_height;
    [self addSubview:self.voicePlayer.view];
    
//    if ((sender.selected =!sender.selected) )
//    {
//        [self.voicePlayer pause];
//
//    }
    
    
}
//重置

    
-(void)reset {
    
    [self.voicePlayer dismiss];
    [self.voicePlayer.view removeFromSuperview];
    self.voicePlayer = nil;
    self.playBton.hidden = NO;
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
