//
//  KeruiuserViewCell.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/22.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiuserViewCell.h"
#import "Keruiuser.h"

@interface KeruiuserViewCell ()


@property (weak, nonatomic) IBOutlet UIImageView *iconimage;
@property (weak, nonatomic) IBOutlet UILabel *nametext;
@property (weak, nonatomic) IBOutlet UILabel *detailtext;

@end

@implementation KeruiuserViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setUserr:(Keruiuser *)userr
{

    _userr=userr;
    
    [self.iconimage Kerui_Heard:userr.header]; ;
    
    self.nametext.text=userr.screen_name;
    
    if (userr.fans_count>10000.0)
    {
      
        self.detailtext.text=[NSString stringWithFormat:@"%.f万粉丝关注",userr.fans_count/10000.0];
    }else
    {
    
    
        self.detailtext.text=[NSString stringWithFormat:@"%zd粉丝关注",userr.fans_count];

    
    
    
    }
    


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
