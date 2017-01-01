//
//  KeruipichterView.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/15.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruipichterView.h"
#import "KeruiTopic.h"
#import "KeruiSeebigpicViewController.h"
#import "JYJProgressView.h"


@interface KeruipichterView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@property (weak, nonatomic) IBOutlet UIImageView *placherIMage;

@property (weak, nonatomic) IBOutlet UIImageView *gifView;
@property (weak, nonatomic) IBOutlet UIButton *seebigpicher;
@property (weak, nonatomic) IBOutlet JYJProgressView *progress;



@end

@implementation KeruipichterView
-(void)awakeFromNib
{


    [super awakeFromNib];
    
    self.autoresizingMask=UIViewAutoresizingNone;

    self.imageview.userInteractionEnabled=YES;
    
  UITapGestureRecognizer*Tap  =  [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(seebigpicture)];
    [self.imageview addGestureRecognizer:Tap];
    


}

-(void)seebigpicture
{

    KeruiSeebigpicViewController*seeBig=[[KeruiSeebigpicViewController alloc]init];
    
    seeBig.topic=self.topic;
    
    [self.window.rootViewController presentViewController:seeBig animated:YES completion:nil];









}
-(void)setTopic:(KeruiTopic *)topic
{

    _topic=topic;
    
    
    
    self.placherIMage.hidden=NO;
    
    [self.imageview sd_setImageWithURL:[NSURL URLWithString:topic.image1] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        self.progress.hidden=NO;
        
        topic.pressivew=1.0*receivedSize/expectedSize;
        
        [self.progress setProgress:topic.pressivew animated:YES];
        
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        self.progress.hidden=YES;
        
  
    
    
//   [self.imageview Kerui_orimageView:topic.image1 thimage:topic.image0 placeher:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//       
//       
//       if (!image) {
//           return ;
//        
//       }
    
       
       
       //处理超长图片的大小；
       if (self.imageview.image)
       {
           CGFloat imageW=topic.MiddFrame.size.width;
           
           CGFloat imageH=imageW*topic.height/topic.width;
           
           UIGraphicsBeginImageContext(CGSizeMake(imageW, imageH));
           
           [self.imageview.image drawInRect:CGRectMake(0, 0, imageW, imageH)];
           
           self.imageview.image=UIGraphicsGetImageFromCurrentImageContext();
           
           UIGraphicsEndImageContext();
           
       }
       
       self.placherIMage.hidden=YES;
       

       
       
       
   }];
    
  
    self.gifView.hidden =!topic.is_gif;

//    if ([topic.image1.lowercaseString hasSuffix:@"gif"])
//    {
//        
//        self.gifView.hidden=NO;
//    }
//    
//    else
//    {
//    
//    
//        self.gifView.hidden=YES;
//    
//    
//    }
//
//

    if (topic.isBigpicture)
    {
        self.seebigpicher.hidden=NO;
        
        self.imageview.contentMode=UIViewContentModeTop;
        
        self.imageview.clipsToBounds=YES;
        
        
            
        }
        
        
        
        
        
    else
    {
    
        self.seebigpicher.hidden=YES;
        
        self.imageview.contentMode=UIViewContentModeScaleToFill;
    
    
        self.imageview.clipsToBounds=NO;
    
    
    }


    


}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
