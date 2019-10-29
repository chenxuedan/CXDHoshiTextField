//
//  ViewController.m
//  CXDHoshiTextField
//
//  Created by xiao zude on 2019/10/29.
//  Copyright © 2019 cxd. All rights reserved.
//

#import "ViewController.h"
#import "CXDHoshiTextField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buildUI];
}


- (void)buildUI {
    [self.view addSubview:({
        CXDHoshiTextField *accountTextField = [[CXDHoshiTextField alloc] initWithFrame:CGRectMake(20, 80, kScreenWidth - 40, 50)];
        accountTextField.placeholderLabel.text = @"请输入账号信息";
        accountTextField;
    })];
    [self.view addSubview:({
        CXDHoshiTextField *passwordTextField = [[CXDHoshiTextField alloc] initWithFrame:CGRectMake(20, 160, kScreenWidth - 40, 50)];
        passwordTextField.placeholderLabel.text = @"请输入密码";
        passwordTextField;
    })];
}

@end
