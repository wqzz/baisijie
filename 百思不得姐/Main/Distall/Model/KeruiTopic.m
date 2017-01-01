//
//  KeruiTopic.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/12.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiTopic.h"

@implementation KeruiTopic

-(CGFloat)cellhelight
{


    if (_cellhelight)return _cellhelight;
    
    
    _cellhelight  += 105;
    
    CGFloat maig =15;
    
    
    CGSize textMAxSize = CGSizeMake(KeruiScreenW-2*maig, MAXFLOAT);
    
    
    _cellhelight += [self.text boundingRectWithSize:textMAxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height+maig;
    
    
    
    if (self.type != keruitypeword)
    {
       
        
        CGFloat MiddW=textMAxSize.width;
        
        CGFloat MiddH=MiddW*self.height/self.width;
        
        if (MiddH>=KeruiScreenH)
        {
            
            MiddH=200;
            
            self.Bigpicture=YES;
            
            
        }
        
        CGFloat MiddX=maig;
        CGFloat MiddY=_cellhelight;
        
        self.MiddFrame=CGRectMake(MiddX, MiddY, MiddW, MiddH);
        
        _cellhelight += MiddH+maig;
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    if (self.top_cmt.count)//最热评论
    {
    
        _cellhelight +=21;
        
        NSDictionary*cmt=self.top_cmt.firstObject;
        
        NSString*content=cmt[@"content"];
        NSString*username=cmt[@"user"][@"username"];
        
        
        
      NSString* topcmtlabel=[NSString stringWithFormat:@"%@ :%@",username,content];
        
        _cellhelight +=[topcmtlabel boundingRectWithSize:textMAxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height+maig;
        
    }

    
    
    _cellhelight +=45+maig;







    return _cellhelight;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

@end
