//
//  KeruiHuanCTOOL.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/12/6.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiHuanCTOOL.h"

@implementation KeruiHuanCTOOL


+(void)GetFile:(NSString *)dirtoary  complation:(void (^)( NSInteger))complationed
{

   // NSInteger
    
    
    //获取文件管理者；
    
    NSFileManager*manager=[NSFileManager defaultManager];
    
    
    
    BOOL isDirectory;
    
    BOOL isExirst =   [manager fileExistsAtPath:dirtoary isDirectory:&isDirectory];
    
    
    if (!isExirst|| !isDirectory)
    {
        
        
        
        
        
        NSException*excp=[NSException exceptionWithName:@"pathError" reason:@"笨蛋需要的是文件夹路径，并且路径要纯在" userInfo:nil];
        
        [excp raise];
        
        
        
        
        
        
    }
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        
        
        NSArray*subpath=[manager subpathsAtPath:dirtoary];
        
        NSInteger totaSize=0;
        
        for (NSString*sub in subpath)
        {
            //获取文件夹全路劲；
            
            NSString*filepath=[dirtoary stringByAppendingPathComponent:sub];
            
            //判断是否隐藏文件
            
            if ([filepath containsString:@".DS"]) continue;
            
            
            //判断是否文件夹
            
            BOOL isDirectory;
            
            BOOL isExirst =   [manager fileExistsAtPath:filepath isDirectory:&isDirectory];
            
            
            if (!isExirst||isDirectory) continue;
            
            
            
            
            
            
            
            
            
            
            
            //获取文件属性 attributesOfItemAtPath只能获取文件尺寸，不能获取文件夹；
            
            NSDictionary*attr=[manager attributesOfItemAtPath:filepath error:nil];
            
            
            NSInteger fileSize=(int)[attr fileSize];
            
            totaSize += fileSize;
            
            NSLog(@"%ld",(long)totaSize);
            
            
            
            
            
        }
        
        //异步线程计算完成回调；
        
        
        if (complationed) {
            
            complationed(totaSize);
        }
        


        
    });
    //获取文件夹下所有的子路径；
    
//    NSArray*subpath=[manager subpathsAtPath:dirtoary];
//    
//    NSInteger totaSize=0;
//    
//    for (NSString*sub in subpath)
//    {
//        //获取文件夹全路劲；
//        
//        NSString*filepath=[dirtoary stringByAppendingPathComponent:sub];
//        
//        //判断是否隐藏文件
//        
//        if ([filepath containsString:@".DS"]) continue;
//        
//        
//        //判断是否文件夹
//        
//        BOOL isDirectory;
//        
//        BOOL isExirst =   [manager fileExistsAtPath:filepath isDirectory:&isDirectory];
//        
//        
//        if (!isExirst||isDirectory) continue;
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
//        
//        //获取文件属性 attributesOfItemAtPath只能获取文件尺寸，不能获取文件夹；
//        
//        NSDictionary*attr=[manager attributesOfItemAtPath:filepath error:nil];
//        
//        
//        NSInteger fileSize=[attr fileSize];
//        
//        totaSize += fileSize;
//        
//        NSLog(@"%ld",totaSize);
//        
//        
//        
//        
//        
//    }
//    
//    
    
    
    
    
    
    
//    if (complationed) {
//        
//        complationed(totaSize);
//    }
//    



    


}
+(void)RemoveDiretorypath:(NSString *)dirpath
{


    //拿到文件管理者
    NSFileManager*manager=[NSFileManager defaultManager];
    
    //找到文件路径
  //  NSString*allfilePath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject];
    
    //获取allfilepath下的所有文件
    
    NSArray*Path = [manager contentsOfDirectoryAtPath:dirpath error:nil];
    
    
    BOOL isDirectory;
    
    BOOL isExiste =[manager fileExistsAtPath:dirpath isDirectory:&isDirectory];
    
    if (!isExiste|| !isDirectory)
    {
        
        
        NSException*excp=[NSException exceptionWithName:@"pathError" reason:@"笨蛋需要的是文件夹路径，并且路径要纯在" userInfo:nil];
        
        [excp raise];
        
    }
    
    
    for (NSString*subpath in  Path)
    {
        
        //平接完整路径；
        
        NSString*fpath=[dirpath stringByAppendingPathComponent:subpath];
        
        [manager removeItemAtPath:fpath error:nil];
    }
    












}

@end
