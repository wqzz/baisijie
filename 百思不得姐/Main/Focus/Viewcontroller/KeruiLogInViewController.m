//
//  KeruiLogInViewController.m
//  百思不得姐
//
//  Created by 钟文秋 on 16/12/1.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "KeruiLogInViewController.h"
#import "KeruiResgLoginViewController.h"
#import "KeruiBottonView.h"

@interface KeruiLogInViewController ()
@property (weak, nonatomic) IBOutlet UIView *MidView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *LeadCons;
@property (weak, nonatomic) IBOutlet UIView *BottomView;

@end

@implementation KeruiLogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KeruiResgLoginViewController*log=[KeruiResgLoginViewController loginView];
    
   // log.frame=CGRectMake(0, 0, self.MidView.Kerui_Width*0.5, self.MidView.Kerui_height);
    [self.MidView addSubview:log];
    
    KeruiResgLoginViewController*reg=[KeruiResgLoginViewController regVlogView];
    
    reg.Kerui_x=self.MidView.Kerui_Width*0.5;
    
   // reg.frame=CGRectMake(self.MidView.Kerui_Width*0.5, 0, self.MidView.Kerui_Width*0.5, self.MidView.Kerui_height);
    
    [self.MidView addSubview:reg];
    
    KeruiBottonView*bottom=[KeruiBottonView BottomView];
    
    [self.BottomView addSubview:bottom];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)resgLogin:(UIButton*)sender
{
    
    sender.selected=!sender.selected;
    
    self.LeadCons.constant= self.LeadCons.constant==0?-self.MidView.Kerui_Width*0.5:0;
    
    [UIView animateWithDuration:1.0 animations:^{
        
        
        [self.view layoutIfNeeded];
    }];
    
    
    
}

-(void)viewDidLayoutSubviews
{


    [super viewDidLayoutSubviews];


    KeruiResgLoginViewController*log=self.MidView.subviews[0];

    log.frame=CGRectMake(0, 0, self.MidView.Kerui_Width*0.5, self.MidView.Kerui_height);
   // [self.MidView addSubview:log];


    KeruiResgLoginViewController*reg=self.MidView.subviews[1];
    reg.frame=CGRectMake(self.MidView.Kerui_Width*0.5, 0, self.MidView.Kerui_Width*0.5, self.MidView.Kerui_height);
    


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
