//
//  FMKWebvieviewcontroller.m
//  头条
//
//  Created by 钟文秋 on 16/8/28.
//  Copyright © 2016年 洛杉矶. All rights reserved.
//

#import "FMKWebvieviewcontroller.h"
#import <WebKit/WebKit.h>

@interface FMKWebvieviewcontroller ()
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwarditem;

@property(nonatomic,weak)WKWebView*webview;

@end

@implementation FMKWebvieviewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setwebview];
    
}


-(void)setwebview
{


    WKWebView*webview=[[WKWebView alloc]initWithFrame:self.view.bounds];
    


    NSURLRequest*request=[NSURLRequest requestWithURL:[NSURL URLWithString:_url]];
    
    //kvo
    
    [webview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
      [webview addObserver:self forKeyPath:@"goback" options:NSKeyValueObservingOptionNew context:nil];
    
      [webview addObserver:self forKeyPath:@"cangoForward" options:NSKeyValueObservingOptionNew context:nil];

    [webview loadRequest:request ];
    
    [self.view addSubview:webview];
    [self.view bringSubviewToFront:self.progress];
    
    self.webview=webview;







}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{


    self.progress.progress=self.webview.estimatedProgress;
    
    self.backItem.enabled=self.webview.goBack;
    self.forwarditem.enabled=self.webview.canGoForward;
    if (self.webview.estimatedProgress>=1.0)
    {
        
        self.progress.hidden=YES;
    }
    






}

-(void)dealloc{



    [self.webview removeObserver:self forKeyPath:@"estimatedProgress"];

       [self.webview removeObserver:self forKeyPath:@"goback"];
       [self.webview removeObserver:self forKeyPath:@"cangoForward"];



}

/*
 WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
 NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_url]];
 [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
 [webView loadRequest:request];
 [self.view addSubview:webView];
 [self.view bringSubviewToFront:self.progressView];
 self.webView = webView;
 }
 
 
 - (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
 {
 self.progressView.progress = self.webView.estimatedProgress;
 if (self.webView.estimatedProgress>=1.0) {
 self.progressView.hidden = YES;
 }
 }
 - (void)dealloc
 {
 [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
 }

 
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
