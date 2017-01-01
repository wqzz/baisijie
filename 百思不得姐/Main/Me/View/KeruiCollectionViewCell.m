//
//  KeruiCollectionViewCell.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/12/4.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiCollectionViewCell.h"
#import "KeruiItemcolllec.h"

@interface KeruiCollectionViewCell ()


@property (weak, nonatomic) IBOutlet UIImageView *iconIMage;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end

@implementation KeruiCollectionViewCell

-(void)setITem:(KeruiItemcolllec *)ITem
{


    _ITem=ITem;
    
    [_iconIMage sd_setImageWithURL:[NSURL URLWithString:ITem.icon]];
    
    _name.text=ITem.name;





}

- (void)awakeFromNib {
    // Initialization code
    
    [super awakeFromNib];
}

@end
