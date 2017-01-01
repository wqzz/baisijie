//
//  KeruiSeebigpicViewController.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/19.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiSeebigpicViewController.h"
#import "KeruiTopic.h"
#import <Photos/Photos.h>

@interface KeruiSeebigpicViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *back;
@property (weak, nonatomic) IBOutlet UIButton *SAVE;

@property(nonatomic,weak)UIImageView*imageview;

@property(weak,nonatomic)UIScrollView*scr;

/**  创建相册      */
-(PHAssetCollection*)craetcollection;


/**  获得图片在相册里交换，最后看的加到相册最前面  */
-(PHFetchResult<PHAsset *>*)creatinster;

@end

@implementation KeruiSeebigpicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView*scr=[[UIScrollView alloc]init];
    
  //  scr.backgroundColor=[UIColor redColor];
    
   // scr.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    //还可以懒加载，和在layoutsbuview里fram赋值；
    
    //点击scr也能返回；
    
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Back:)];
    [scr addGestureRecognizer:tap];
    
    scr.frame=[UIScreen mainScreen].bounds;
    self.scr=scr;
    [self.view insertSubview:scr atIndex:0];
    
    
    UIImageView*imageview=[[UIImageView alloc]init];
    
    self.imageview=imageview;
    
  //  [imageview sd_setImageWithURL:[NSURL URLWithString:self.topic.image1]];
    
    [imageview sd_setImageWithURL:[NSURL URLWithString:self.topic.image1] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (!image) return ;
        
        self.SAVE.enabled=YES;//下载完成才保存；
        
    }];
    
    imageview.Kerui_Width=scr.Kerui_Width;
    
    imageview.Kerui_x=0;
    
    imageview.Kerui_height=imageview.Kerui_Width*self.topic.height/self.topic.width;
    
    if (imageview.Kerui_height>KeruiScreenH)
    {
        
        imageview.Kerui_y=0;
        
        scr.contentSize=CGSizeMake(0, imageview.Kerui_height);
        
    }
    else
    {
    
    
        imageview.Kerui_centerY=scr.Kerui_height*0.5;
    
    
    }
    

    
    
    [scr addSubview:imageview];
    
    //缩放大图；
    
    CGFloat scale =self.topic.width/imageview.Kerui_Width;
    
    if (scale>1) {
        
        scr.maximumZoomScale=2.0;
        
        scr.delegate=self;
    }
    
    
    
    NSLog(@"%zd",scr.autoresizingMask);
    
}
#pragma <uisscrviewdelegate>


-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{

    return self.imageview;




}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Back:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(PHAssetCollection*)craetcollection
{

    //在 collections 里抓取一个类型判断在ALBum里tilte是否存在或者重复；
    PHFetchResult<PHAssetCollection *>*collections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    
    
    
    NSString*title=[NSBundle mainBundle].infoDictionary [(__bridge NSString *) kCFBundleNameKey];
    
    //kCFBundleNameKey=@"cfbunlemame";
    
    
    PHAssetCollection*creatcollection=nil;
    
    for (PHAssetCollection*collection in collections)
    {
        
        if ([collection.localizedTitle isEqualToString:title])
        {
            creatcollection=collection;
            
        }
        NSLog(@"%@",collection.localizedTitle);
        
        
        
    }
    
    
    
    if (creatcollection==nil)
    {
        //创建自定义相册；
        
        NSError*error= nil;
        
        __block  NSString*creatcollectionID= nil;
        
        [[PHPhotoLibrary sharedPhotoLibrary]performChangesAndWait:^{
            
            //  NSString*title=[NSBundle mainBundle].infoDictionary [(NSString *) kCFBundleNameKey];
            
            
            //找到相册的标示ID，解决一开始creatcollection有值却是nil的bug
            
            creatcollectionID  =[PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:title].placeholderForCreatedAssetCollection.localIdentifier;
            
            //  kCFBundleNameKey=@"cfbunleName"
            
            // [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:title];
            
            
            
        } error:&error];
        
        
        
        creatcollection = [PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:@[creatcollectionID] options:nil].firstObject;
        
    }







    return creatcollection;

}

-(PHFetchResult<PHAsset*>* )creatinster
{
  
  
  
  
    NSError*error=nil;
    //保存图片到相机胶套
    
    __block NSString *assertID=nil;
    [[PHPhotoLibrary sharedPhotoLibrary]performChangesAndWait:^{
        assertID =  [PHAssetChangeRequest creationRequestForAssetFromImage:self.imageview.image].placeholderForCreatedAsset.localIdentifier;
        
    } error:&error];
    
    if (error) {
        return nil;
    }
    
    return [PHAsset fetchAssetsWithLocalIdentifiers:@[assertID] options:nil];
    
    
    

  
  
  
  
  
  
  
  
  
  }
- (IBAction)SAVE:(id)sender
{
   
//    UIImageWriteToSavedPhotosAlbum(self.imageview.image, self, @selector(done), nil);
//
    
    
    
    
    PHAuthorizationStatus loader =[PHPhotoLibrary authorizationStatus];

    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            if (status==PHAuthorizationStatusDenied && loader !=PHAuthorizationStatusDenied)
            {
                
                
                NSLog(@"提醒用户打开开关");
                
                
                
            }else if (status==PHAuthorizationStatusAuthorized)
            {
                
                
                [self Savimage];
                
            }else if (status==PHAuthorizationStatusRestricted)
            {
                
                
                
                [SVProgressHUD showErrorWithStatus:@"系统原因无法访问相册"];
                
                
                
                
            }
            
            
            
            
        });
        
          
    
    }];
    
    
    
}


-(void)Savimage
{

    //获得相片
    
    NSError*error = nil;
    
    PHFetchResult<PHAsset*>*craetphassert=self.creatinster;
    
    if (craetphassert==nil) {
        NSLog(@"保存图片失败");
        return;
    }
    
    
    
    
    
    
    
    
    //获得相册；
    
    PHAssetCollection*colletion=self.craetcollection;
    
    if (error) {
        NSLog(@"创建相册失败");
        
        return;
    }
    
    
    //添加相册到刚才自定义相册；
    [[PHPhotoLibrary sharedPhotoLibrary]performChangesAndWait:^{
        
        
        PHAssetCollectionChangeRequest*chages=[PHAssetCollectionChangeRequest changeRequestForAssetCollection:colletion];
        
        
        [chages insertAssets:craetphassert atIndexes:[NSIndexSet  indexSetWithIndex:0]];
        
        
    } error:&error];
    
    
    
    if (error) {
        [SVProgressHUD showErrorWithStatus:@"保存失败"];
    }else{
        
        
        
        [SVProgressHUD showErrorWithStatus:@"保存成功"];
    }
    
    
    
    
    
    
    
    
    
    















}


//- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo;
//{
//    if (error) {
//        [SVProgressHUD showWithStatus:@"保存失败"];
//    }
//    else{
//    
//    
//        [SVProgressHUD showWithStatus:@"保存成功"];
//    
//    }
//
//
//
//
//
//
//}
//

-(void)done
{












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
