//
//  LoginAction.m
//  Imavox
//
//  Created by Andre Kristanto on 30/9/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import "LoginAction.h"

#import "Imanov_Nav.h"
#import "Imanov_Network.h"

#import "User.h"
#import "Login_LinkedIn.h"
#import "Imanov_Alert.h"

#import <SVProgressHUD.h>

static LoginAction *singleton = nil;

@implementation LoginAction

+ (LoginAction *)shared{
    if(singleton == nil){
        singleton = [[LoginAction alloc] init];
    }
    return singleton;
}

- (void)doLogin:(NSMutableDictionary *)param{
    [SVProgressHUD showWithStatus:LOADING_SIGNING_IN];
    [[ Imanov_Network shared] serviceDoLogin:param :^(BOOL success, id  _Nullable response) {
        if(success){
            NSLog(@"Response %@", response);
            [SVProgressHUD dismiss];
            [self toMain];
            [[User shared] processUser:response :kManual];
        } else {
            NSLog(@"Error %@", response);
            [SVProgressHUD dismiss];
            [Imanov_Alert showAlert:kFailed];
        }
    }];
}
- (void)doRegister{
    
}

- (void)doLoginWithLinkedIn{
    [SVProgressHUD showWithStatus:LOADING_SIGNING_IN];
    [Login_LinkedIn doLinkedIn:^(BOOL success, id response) {
        if(!success) return ;
        NSMutableDictionary *param = [response mutableCopy];
        [[Imanov_Network shared] serviceDoLinkedIn:param :^(BOOL success, id  _Nullable response) {
            if(success){
                NSLog(@"Success Login LinkedIn : %@", response);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [SVProgressHUD dismiss];
                    [self toMain];
                    [[User shared] processUser:response :kLinkedIn];
                });
            } else {
                NSLog(@"Error Login LinkedIn : %@", response);
                [SVProgressHUD dismiss];
                [Imanov_Alert showAlert:kFailed];
            }
        }];
    }];
}

- (void)doForgot{
    
}

- (void)doLogout{
    [[User shared] logOut];
    [self toLogin];
}

- (void)toLogin{
    [[Imanov_Nav shared] nav_to_login];
}

- (void)toRegister{
//    [[Imanov_Nav shared] nav_to_register];
}

- (void)toForgot{
//    [[Imanov_Nav shared] nav_to_forgot];
}

- (void)toMain{
    [[Imanov_Nav shared] nav_to_main];
}

@end
