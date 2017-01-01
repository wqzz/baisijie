//
//  KeruiMainViewCell.m
//  百思不得姐
//
//  Created by 钟文秋 on 2016/12/14.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiMainViewCell.h"
#import "KeruiTopic.h"
#import "KeruiVideView.h"
#import "KeruiVoicece.h"
#import "KeruipichterView.h"


@interface KeruiMainViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *username;

@property (weak, nonatomic) IBOutlet UILabel *pastime;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UIButton *ding;
@property (weak, nonatomic) IBOutlet UIButton *cai;
@property (weak, nonatomic) IBOutlet UIButton *respotrbtn;
@property (weak, nonatomic) IBOutlet UIButton *Commentbtn;
@property (weak, nonatomic) IBOutlet UIView *topcmtView;
@property (weak, nonatomic) IBOutlet UILabel *topcmtlabel;

@property(nonatomic,weak)KeruiVoicece*Voicceview;
@property(nonatomic,weak)KeruiVideView*videoview;
@property(nonatomic,weak)KeruipichterView*pitcherciew;
    

@end

@implementation KeruiMainViewCell


-(KeruipichterView*)pitcherciew
{


    if (!_pitcherciew)
    {
        
        KeruipichterView*pitcherview=[KeruipichterView kerui_loadxib];
        
        [self.contentView addSubview:pitcherview];
        
        _pitcherciew=pitcherview;
        
        
        
        
        
    }
    return _pitcherciew;
}

-(KeruiVideView*)videoview
{
    
    
    if (!_videoview)
    {
        
        KeruiVideView*videoview=[KeruiVideView kerui_loadxib];
        
        [self.contentView addSubview:videoview];
        
        _videoview=videoview;
        
        
        
        
        
    }
    return _videoview;
}



-(KeruiVoicece*)Voicceview
{
    
    
    if (!_Voicceview)
    {
        
        KeruiVoicece*voiceview=[KeruiVoicece kerui_loadxib];
        
        [self.contentView addSubview:voiceview];
        
        _Voicceview=voiceview;
        
        
        
        
        
    }
    return _Voicceview;
}

-(void)prepareForReuse
{

    [super prepareForReuse];
    
    [_videoview  reset];
    
    [_Voicceview  reset];





}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"timeline_card_top_background"]];//timeline_card_top_background
    
}

-(void)setTopic:(KeruiTopic *)topic
{

    _topic=topic;
    
    
    [self.icon Kerui_Heard:topic.profile_image];

    
    
    
    self.username.text=topic.name;
    
    self.pastime.text=topic.passtime;
    
    self.text.text=topic.text;
    
    
    
    
    
    

    [self setupButton:self.ding numuber:topic.ding placher:@"顶"];
    [self setupButton:self.cai numuber:topic.cai placher:@"踩"];
    [self setupButton:self.respotrbtn numuber:topic.repost placher:@"分享"];
    [self setupButton:self.Commentbtn numuber:topic.comment placher:@"评论"];
//中间cell的内容；
    if (topic.type==keruitypepicture)
    {
        
        self.pitcherciew.hidden=NO;
        
        self.videoview.hidden=YES;
        
        self.Voicceview.hidden=YES;
        
        self.pitcherciew.topic=topic;
        
    }else if (topic.type==keruitypevoice)
    {

        self.pitcherciew.hidden=YES;
        
        self.videoview.hidden=YES;
        
        self.Voicceview.hidden=NO;
        self.Voicceview.topic=topic;
        
        

       
    }else if (topic.type==keruitypevideo)
    {

        
        self.videoview.hidden=NO;
        self.pitcherciew.hidden=YES;
        self.Voicceview.hidden=YES;
        
        self.videoview.topic=topic;
        
    
    }else if (topic.type==keruitypeword)
    {
    
    
    
        self.Voicceview.hidden=YES;
        self.videoview.hidden=YES;
        self.pitcherciew.hidden=YES;
        
        
    
    
    
    
    }
    
    
    
    
    


//最热评论
    if (topic.top_cmt.count)
    {
        self.topcmtView.hidden=NO;
        
        NSDictionary*cmt=topic.top_cmt.lastObject;
        
        NSString*content=cmt[@"content"];
        NSString*username=cmt[@"user"][@"username"];
        
        
        
        self.topcmtlabel.text=[NSString stringWithFormat:@"%@ :%@",username,content];
        
    }
 else
    {
    
        self.topcmtView.hidden=YES;
    
    }
    
    
    
    




}

-(void)setupButton:(UIButton*)buton numuber:(NSInteger)number placher:(NSString*)placeholder
{



    if (number>=10000.0)
    {
        
        [buton setTitle:[NSString stringWithFormat:@"%.1f万",number/10000.0] forState:UIControlStateNormal];
    }else if (number>0)
    {
    
     [buton setTitle:[NSString stringWithFormat:@"%zd",number] forState:UIControlStateNormal];
    
    
    
    
    
    
    
    }else
    {
    
    
        [buton setTitle:placeholder forState:UIControlStateNormal];
    
    
    }


}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.topic.type==keruitypepicture)
    {
        
        self.pitcherciew.frame=self.topic.MiddFrame;
        
    }else if (self.topic.type==keruitypevoice)
        
    {
    
        self.Voicceview.frame=self.topic.MiddFrame;
    
    
    
    }else if (self.topic.type==keruitypevideo)
    {
    
    
        self.videoview.frame=self.topic.MiddFrame;
    
    
    
    
    
    }







}

//设置cell悬空；自己随便写的可以不做；

//-(void)setFrame:(CGRect)frame
//{
//
//    
//    
//    frame.origin.x += 10;
//    
//    frame.size.height -= 10;
//    
//    frame.size.width -= 20;
//    
//    
//    [super setFrame:frame];
//
//
//
//
//
//
//
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
