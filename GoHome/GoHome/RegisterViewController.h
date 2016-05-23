//
//  RegisterViewController.h
//  GoHome
//
//  Created by lkjy on 16/5/17.
//  Copyright © 2016年 朱亚如. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *PhoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *MiMa;
@property (strong, nonatomic) IBOutlet UITextField *agaiMi;
@property (strong, nonatomic) IBOutlet UITextField *Email;
- (IBAction)Sure:(UIButton *)sender;
- (IBAction)Cancel:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *Insert;
-(void)createDB;
@end
