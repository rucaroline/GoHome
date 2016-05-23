//
//  RegisterViewController.m
//  GoHome
//
//  Created by lkjy on 16/5/17.
//  Copyright © 2016年 朱亚如. All rights reserved.
//

#import "RegisterViewController.h"
#import <FMDB.h>
#import "YanZheng.h"
#import "LoginViewController.h"
@interface RegisterViewController ()
{
    NSString* dataBasePath;/**<数据库的路径>*/
}

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //找数据库
    dataBasePath=@"/Users/lkjy/Documents/iosprograms/GoHome/fmdb/MyDataBase.db";
    
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
    
    _agaiMi.textColor=[UIColor blackColor];
    _agaiMi.textAlignment=NSTextAlignmentLeft;
    [_agaiMi setMinimumFontSize:0.5];
    [_agaiMi setAdjustsFontSizeToFitWidth:YES];
    _agaiMi.clearButtonMode=UITextFieldViewModeAlways;
    
    _Email.textColor=[UIColor blackColor];
    _Email.textAlignment=NSTextAlignmentLeft;
    [_Email setMinimumFontSize:0.5];
    [_Email setAdjustsFontSizeToFitWidth:YES];
    _Email.clearButtonMode=UITextFieldViewModeAlways;
    
    _PhoneNumber.delegate=self;
    _MiMa.delegate=_PhoneNumber.delegate;
    _agaiMi.delegate=_MiMa.delegate;
    _Email.delegate=_PhoneNumber.delegate;

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
    else
    if (textField == _agaiMi)
    {
        [_agaiMi becomeFirstResponder];
    }
    else
        if (textField == _Email)
        {
            [_Email becomeFirstResponder];
        }
    return YES;
}

-(void)createDB
{
    NSFileManager* fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:dataBasePath]==NO)
    {
        //这个路径下有数据库就反馈给你，没有找到数据库后创建一个数据库
        FMDatabase* db=[FMDatabase databaseWithPath:dataBasePath];
        
        if ([db open])
        {
            NSString* sql=@"CREATE TABLE 'User' ('id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'name' VARCHAR(30),'password' VARCHAR(30),'email' VARCHAR(30))";
            //执行sql语句
            BOOL res=[db executeUpdate:sql];
            if (!res)
            {
                NSLog(@"表创建失败");
            }
            else
            {
                NSLog(@"表创建成功");
            }
            
            [db close];
        }
        else
        {
            NSLog(@"数据库没有打开");
        }
        
    }

}


- (IBAction)Sure:(UIButton *)sender
{
    if (([YanZheng validateMobile:_PhoneNumber.text])&&([YanZheng validatePassword:_MiMa.text])&&(_MiMa.text!=_agaiMi.text)&&([YanZheng validatePassword:_Email.text]))
    {
        static int count=0;
        FMDatabase* db=[FMDatabase databaseWithPath:dataBasePath];
        if ([db open])
        {
            NSString* sql=@"insert into user(name,password,email) values(?,?,?)";
            NSString* name=[NSString stringWithFormat:_PhoneNumber.text,count++];
            BOOL res=[db executeUpdate:sql,name,_MiMa.text,_Email.text];
            if (res)
            {
                NSLog(@"插入数据成功");
            }
            else
            {
                NSLog(@"插入数据失败");
            }
            [db close];
        }
        else
        {
            NSLog(@"打开数据库失败");
        }

        LoginViewController* login=[[LoginViewController alloc]init];
        [self.navigationController pushViewController:login animated:YES];
    }
    else
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
        else
            if (_MiMa.text!=_agaiMi.text)
            {
                UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"提示" message:@"密码不一致" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction* sure=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction* _Nonnull action){}];
                UIAlertAction* cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction* _Nonnull action){}];
                [alert addAction:sure];
                [alert addAction:cancel];
                [self presentViewController:alert animated:YES completion:nil];
            }
            else
                if (![YanZheng validatePassword:_Email.text])
                {
                    UIAlertController* alert=[UIAlertController alertControllerWithTitle:@"提示" message:@"邮箱输入错误" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction* sure=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction* _Nonnull action){}];
                    UIAlertAction* cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction* _Nonnull action){}];
                    [alert addAction:sure];
                    [alert addAction:cancel];
                    [self presentViewController:alert animated:YES completion:nil];
                }
    
}

- (IBAction)Cancel:(UIButton *)sender
{
    
}
@end
