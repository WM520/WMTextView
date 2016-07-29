//
//  ViewController.m
//  WMTextView
//
//  Created by David on 16/7/29.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "ViewController.h"
#import "WMTextView.h"

@interface ViewController ()<UITextViewDelegate>
@property (strong, nonatomic) WMTextView *customTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.customTextView = [[WMTextView alloc] init];
    _customTextView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
    _customTextView.delegate = self;
    _customTextView.placehoder = @"如果你喜欢这个控件,欢迎来下载 https://github.com/WM520/WMTextView 顺便star我谢谢,O(∩_∩)O~如果你喜欢这个控件,欢迎来下载 https://github.com/WM520/WMTextView 顺便star我谢谢,O(∩_∩)O~如果你喜欢这个控件,欢迎来下载 https://github.com/WM520/WMTextView 顺便star我谢谢,O(∩_∩)O~";
    _customTextView.placehoderColor = [UIColor redColor];
    [self.view addSubview:_customTextView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
