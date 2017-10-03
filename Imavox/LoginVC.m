//
//  LoginVC.m
//  Imavox
//
//  Created by Andre Kristanto on 29/9/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import "LoginVC.h"
#import "RegisterVC.h"
#import "ForgotVC.h"
#import "MainVC.h"

#import "LoginAction.h"
#import "ResizeManager.h"

#import "Imanov_TextField.h"
#import "Imanov_Button.h"
#import "Imanov_Nav.h"
#import "Imanov_Alert.h"
#import <UIFont+OpenSans.h>

#import "User.h"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

@interface LoginVC ()

@end

@implementation LoginVC{
    Imanov_TextField *loginTF;
    Imanov_TextField *passwordTF;
    
    Imanov_Button *login_btn;
    Imanov_Button *linked_in_btn;
    
    Imanov_Button *not_registered_yet_btn;
    Imanov_Button *forgot_password_btn;
    
    ResizeManager *resizing;
    LoginAction *action;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initVariable];
    [self createSubViews];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)initVariable{
    [[Imanov_Nav shared] initWithCurrentNav:self.navigationController];
    
    resizing = [ResizeManager singleton];
    [resizing initState:self.view.frame];
    
    action = [LoginAction shared];
    
    [[User shared] getInitialState];
}
- (void)createSubViews{
    if([[User shared] onLogin])
        [action toMain];
    
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [bgView setImage:BG_IMG];
    [self.view addSubview:bgView];
    
    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH/2 - 150, 50, 300, 100)];
    [logoView setImage:LOGO_IMG];
    [logoView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:logoView];
    
    loginTF = [Imanov_TextField typed:t_login];
    [loginTF setFrame:CGRectMake( WIDTH*0.1, [resizing distanceY:logoView] + [resizing getApproxDistance], WIDTH*0.8, 40)];
    [loginTF setTag:0];
    [self.view addSubview:loginTF];
    
    passwordTF = [Imanov_TextField typed:t_password];
    [passwordTF setFrame:CGRectMake( WIDTH*0.1, [resizing distanceY:loginTF] + [resizing getApproxDistance], WIDTH*0.8, 40)];
    [passwordTF setTag:1];
    [self.view addSubview:passwordTF];
    
    login_btn = [Imanov_Button login];
    [login_btn setFrame:CGRectMake( WIDTH*0.1, [resizing distanceY:passwordTF] + [resizing getApproxDistance], WIDTH*0.8, 40)];
    [login_btn addTarget:self action:@selector(prepForLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:login_btn];
    
    linked_in_btn = [Imanov_Button linked_in];
    [linked_in_btn setFrame:CGRectMake( WIDTH*0.1, [resizing distanceY:login_btn] + [resizing getApproxDistance]/2, WIDTH*0.8, 40)];
    [linked_in_btn addTarget:action action:@selector(doLoginWithLinkedIn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:linked_in_btn];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(85, 0, 70, 30)];
    [imgView setImage:LINKED_IN_LOGO];
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    
    UILabel *label = [[UILabel alloc] init];
    [label setText:LINKED_IN];
    [label setFont:[UIFont openSansSemiBoldFontOfSize:15]];
    [label setTextColor:[UIColor whiteColor]];
    [label setNumberOfLines:2];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    [label setFrame:CGRectMake(0, 0, 80, 30)];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 145, 30)];
    view.center = CGPointMake(linked_in_btn.frame.size.width/2, linked_in_btn.frame.size.height/2);
    [view addSubview:label];
    [view addSubview:imgView];
    [view setUserInteractionEnabled:NO];
    [linked_in_btn addSubview:view];
    
    not_registered_yet_btn = [Imanov_Button not_registered];
    [not_registered_yet_btn setFrame:CGRectMake( WIDTH*0.1, [resizing distanceY:linked_in_btn] + [resizing getApproxDistance], WIDTH*0.8, 30)];
    [not_registered_yet_btn addTarget:action action:@selector(toRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:not_registered_yet_btn];
    
    forgot_password_btn = [Imanov_Button forgot_password];
    [forgot_password_btn setFrame:CGRectMake( WIDTH*0.1, [resizing distanceY:not_registered_yet_btn] + [resizing getApproxDistance]/2, WIDTH*0.8, 30)];
    [forgot_password_btn addTarget:action action:@selector(toForgot) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgot_password_btn];
}

- (void)prepForLogin{
    if([loginTF.text isEqualToString:@""]){
        [Imanov_Alert showAlert:kEmail];
    } else if([passwordTF.text isEqualToString:@""]){
        [Imanov_Alert showAlert:kPassword];
    } else {
        NSMutableDictionary *param = [NSMutableDictionary new];
        [param setValue:loginTF.text forKey:EMAIL_STR];
        [param setValue:passwordTF.text forKey:PASS_STR];
        [action doLogin:param];
    }
}
@end
