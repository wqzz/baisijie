//
//  KeruiDRTableViewCell.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/11/30.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiDRTableViewCell.h"
#import "Kerui DRItem.h"

@interface KeruiDRTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameView;

@property (weak, nonatomic) IBOutlet UILabel *numView;

@end
@implementation KeruiDRTableViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
   // _iconView.layer.cornerRadius=25;
    
   // _iconView.layer.masksToBounds=YES;
    
  //  self.layoutMargins=UIEdgeInsetsZero;
    
    
    
    
    
}

-(void)setFrame:(CGRect)frame
{
    
    //NSLog(@"%@",NSStringFromCGRect(frame));先取值在赋值给   [super setFrame:frame];
    
    frame.size.height-=1;

    [super setFrame:frame];

    




}

-(void)setDasoure:(Kerui_DRItem *)dasoure
{


    _dasoure=dasoure;
    
    
    _nameView.text=dasoure.theme_name;
    
  
    [self numcount];
    
    
    //用画圆的方法进行画圆
    
    
    [self.iconView Kerui_Heard:dasoure.image_list];
    
//  // [ _iconView sd_setImageWithURL:[NSURL URLWithString:dasoure.image_list]];
// [_iconView sd_setImageWithURL:[NSURL URLWithString:dasoure.image_list] placeholderImage:[UIImage imageNamed:@"defaultusericon"] options:SDWebImageCacheMemoryOnly completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)
//    {
//        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
//        
//        //描述剪裁区域；
//        UIBezierPath*path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
//        
//        //设置剪裁区域
//        
//        [path addClip];
//        
//        //画图片
//        
//        [image drawAtPoint:CGPointZero];
//        
//        //取出图片
//        image=UIGraphicsGetImageFromCurrentImageContext();
//        
//        UIGraphicsEndImageContext();
//        
//     
//        
//        _iconView.image=image;
//        
//        
//        
//        
//        
//        
// }];
//    
    
    
    NSLog(@"%@",dasoure.image_list);






}

-(void)numcount
{




    NSString*numSter = [NSString stringWithFormat:@"%@人订阅",_dasoure.sub_number];
    
    NSInteger num=_dasoure.sub_number.integerValue;
    
    
    //1.打印全部订阅人数
    //2.拿到全部人数的integerValue；
    //3.全部人数除以1万；cgfloat
    //打印除以1万的人数；
    //对_numView.text，进行赋值；
    
    
    if (num>10000)
    {
        
        CGFloat s = num/10000.0;
        
        numSter=[NSString stringWithFormat:@"%.1f万人订阅",s];
        
        
        
    }
    
    
    _numView.text=numSter;
    

    



}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
