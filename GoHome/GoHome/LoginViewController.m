//
//  LoginViewController.m
//  GoHome
//
//  Created by lkjy on 16/5/17.
//  Copyright © 2016年 朱亚如. All rights reserved.
//

#import "LoginViewController.h"
#import "YanZheng.h"
#import "RegisterViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _PhoneNumber.textColor=[UIColor blackColor];
    _PhoneNumber.textAlignment=NSTextAlignmentLeft;
    [_PhoneNumber setMinimumFontSize:0.5];
    [_PhoneNumber setAdjustsFontSizeToFitWidth:YES];
    _PhoneNumber.clearButtonMode=UITextFieldViewModeAlways;
    
    _MiMa.textColor=[UIColor blackColor];
    _MiMa.textAlignment=NSTextAlignmentLeft;
    [_MiMa setMinimumFontSize:0.5];
    [_MiMa setAdjustsFontSizeToFitWidth:YES];
    _MiMa.clearButtonMode=UITextFieldViewModeAlways;
    
    _PhoneNumber.delegate=self;
    _MiMa.delegate=self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_PhoneNumber becomeFirstResponder];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
{
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField;
{
    [textField becomeFirstResponder];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;
{
    if (1)
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField;
{
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == _PhoneNumber)
    {
        [_PhoneNumber becomeFirstResponder];
    }
    else
    if (textField == _MiMa)
    {
        [_MiMa becomeFirstResponder];
    }
    return YES;
}
- (IBAction)Login:(UIButton *)sender
{
       
        
}

- (IBAction)Register:(UIButton *)sender
{
    RegisterViewController* registe=[[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registe animated:YES];
}

- (IBAction)QQ:(UIButton *)sender
{
    
}

- (IBAction)WeChat:(UIButton *)sender
{
    
}

- (IBAction)Weibo:(UIButton *)sender
{
    
}
@end
