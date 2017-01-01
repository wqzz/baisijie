//
//  UIImageView+KeruiUIimageVIew.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/17.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "UIImageView+KeruiUIimageVIew.h"

@implementation UIImageView (KeruiUIimageVIew)

-(void)Kerui_orimageView:(NSString *)orimageurl thimage:(NSString *)othimageurl placeher:(UIImage *)placer completed:(SDWebImageCompletionBlock)completedBlock
{



        AFNetworkReachabilityManager*mger=[AFNetworkReachabilityManager sharedManager];
    
        UIImage*orimage=[[SDImageCache sharedImageCache]imageFromDiskCacheForKey:orimageurl];
        if (orimage) {
    
//            self.image=orimage;
//            
//            completedBlock(orimage,nil,0,[NSURL URLWithString:orimageurl]);
            
             [self  sd_setImageWithURL:[NSURL URLWithString:orimageurl]placeholderImage:placer completed:completedBlock ];
        }
        else
        {
            if (mger.isReachableViaWiFi)
            {
    
                 [self  sd_setImageWithURL:[NSURL URLWithString:orimageurl]placeholderImage:placer completed:completedBlock ];
            }else if (mger.isReachableViaWWAN)
            {
                BOOL  dowenloadorimageWhen3GOr4G=YES;
    
                if (dowenloadorimageWhen3GOr4G)
                {
    
    
                    [self  sd_setImageWithURL:[NSURL URLWithString:orimageurl]placeholderImage:placer completed:completedBlock ];
    
    
                }else
                {
    
    
                    [self sd_setImageWithURL:[NSURL URLWithString:othimageurl]placeholderImage:placer  completed:completedBlock];
                    
                
    
    
                }
    
    
    
            }else
            {
    
                UIImage*thimage=[[SDImageCache sharedImageCache]imageFromMemoryCacheForKey:othimageurl];
                
                     completedBlock(orimage,nil,0,[NSURL URLWithString:othimageurl]);
                
              
    
                if (thimage)
                {
                    
                    self.image=thimage;
                    
//                    UIImage*thimage=[[SDImageCache sharedImageCache]imageFromMemoryCacheForKey:othimageurl];
//                    
//                    completedBlock(orimage,nil,0,[NSURL URLWithString:othimageurl]);
                    

                }
    
            else
            {
    
    
            
                self.image=placer;
            
            }
                
                
            }
        
        
        }





}


-(void)Kerui_Heard:(NSString *)url
{



    //用画圆的方法进行画圆 ,  2. kerui_Crieimagnamed: 这个方法的调用要注意；
    // 没有网咯图片的占位图片也要设置圆形；
    UIImage*placherimage=[UIImage kerui_Crieimagnamed:@"add_friend_icon_offical"];
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placherimage options:0 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
     {
         
         
         if (!image) return ; //如果没有网络图片直接返回；
         
         self.image=[image kerui_Crieimage];
         
         
         
         
         
         
     }];
    










}
@end
