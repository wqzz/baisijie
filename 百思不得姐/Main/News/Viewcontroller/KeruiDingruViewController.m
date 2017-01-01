//
//  KeruiDingruViewController.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/30.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiDingruViewController.h"
#import "Kerui DRItem.h"
#import "KeruiDRTableViewCell.h"

@interface KeruiDingruViewController ()
@property(nonatomic,strong)NSArray*SUB;

@property(nonatomic,weak)AFHTTPSessionManager*meg;

@end

@implementation KeruiDingruViewController

static NSString*ID=@"cell";
-(NSArray*)SUB
{

    if (!_SUB) {
        _SUB=[NSArray array];
    }





    return _SUB;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadate];
    
    
    self.title=@"推荐标签";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"KeruiDRTableViewCell" bundle:nil] forCellReuseIdentifier:ID];
    
    //self.tableView.rowHeight=55;
    //取消分割线；1.万能的显示cell的分割线的方法，开始：1.取消cell的分割线，2.把tableview的背景颜色设置成cell的背景色，3.重新设置cell的frame；
   // self.tableView.separatorInset=UIEdgeInsetsZero;
    
    self.tableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor=[UIColor colorWithRed:220.0/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    
    [SVProgressHUD showInfoWithStatus:@"正在加载中...."];
}

-(void)viewWillDisappear:(BOOL)animated
{


    [super viewWillDisappear:animated];
    
    [SVProgressHUD dismiss];
    
    [_meg.tasks makeObjectsPerformSelector:@selector(cancel)];
    






}

-(void)loadate
{


    AFHTTPSessionManager*meg=[AFHTTPSessionManager manager];
    
    _meg=meg;
    
    NSMutableDictionary*dic=[NSMutableDictionary dictionary];
    
    dic[@"a"]=@"tag_recommend";
    
    dic[@"action"]=@"sub";
    dic[@"c"]=@"topic";
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    
    [meg GET:@"http://api.budejie.com/api/api_open.php" parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, NSArray*  _Nullable responseObject)
     {
        
        
         NSLog(@"%@",responseObject);
         
         
         [SVProgressHUD dismiss];
         [responseObject writeToFile:@"/Users/zwq/Documents/多线程2/你大爷/04-阅读/ad.plist "atomically:YES];
         
         
        _SUB =[Kerui_DRItem mj_objectArrayWithKeyValuesArray:responseObject];
         
         
         [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
        [SVProgressHUD dismiss];
    }];




    });





}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.SUB.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    KeruiDRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    

    
    
     Kerui_DRItem* ter= self.SUB[indexPath.row];
    
    cell.dasoure=ter;
    
    //cell.textLabel.text=ter.theme_name;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{




    return 80;

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
