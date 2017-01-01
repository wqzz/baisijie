//
//  KeruiTopALLViewController.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/8.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiTopALLViewController.h"
#import "KeruiTopic.h"
#import "KeruiMainViewCell.h"
#import "KRVideoPlayerController.h"
#import "KeruiVideView.h"

static NSString*const ID=@"Maincell";
@interface KeruiTopALLViewController ()

//加载下一页冲那里开始加载用maxtime
@property(nonatomic,copy) NSString* maxtime;
@property(nonatomic,weak)UIView*Heardview;
@property(nonatomic,weak)UIView*footview;

@property(nonatomic,weak)UILabel*footlabel;

@property(nonatomic,weak)UILabel*headlabel;
@property(nonatomic,assign)NSInteger datecount;

@property(nonatomic,assign ,getter=isFootRefrshing)BOOL FootRefrshing;
@property(nonatomic,assign ,getter=isHeadRefrshing)BOOL HeadRefrshing;

@property(nonatomic,strong)NSMutableArray<KeruiTopic*>*dasoure;

@property(nonatomic, strong)AFHTTPSessionManager*meg;

@property(nonatomic,strong)KRVideoPlayerController*videoController;
@property(nonatomic,weak)KeruiVideView*video;



@end

@implementation KeruiTopALLViewController

-(AFHTTPSessionManager*)meg
{
    
    
    if (!_meg) {
        _meg=[AFHTTPSessionManager manager];
    }
    
    
    return _meg;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
  //  self.view.backgroundColor=[UIColor grayColor];
    
    
    self.tableView.contentInset= UIEdgeInsetsMake(UInavGationH + UItitileH, 0, UITabBarH, 0);
    //设置滚动条在可视范围之内；
    self.tableView.scrollIndicatorInsets=self.tableView.contentInset;
    
    //取消cell的分割线
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    // self.tableView.estimatedRowHeight=100;//估算高度的作用了解；
    [[NSNotificationCenter  defaultCenter]addObserver:self selector:@selector(tabbarDidrepartClick) name:keruiTabbarbuttondidRepeatNotication object:nil];
    
    [[NSNotificationCenter  defaultCenter]addObserver:self selector:@selector(titlebtnDidrepartClick) name:keruiTitlebuttondidRepeatNotication object:nil];
    
    //接收通知；
    NSLog(@"[KeruiTopALLViewController viewDidLoad]");
    
    [self setUpFootresh];
    [self setupHeardresh];
    [self HeadbeginReshing];//一进来自动刷新；
    
    //注册maincell；
    
    UINib*nib=[UINib nibWithNibName:NSStringFromClass([KeruiMainViewCell class]) bundle:nil];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:ID];
    
    
    
}



//-(void)viewDidDisappear:(BOOL)animated
//{
//
//    [super viewDidDisappear:animated];
//    
//    //[self.view removeFromSuperview];
//    
//    [_video reset];
//    
//    
//    
//
//
//
//}
//添加播放按钮通知

- (void)playVideoWithURL:(NSURL *)url {
    if (!self.videoController) {
        
        self.videoController = [[KRVideoPlayerController alloc] initWithFrame:CGRectMake(0, 0, KeruiScreenW, KeruiScreenW*(9.0/16.0))];
        __weak typeof(self)weakSelf = self;
        [self.videoController setDimissCompleteBlock:^{
            weakSelf.videoController = nil;
        }];
        [self.videoController showInWindow];
    }
    self.videoController.contentURL = url;
}


-(void)dealloc
{
    
    
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}

-(void)setupHeardresh
{
    UILabel*adlabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.tableView.Kerui_Width, 35)];
    
    adlabel.text=@"广告";
    adlabel.backgroundColor=[UIColor blackColor];
    adlabel.textAlignment=NSTextAlignmentCenter;
    adlabel.textColor=[UIColor whiteColor];
    
    self.tableView.tableHeaderView=adlabel;
    
    
   // self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNEwDate)];
    
    
    UIView*HeadView=[[UIView alloc]initWithFrame:CGRectMake(0, -50, self.tableView.Kerui_Width, 50)];
    
    UILabel*headlabel=[[UILabel alloc]init];
    headlabel.text=@"下拉可以加载更多";
    headlabel.frame=HeadView.bounds;
    
    headlabel.backgroundColor=[UIColor redColor];
    
    headlabel.textAlignment=NSTextAlignmentCenter;
    
    headlabel.textColor=[UIColor whiteColor];
    
    [HeadView addSubview:headlabel];
    
    [self.tableView addSubview:HeadView];
    
    self.Heardview=HeadView;
    
    self.headlabel=headlabel;
    
    
    //  self.tableView.tableHeaderView=HeadView;
    
    
    
    
    
    
    
    
}

-(void)setUpFootresh
{
    
    UIView*footView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.Kerui_Width, 35)];
    
    UILabel*label=[[UILabel alloc]init];
    label.text=@"上拉可以加载更多";
    label.frame=footView.bounds;
    
    label.backgroundColor=[UIColor redColor];
    
    label.textAlignment=NSTextAlignmentCenter;
    
    label.textColor=[UIColor whiteColor];
    
    [footView addSubview:label];
    
    self.footview=footView;
    
    self.footlabel=label;
    
    
    self.tableView.tableFooterView=footView;
    
    
    
    
    
}

//-(void)dealFootView
//{
//
//
//    // 还么有内容的时候cell的为空，不需要加载；
//    if (self.tableView.contentSize.height==0) return;
//
//    //如果正在刷新直接返回
//    if (self.isFootRefrshing) return;
//    CGFloat offx=self.tableView.contentSize.height+self.tableView.contentInset.bottom-self.tableView.Kerui_height;
//
//
//    if (self.tableView.contentOffset.y>=offx)
//    {
//
//
//
//        self.FootRefrshing=YES;
//
//        NSLog(@"foot 已经出现");
//
//        self.footlabel.text=@"正在加载更多";
//        self.footlabel.backgroundColor=[UIColor blueColor];
//        NSLog(@"正在向服务器请求数据加载更多");
//
//
//
//    }
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//
//
//
//        self.datecount += 5;
//
//        [self.tableView reloadData];
//
//        //结束刷新；
//        self.FootRefrshing=NO;
//
//        self.footlabel.text=@"上拉可以加载更多";
//        self.footlabel.backgroundColor=[UIColor redColor];
//
//    });
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
//}
-(void)tabbarDidrepartClick
{
    
    // 1.点击精华的时候才打印allViewcontroller但是点击tabbar其他按钮一样会有打印allviewcontroller，
    //2. 还有点击allVIewcontroller的时候还是点击其他控制器一样回打印allviewcontroller，所以，如果点击精华的时候其他tabbar的字控制器就是nil返回，同时点击allviewcontroller的时候scortop是等于YEs的其他不是就返回；
    
    if (self.view.window==nil) return;
    
    
    if (self.tableView.scrollsToTop==NO) return;
    
    
    NSLog(@"%@刷新数据",self.class);
    
    //[self HeadbeginReshing];
    
    [self.tableView.mj_header beginRefreshing];
    
    
    
    
    
}

-(void)titlebtnDidrepartClick
{
    
    
    [self tabbarDidrepartClick];
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return ;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
    //判断有没有数据隐藏footview；
    self.footview.hidden=(self.dasoure.count==0);
    return self.dasoure.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //    static NSString* ID=@"cell";
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //    if (cell==nil) {
    //
    //
    //
    //        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    //
    //         cell.backgroundColor=[UIColor clearColor];
    
    
    
    //   KeruiTopic*topic=self.datecount[indexPath.row];
    
    // }
    
    
    
    //  cell.textLabel.text=[NSString stringWithFormat:@"test-%zd",indexPath.row];
    
    KeruiMainViewCell*cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    KeruiTopic*topic=self.dasoure[indexPath.row];
    
    cell.topic=topic;
    
    
    
    
    return cell;
}


/*
 
 下面的helightforrow的特点；
 1.默认的情况下，每次刷新表格时，有多少数据，这个方法就一次性调用多少次，（比如有100次就调用100次）
 2.每当又cell进入屏幕范围内就会调用这个方法，调用太多浪费，
 3.解决的办法有，通过字典来的key对应vaule
 
 4. 下面的方法通过模型来解决；
 
 KeruiTopic*topic=self.dasoure[indexPath.row];
 
 nssstring*key =[nsstring strformt @"%p".topic]
 
 ／／nsstring*key=topic.description 也可以，description 是获取类名和指针内存地址的；
 
 cgfolat cellhelight =[self.cellhelightDict[key] doublevaule];
 if(cellhelight==0)
 {
 
 
 和toic模型里的方法一样；
 
 
 
 
 
 
 
 }
 
 
 
 
 
 
 
 
 
 
 
 
 */

//    -(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//    {
//
//
//
//
//
//
//
//        return 44;
//
//
//    }
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //    KeruiTopic*topic=self.dasoure[indexPath.row];
    //
    //    return topic.cellhelight;
    
    
    NSLog(@"%zd",indexPath.row);
    
    return self.dasoure[indexPath.row].cellhelight;
    
}

#pragma screedelagete

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    
    CGFloat offsetY =-(self.tableView.contentInset.top+self.Heardview.Kerui_height);
    
    if (self.tableView.contentOffset.y<=offsetY)
    {
        
        [self HeadbeginReshing];
        
        
    }
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    
    [self dealHeard];
    [self dealFootView];
    
    
       
    
    
    [[SDImageCache sharedImageCache]clearMemory];
    
    
    
}


-(void)dealHeard
{
    
    if (self.isHeadRefrshing) return;
    CGFloat offsetY =-(self.tableView.contentInset.top+self.Heardview.Kerui_height);
    
    if (self.tableView.contentOffset.y<=offsetY)
    {
        self.headlabel.text=@"松开刷新";
        self.headlabel.backgroundColor=[UIColor grayColor];
        
        
        
        
    }else
    {
        
        
        self.headlabel.text=@"下拉可以刷新";
        self.headlabel.backgroundColor=[UIColor redColor];
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
}


-(void)dealFootView
{
    
    
    // 还么有内容的时候cell的为空，不需要加载；
    if (self.tableView.contentSize.height==0) return;
    
    //如果正在刷新直接返回
    // if (self.isFootRefrshing) return;
    CGFloat offx=self.tableView.contentSize.height+self.tableView.contentInset.bottom-self.tableView.Kerui_height;
    
    
    if (self.tableView.contentOffset.y>=offx&&self.tableView.contentOffset.y>-(self.tableView.contentInset.top))
    {
        
        
        
        [self FootbeginReshing];
        
    }
    
    
}

-(void)HeadbeginReshing
{
    
    //  if (self.isFootRefrshing ) return;
    
    if (self.isHeadRefrshing ) return;
    self.headlabel.text=@"正在刷新";
    self.headlabel.backgroundColor=[UIColor blueColor];
    
    self.HeadRefrshing=YES;
    
    //目的是在下拉刷新的时候停留一下刷新在退回去变成红色那个下拉刷新；增加内边距;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        UIEdgeInsets inset =self.tableView.contentInset;
        
        inset.top +=self.Heardview.Kerui_height;
        
        self.tableView.contentInset =inset;
        
        
        //内边距增大了，偏移量没有控制偏移量，所以没有下来；
        
        self.tableView.contentOffset=CGPointMake(self.tableView.contentOffset.x, -inset.top);
        
        
        
    }];
    
    NSLog(@"发送个服务器，请求数据");
    
    
    [self loadNEwDate];
    
  //  [self.tableView.mj_header beginRefreshing];
    
}

/*
 
 bug； 如果服务器一开始给的数据比较小的时候上下拉同时出现在手机屏幕上并且同时刷新数据就有可能出现覆盖现象少一下数据的结果比喻； 下拉「40，39，38」上啦「37，36，35」
 有可能出现 「40，39，38，37，36，35」；
 解决办法1。 下拉刷新的时候，禁止上拉， 上拉也是；  egg: if (self.isFootRefrshing ) return;
 
 2. 通过AFNbetworking 的task禁止，
 
 
 
 */


-(keruitype)type
{
    
    
    
    
    
    
    return 0;
    
    
    
}


-(void)loadNEwDate
{
    // 取消之前的请求；并且关闭session ，一旦关闭session就无法发送任何的请求；
    
    
    [self.meg.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    
    // AFHTTPSessionManager*meg=[AFHTTPSessionManager manager];
    
    
    NSMutableDictionary*dic=[NSMutableDictionary dictionary];
    
    dic[@"a"]=@"list";
    
    dic[@"c"]=@"data";
    dic[@"type"]=@(self.type);
    
    
    //dic[@"max_id"]=@"12345";表示从最前那个开始加载.以后有的公司可能用得到@[40,39,38]表示的40开始加载返回大于40的；
    
    
    
    
    [self.meg GET:keruiBesurl parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         
         self.maxtime=responseObject[@"info"][@"maxtime"];
         NSLog(@"%@",responseObject);
         
         //  NSMutableArray*array=[KeruiTopic  mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
         
         //             if (self.dasoure)／／和上面的Max-id对应；
         //             {
         //                 [self.dasoure insertObjects:array atIndexes:[NSIndexSet indexSetWithIndex:0]];
         //             }
         //             else{
         //
         //
         //
         //                 self.dasoure=array;
         //
         //
         //             }
         
         [responseObject writeToFile:@"/Users/zwq/Documents/多线程2/你大爷/06-尼玛/new.plist "atomically:YES];
         
         self.dasoure=[KeruiTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
         
         [self.tableView reloadData];
         
         
         
         
         
         
         [self HeardendReshing];
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         
         NSLog(@"%@",error);
         
         if (error.code != NSURLErrorCancelled) {
             //看error.code可以通过   NSURLErrorDomain 查看；
             
             [SVProgressHUD showWithStatus:@"网络繁忙清稍后再试"];
             
         }
         
         [self HeardendReshing];
     }];
    
    
    
    
    
    
    
    
    
    
    
}

-(void)HeardendReshing
{
    
    
    self.HeadRefrshing=NO;
    
    UIEdgeInsets inset =self.tableView.contentInset;
    
    inset.top-= self.Heardview.Kerui_height;
    
    self.tableView.contentInset=inset;
    
    
    
    
    
    
}
-(void)FootbeginReshing
{
    
    //if (self.isHeadRefrshing) return;
    
    if (self.isFootRefrshing) return;
    
    
    NSLog(@"foot 已经出现");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.footlabel.text=@"正在加载更多";
        self.footlabel.backgroundColor=[UIColor blueColor];
        NSLog(@"正在向服务器请求数据加载更多");
    });
    
    
    
    
    
    
    
    [self loadMoreDate];
    
    
    
}
-(void)loadMoreDate
{
    
    
    
    
    
    [self.meg.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    NSMutableDictionary*dic=[NSMutableDictionary dictionary];
    
    dic[@"a"]=@"list";
    
    dic[@"c"]=@"data";
    dic[@"type"]=@(self.type);
    dic[@"maxtime"]=self.maxtime;
    
    
    
    [ self.meg GET:keruiBesurl parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
         
         
         self.maxtime=responseObject[@"info"][@"maxtime"];
         NSLog(@"%@",responseObject);
         
         
         // [SVProgressHUD dismiss];
         [responseObject writeToFile:@"/Users/zwq/Documents/多线程2/你大爷/06-尼玛/more.plist "atomically:YES];
         
         NSArray*moretop=[KeruiTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
         
         [self.dasoure addObjectsFromArray:moretop];
         
         
         [self.tableView reloadData];
         
         
         
         
         
         
         [self FootendReshing];
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         
         NSLog(@"%@",error);
         
         if (error.code != NSURLErrorCancelled) {
             //看error.code可以通过   NSURLErrorDomain 查看；
             
             [SVProgressHUD showWithStatus:@"网络繁忙清稍后再试"];
             
         }
         
         
         
         [self FootendReshing];
     }];
    
}

-(void)FootendReshing
{
    
    
    //结束刷新；
    self.FootRefrshing=NO;
    
    self.footlabel.text=@"上拉可以加载更多";
    self.footlabel.backgroundColor=[UIColor redColor];
    
    
}



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
