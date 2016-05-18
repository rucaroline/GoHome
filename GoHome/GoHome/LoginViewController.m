//
//  LoginViewController.m
//  GoHome
//
//  Created by lkjy on 16/5/17.
//  Copyright © 2016年 朱亚如. All rights reserved.
//

#import "LoginViewController.h"
#import "YanZheng.h"
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
- (void)textFieldDidEndEditing:(UITextField *)textField;
{
    [textField resignFirstResponder];
    if (textField==_PhoneNumber)
    {
        [_MiMa resignFirstResponder];
    }
    else
        if (textField==_PhoneNumber)
        {
            [_MiMa resignFirstResponder];
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
    if (![YanZheng validateMobile:_PhoneNumber.text])
    {
        UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"提示" message:@"请输入正确的手机号" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* sure=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction* _Nonnull action){}];
        UIAlertAction* cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction* _Nonnull action){}];
        [alert addAction:sure];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    }
   else
       if (![YanZheng validatePassword:_MiMa.text])
       {
           UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"提示" message:@"密码由字母或数字组成（6-12位）" preferredStyle:UIAlertControllerStyleAlert];
           UIAlertAction* sure=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction* _Nonnull action){}];
           UIAlertAction* cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction* _Nonnull action){}];
           [alert addAction:sure];
           [alert addAction:cancel];
           [self presentViewController:alert animated:YES completion:nil];
       }
    //else
//        if ([YanZheng validateMobile:_PhoneNumber.text]&&[YanZheng validatePassword:_MiMa.text])
//        {
//            <#statements#>
//        }
        
}

- (IBAction)Register:(UIButton *)sender
{
    NSLog(@"进入注册界面");
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
