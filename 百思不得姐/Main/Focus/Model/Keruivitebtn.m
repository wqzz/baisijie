//
//  Keruivitebtn.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/28.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "Keruivitebtn.h"

@implementation Keruivitebtn


-(instancetype)initWithFrame:(CGRect)frame
{


    if (self=[super initWithFrame:frame])
    {
        
        
        
        [self setup];
        
        
        
        
    }



    return self;

}








-(void)awakeFromNib
{

    [super awakeFromNib];
    
    
    
    

    [self setup ];





}

-(void)setup
{




    self.titleLabel.textAlignment=NSTextAlignmentCenter;



}


-(void)layoutSubviews
{


    [super layoutSubviews];
    
    
    self.imageView.Kerui_x=0;
    self.imageView.Kerui_y=0;
    
    self.imageView.Kerui_Width=self.Kerui_Width;
    
    self.imageView.Kerui_height=self.imageView.Kerui_Width;
    
    self.titleLabel.Kerui_x=0;
    
    self.titleLabel.Kerui_y=self.imageView.Kerui_height;
    
    self.titleLabel.Kerui_Width=self.Kerui_Width;
    self.titleLabel.Kerui_height=self.Kerui_height-self.imageView.Kerui_height;











}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
