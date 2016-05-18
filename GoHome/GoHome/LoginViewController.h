//
//  LoginViewController.h
//  GoHome
//
//  Created by lkjy on 16/5/17.
//  Copyright © 2016年 朱亚如. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *PhoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *MiMa;
- (IBAction)Login:(UIButton *)sender;
- (IBAction)Register:(UIButton *)sender;
- (IBAction)QQ:(UIButton *)sender;
- (IBAction)WeChat:(UIButton *)sender;
- (IBAction)Weibo:(UIButton *)sender;

@end
