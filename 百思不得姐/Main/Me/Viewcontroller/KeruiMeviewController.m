//
//  KeruiMeviewController.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/29.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiMeviewController.h"
#import "KeruiNavController.h"
#import "KeruiCollectionViewCell.h"
#import "KeruiItemcolllec.h"
#import <SafariServices/SafariServices.h>
//#import "UIBarButtonItem+KeruiItem.h"
#import "FMKWebvieviewcontroller.h"

static NSString*const ID =@"cell";

static  NSInteger const colns=4;

 static CGFloat const maig =1;

#define ItemW   (KeruiScreenW-(colns-1)*maig)/colns


@interface KeruiMeviewController ()<UICollectionViewDelegate,UICollectionViewDataSource,SFSafariViewControllerDelegate>

@property(nonatomic,strong)NSMutableArray*dateSoure;
@property(nonatomic,weak)UICollectionView*collecView;
@end

@implementation KeruiMeviewController


-(NSMutableArray*)dateSoure
{

    if (!_dateSoure)
    {
        
        
        
        _dateSoure=[NSMutableArray array];
    }



    return _dateSoure;

}

-(void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    self.title=@"我";
    
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem ItemWithimage:[UIImage imageNamed:@"navigationbar_pop"] hightimage:[UIImage imageNamed:@"navigationbar_pop_hlighted"] target:self action:@selector(game)];
    
    //[self setFootView];
    
    [self requestDate];
    
      [self setFootView];
    
   // [self resData];
    //处理cell间距，默认tableview的分组样式，有额外头部和尾部的间距
    
    self.tableView.sectionHeaderHeight=0;
    
    self.tableView.sectionFooterHeight=10;
    
    self.tableView.contentInset=UIEdgeInsetsMake(-25, 0, 0, 0);
}


-(void)setFootView
{
    
    UICollectionViewFlowLayout*layout=[[UICollectionViewFlowLayout alloc]init];
    
    
    UICollectionView*collection=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:layout];
    
    _collecView=collection;
    
    collection.scrollEnabled=NO;
    
    //    NSInteger colns=4;
    //
    //    CGFloat maig =1;
    //
    //    CGFloat ItemW = (KeruiScreenW-(colns-1)*maig)/colns;
    //
    
    layout.itemSize=CGSizeMake(ItemW, ItemW);
    
    layout.minimumInteritemSpacing=maig;
    layout.minimumLineSpacing=maig;
    
    
    collection.backgroundColor=[UIColor grayColor];
    
    
    
    collection.delegate=self;
    
    collection.dataSource=self;
    
    self.tableView.tableFooterView=collection;
    
    
    
    
    [collection registerNib:[UINib nibWithNibName:@"KeruiCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
    // [collection registerClass:[KeruiCollectionViewCell class] forCellWithReuseIdentifier:ID];
    
    
    
    
    
}


-(void)requestDate
{


    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    
    NSMutableDictionary*dic=[NSMutableDictionary dictionary];
    
    dic[@"a"]=@"square";
    dic[@"c"]=@"topic";
    
   
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSArray*item=responseObject[@"square_list"];
        
        NSLog(@"%@",responseObject);
        
        [responseObject writeToFile:@"/Users/zwq/Documents/多线程2/你大爷/05-操笔/ad.plist "atomically:YES];
        

        
        
        _dateSoure=[KeruiItemcolllec mj_objectArrayWithKeyValuesArray:item];
        
       // [self resData];//处理数据
        
        NSInteger count =_dateSoure.count;
        
        NSInteger row=(count-1)/colns + 1;
        
        self.collecView.Kerui_height=row*ItemW;
        
        //设置tableview滚动范围自己计算的
        
        self.tableView.tableFooterView=self.collecView;
        
        
          [self resData];
        
        
        
        [self.collecView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            
        
        NSLog(@"error");
            
        }
        
    }];







}

#pragma 请求处理完成的数据
-(void)resData
{



    NSInteger count =self.dateSoure.count;
    
    NSInteger exter= count%colns;
    
    if (exter)
    {
        
        exter=count-exter;
        
        for (int i=0;i<exter;i++)
        {
           
            KeruiItemcolllec*iter=[[KeruiItemcolllec alloc]init];
            
            [self.dateSoure addObject:iter];
        }
    }
    
    






}


//-(void)setFootView
//{
//
//    UICollectionViewFlowLayout*layout=[[UICollectionViewFlowLayout alloc]init];
//
//
//    UICollectionView*collection=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:layout];
//    
//    _collecView=collection;
//    
//    collection.scrollEnabled=NO;
//    
////    NSInteger colns=4;
////    
////    CGFloat maig =1;
////    
////    CGFloat ItemW = (KeruiScreenW-(colns-1)*maig)/colns;
////
//    
//    layout.itemSize=CGSizeMake(ItemW, ItemW);
//    
//    layout.minimumInteritemSpacing=maig;
//    layout.minimumLineSpacing=maig;
//    
//    
//    collection.backgroundColor=[UIColor grayColor];
//    
//    
//    
//    collection.delegate=self;
//    
//    collection.dataSource=self;
//    
//    self.tableView.tableFooterView=collection;
//
//
//
//
//    [collection registerNib:[UINib nibWithNibName:@"KeruiCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
//   // [collection registerClass:[KeruiCollectionViewCell class] forCellWithReuseIdentifier:ID];
//
//
//
//
//
//}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{




    return self.dateSoure.count;
    
}


-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{





  KeruiCollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor whiteColor];
    
    KeruiItemcolllec*item=self.dateSoure[indexPath.row];
    
    cell.ITem=item;
    
    return cell;


}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"sddsd");
    
    KeruiItemcolllec*item=self.dateSoure[indexPath.row];
    
   // if (![item.Url containsString:@"http"])return;
    FMKWebvieviewcontroller*web=[[FMKWebvieviewcontroller alloc]init];
    
    web.url=item.Url;
    
    [self.navigationController pushViewController:web animated:YES];
    
  //  [self presentViewController:web animated:YES completion:nil];

    
//    
//    if (![item.Url containsString:@"http"])return;
//    NSURL*url=[NSURL URLWithString:item.Url];
//    
//    SFSafariViewController*sf=[[SFSafariViewController alloc]initWithURL:url];
//    
//    sf.delegate=self;
//    
//   // self.navigationController.navigationBarHidden=YES;
//    [self presentViewController:sf animated:YES completion:nil];
//    
    

//    UIApplication*app=[UIApplication sharedApplication];
//    
//    if ([app canOpenURL:[NSURL URLWithString:item.Url]])
//    {
//        
//        [app openURL:[NSURL URLWithString:item.Url]];
//    }
//
//

}


-(void)game
{
    
    
    KeruiNavController*set=[[KeruiNavController alloc]init];
    
    
    
    [self.navigationController pushViewController:set animated:YES];
    
    
    
    
    
    
    
}


@end
