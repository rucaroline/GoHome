//
//  YanZheng.h
//  GoHome
//
//  Created by lkjy on 16/5/18.
//  Copyright © 2016年 朱亚如. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YanZheng : NSObject

+(BOOL)validateMobile:(NSString *)mobileNum;

+(BOOL)validateEmail:(NSString *)email;

+(BOOL)validatePassword:(NSString *)password;

@end
