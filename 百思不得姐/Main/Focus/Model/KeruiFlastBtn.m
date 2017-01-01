//
//  KeruiFlastBtn.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/12/3.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiFlastBtn.h"

@implementation KeruiFlastBtn

-(void)layoutSubviews
{

    [super layoutSubviews];
    
    
    self.imageView.Kerui_y=0;
    
    self.imageView.Kerui_centerX=self.Kerui_Width*0.5;
    
    self.titleLabel.Kerui_y=self.Kerui_height-self.titleLabel.Kerui_height;
    
   // self.titleLabel.Kerui_centerX=self.Kerui_Width*0.5;



    [self.titleLabel sizeToFit];
    
    self.titleLabel.Kerui_centerX=self.Kerui_Width*0.5;
    





}

@end
