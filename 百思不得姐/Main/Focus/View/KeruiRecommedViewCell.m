//
//  KeruiRecommedViewCell.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/22.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiRecommedViewCell.h"
#import "KeruiRecommed.h"

@interface KeruiRecommedViewCell ()

@property (weak, nonatomic) IBOutlet UIView *selections;

@end

@implementation KeruiRecommedViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    //self.backgroundColor=[UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0];
    
    self.backgroundColor=JYJColor(244, 244, 244);
    self.selections.backgroundColor=JYJColor(219, 21, 26);

    
    
    
    
    
    
    
}

-(void)setRecommed:(KeruiRecommed *)recommed
{

    _recommed=recommed;
    
    
    self.textLabel.text=recommed.name;




}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textLabel.Kerui_y=2;
    
    self.textLabel.Kerui_height=self.contentView.Kerui_height-2*self.textLabel.Kerui_y;







}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
//    if (selected) {
//        self.selections.hidden=NO;
//    }
//    else
//    {
//        self.selections.hidden=YES;
//    
//    }
//    
//
    
    selected = !selected;
    
    self.selections.hidden = !selected;
    
    self.textLabel.textColor = selected ? self.selections.backgroundColor:JYJColor(78, 78, 78);


}

@end
