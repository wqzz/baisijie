//
//  KeruiRecommerViewViewController.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/22.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiRecommerViewViewController.h"
#import "KeruiRecommedViewCell.h"
#import "KeruiuserViewCell.h"
#import "KeruiRecommed.h"
#import "Keruiuser.h"

#define JYJSelectedCategory self.categories[self.Recommedview.indexPathForSelectedRow.row]


@interface KeruiRecommerViewViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *Recommedview;
@property (weak, nonatomic) IBOutlet UITableView *RCcommedUserVIew;

@property(nonatomic,strong)AFHTTPSessionManager*manager;

@property(nonatomic,strong)NSArray*categories;

@property(nonatomic,strong)NSMutableDictionary*params;


@end

@implementation KeruiRecommerViewViewController

static NSString * const JYJCategoryId = @"category";

static NSString * const JYJUserId = @"user";


-(AFHTTPSessionManager*)manager
{

    if (!_manager)
    {
      
        _manager=[AFHTTPSessionManager manager];
    }






    return _manager;


}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //self.view.backgroundColor=[UIColor whiteColor];
    
    [self creatertableview];
    
    [self setupresher];
    

    [self loadCategories];
    
       self.Recommedview.dataSource=self;
    
    self.Recommedview.delegate=self;
    
    self.RCcommedUserVIew.delegate=self;
    
    self.RCcommedUserVIew.dataSource=self;
    
    self.title=@"推荐";
}



-(void)creatertableview
{


    [self.Recommedview registerNib:[UINib nibWithNibName:NSStringFromClass([KeruiRecommedViewCell class]) bundle:nil] forCellReuseIdentifier:JYJCategoryId];
    
    [self.RCcommedUserVIew registerNib:[UINib nibWithNibName:NSStringFromClass([KeruiuserViewCell class]) bundle:nil] forCellReuseIdentifier:JYJUserId];
    
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.Recommedview.contentInset=UIEdgeInsetsMake(64, 0, 0, 0);
    
    
    self.RCcommedUserVIew.contentInset =self.Recommedview.contentInset;
    
    self.RCcommedUserVIew.rowHeight=70;
    
       


    //self.view.backgroundColor=[UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
    
    
    
    













}



- (void)loadCategories {
    // 显示指示器
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    
    // 发送请求
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 隐藏指示器
        [SVProgressHUD dismiss];
        // 服务器返回的Json数据
        self.categories = [KeruiRecommed mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
       // JYJLog(@"%zd", self.categories.count);
        // 刷新表格
        [self.Recommedview reloadData];
        
        // 默认选中首行
        [self.Recommedview selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
        //让用户表格进入下拉刷新状态
       [self.RCcommedUserVIew.mj_header beginRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 隐藏指示器
        //        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败!"];
        // 显示失败信息
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败!"];
    }];
}



//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//
//    if (tableView==self.Recommedview) {
//        
//        return self.categories.count;
//    }else{
//    
//    
//    
//         // 右边的用户表格
//            // 监测footer的状态
//           [self checkFooterState];
//            return [JYJSelectedCategory users].count;
//        
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
//    return self.categories.count;
//        
//    
//}
//
-(void)setupresher
{


    self.RCcommedUserVIew.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers) ];




}


- (void)loadNewUsers {
    KeruiRecommed *rc = JYJSelectedCategory;
    // 设置当前页码为1
    rc.currentPage = 1;
    
    // 发送请求
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] = @(rc.ID);
    params[@"page"] = @(rc.currentPage);
    self.params = params;
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 字典转模型
        NSArray *users = [Keruiuser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 清楚所有旧数据
        [rc.users removeAllObjects];
        
        // 添加当前类别到对应的数组中
        [rc.users addObjectsFromArray:users];
        
        // 保存总数
        rc.total = [responseObject[@"total"] integerValue];
        
        
        // 不是最后一次请求
        if (self.params != params) return;
        
        // 刷新右边表格
        [self.RCcommedUserVIew reloadData];
        
        // 结束刷新
        [self.RCcommedUserVIew.mj_header endRefreshing];
        
        // 让底部控件结束刷新
        [self checkFooterState];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.params != params) return;
        // 隐藏指示器
        //        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败!"];
        // 显示失败信息
        [SVProgressHUD showErrorWithStatus:@"加载推荐信息失败!"];
        // 结束刷新
        [self.RCcommedUserVIew.mj_header endRefreshing];
    }];
    
}





/**
 *  时刻监测footer的状态
 */
- (void)checkFooterState {
    KeruiRecommed *rc = JYJSelectedCategory;
    
    // 每次刷新右边数据时，都控制footer显示或者隐藏
    self.RCcommedUserVIew.mj_footer.hidden = (rc.users.count == 0);
    
    // 让底部控件结束刷新
    if (rc.users.count == rc.total) { // 全部数据已经加载完毕
        [self.RCcommedUserVIew.mj_footer endRefreshingWithNoMoreData];
    } else {
        [self.RCcommedUserVIew.mj_footer endRefreshing];
    }
}







-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView==self.Recommedview) {
        
        return self.categories.count;
    }else{
        
        
        
        // 右边的用户表格
        // 监测footer的状态
        [self checkFooterState];
        return [JYJSelectedCategory users].count;
        
        
        
        
        
        
    }
    
    
    
    
    
  
    
    
}





-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{


    if (tableView==self.Recommedview)
    {
        
        KeruiRecommedViewCell*cell=[tableView dequeueReusableCellWithIdentifier:JYJCategoryId ];
        
        cell.recommed=self.categories[indexPath.row];
        
        return cell;
    }
    else
    {
    
        KeruiuserViewCell*cell=[tableView dequeueReusableCellWithIdentifier:JYJUserId];
    
    
        cell.userr=[JYJSelectedCategory users][indexPath.row];
        return cell;
    
    }





    
    
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 结束刷新
    [self.RCcommedUserVIew.mj_header endRefreshing];
    //[self.userTableView.mj_footer endRefreshing];
    
    if (tableView == self.Recommedview) { // 左边的类别表格
        KeruiRecommed *c = self.categories[indexPath.row];
        
        if (c.users.count) {
            // 显示曾经的数据
            [self.RCcommedUserVIew reloadData];
        } else {
            // 赶紧刷新表格，目的是:马上显示当前的category的用户数据，不让用户看见上有个category的残留数据
            [self.RCcommedUserVIew reloadData];
            
            // 进入下拉刷新状态
            [self.RCcommedUserVIew.mj_header beginRefreshing];
        }
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
