//
//  TNSNewsDetailViewController.m
//  TensNews
//
//  Created by Chen on 16/1/29.
//  Copyright © 2016年 Weit. All rights reserved.
//

#import "TNSNewsDetailViewController.h"

@interface TNSNewsDetailViewController ()
<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation TNSNewsDetailViewController


#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self showLoading];
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIWebViewDelegate

// 将要加载
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    
    return YES;
}

// 开始加载
- (void)webViewDidStartLoad:(UIWebView *)webView {
}

// 加载完成
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self hiddenLoading];
}

// 加载失败
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
}

@end
