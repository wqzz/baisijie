//
//  KeruiNavController.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/29.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiNavController.h"
#import "KeruiHuanCTOOL.h"


#define      Cache    [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject]


@interface KeruiNavController ()

@property(nonatomic,assign)NSInteger Totalsize;

@end
static NSString*const ID=@"cell";
@implementation KeruiNavController
-(void)viewDidLoad
{
    
    [super viewDidLoad];
    
    self.title=@"设置";
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    
  //  self.navigationItem.leftBarButtonItem=[UIBarButtonItem backWithimage:[UIImage imageNamed:@"navigationbar_back"]  hightimage:[UIImage imageNamed:@"navigationbar_back_hlighted"]  target:self action:@selector(back) title:@"反回"];
    
    [SVProgressHUD showWithStatus:@"正在计算缓存"];
   [KeruiHuanCTOOL GetFile:Cache complation:^(NSInteger Totalsier) {
        
        
        
        _Totalsize=Totalsier;
        
        
        [self.tableView reloadData];
        
        
        
        [SVProgressHUD dismiss];
        
        
    }];

    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    self.navigationController.tabBarController.tabBar.hidden=YES;
    
    
    
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    
    
    
    [super viewWillDisappear:animated];
    
    
    
    self.navigationController.tabBarController.tabBar.hidden=NO;
    
    
    
    
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return 1;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
   
    
    
    
    //SDImageCache 帮我们做了缓存
  //  NSUInteger SDimageSIZ =[SDImageCache sharedImageCache].getSize;
    
    
  
    

    cell.textLabel.text=[self sizeSTR];


    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

//  //拿到文件管理者
//    NSFileManager*manager=[NSFileManager defaultManager];
//    
//    //找到文件路径
//    NSString*allfilePath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject];
//    
//    //获取allfilepath下的所有文件
//    
//   NSArray*Path = [manager contentsOfDirectoryAtPath:allfilePath error:nil];
//    
//    
//    for (NSString*subpath in  Path)
//    {
//        
//        //平接完整路径；
//        
//        NSString*fpath=[allfilePath stringByAppendingPathComponent:subpath];
//        
//        [manager removeItemAtPath:fpath error:nil];
//    }
    

    [KeruiHuanCTOOL RemoveDiretorypath:Cache];
    
    _Totalsize=0;
    
    [self.tableView reloadData];
    
    
    




}

-(NSString*)sizeSTR
{


    //找到文件路径
    //NSString*allfilePath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject];
    
    
    
    
    //   NSLog(@"%ld",SDimageSIZ);
    
//    NSUInteger TotalSier =[KeruiHuanCTOOL GetFile:Cache complation:^(NSInteger) {
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
//    }];
    
    
    NSUInteger TotalSier=_Totalsize;
    
    NSString*sizeStr=@"清除缓存";
    
    
    if (TotalSier>1000*1000)
    {
        CGFloat sizeF=TotalSier/1000.0/1000.0;
        
        sizeStr=[NSString stringWithFormat:@"%@(%.1fMB)",sizeStr,sizeF];
        
        
    }else if (TotalSier>1000)
        
    {
        CGFloat sizeF=TotalSier/1000.0;
        
        sizeStr=[NSString stringWithFormat:@"%@(%.1fKb)",sizeStr,sizeF];
        
        
        
        
    }
    else if (TotalSier>0)
    {
        
        
        
        //CGFloat sizeF=TotalSier/1000.0;
        
        sizeStr=[NSString stringWithFormat:@"%@(%.ldKb)",sizeStr,TotalSier];
        
        
        
        
        
        
        
    }

    return sizeStr;


}

//自己去计算缓存

//-(NSUInteger)getFilesize:(NSString*)Directories
//{
//
//
////    //找到文件路径
////    NSString*allfilePath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject];
////    
////    //找到文件里的文件夹
////    
////    NSString*defaulth=[allfilePath stringByAppendingPathComponent:@"default"];
////    
//    //获取文件管理者；
//    
//    NSFileManager*manager=[NSFileManager defaultManager];
//    
//    //获取文件夹下所有的子路径；
//    
//    NSArray*subpath=[manager subpathsAtPath:Directories];
//    
//    NSInteger totaSize=0;
//    
//    for (NSString*sub in subpath)
//    {
//        //获取文件夹全路劲；
//        
//        NSString*filepath=[Directories stringByAppendingPathComponent:sub];
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
//     BOOL isExirst =   [manager fileExistsAtPath:filepath isDirectory:&isDirectory];
//        
//        
//        if (!isExirst||isDirectory) continue;
//        
//        
//
//    
//    
//    //获取文件属性 attributesOfItemAtPath只能获取文件尺寸，不能获取文件夹；
//    
//    NSDictionary*attr=[manager attributesOfItemAtPath:filepath error:nil];
//    
//    
//    NSInteger fileSize=[attr fileSize];
//        
//        totaSize += fileSize;
//    
//    NSLog(@"%ld",totaSize);
//    
//    
//    
//    
//    
//    }
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
//    return totaSize;
//
//}
//

@end
