//
//  LoginAction.h
//  Imavox
//
//  Created by Andre Kristanto on 30/9/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginAction : NSObject

+ (LoginAction *)shared;

- (void)doLogin:(NSMutableDictionary *)param;
- (void)doRegister;
- (void)doLoginWithLinkedIn;
- (void)doForgot;

- (void)doLogout;

- (void)toLogin;
- (void)toRegister;
- (void)toForgot;
- (void)toMain;
@end
