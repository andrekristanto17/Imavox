//
//  Imanov_Nav.m
//  Imavox
//
//  Created by Andre Kristanto on 30/9/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import "Imanov_Nav.h"

// UIViewController List
#import "LoginVC.h"
#import "RegisterVC.h"
#import "ForgotVC.h"

#import "MainVC.h"

// Actions
#import "MenuAction.h"

//Font
#import <UIFont+OpenSans.h>

@interface Imanov_Nav ()

@property (retain, nonatomic) UINavigationController *nav;

@end

static Imanov_Nav *singleton = nil;
static MenuAction *menu_action = nil;

@implementation Imanov_Nav

+(Imanov_Nav *)shared{
    if(singleton == nil){
        singleton = [[Imanov_Nav alloc] init];
        menu_action = [MenuAction shared];
    }
    return singleton;
}

- (void)initWithCurrentNav:(UINavigationController *)nav{
    self.nav = nav;
}

- (void)nav_to_login{
    LoginVC *vc = [[LoginVC alloc] init];
    [self.nav pushViewController:vc animated:YES];
}
- (void)nav_to_register{
    RegisterVC *vc = [[RegisterVC alloc] init];
    [self.nav pushViewController:vc animated:YES];
}
- (void)nav_to_forgot{
    ForgotVC *vc = [[ForgotVC alloc] init];
    [self.nav pushViewController:vc animated:YES];
}

- (void)nav_to_main{
    MainVC *vc = [[MainVC alloc] init];
    [self.nav pushViewController:vc animated:YES];
}

- (UIView *)titleView{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 35)];
    UILabel *event_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 15)];
    [event_label setTextColor:[UIColor whiteColor]];
    [event_label setText:@"Event Start"];
    [event_label setFont:[UIFont openSansLightFontOfSize:10]];
    [event_label setTextAlignment:NSTextAlignmentCenter];
    [titleView addSubview:event_label];
    
    UILabel *event_detail_label = [[UILabel alloc] initWithFrame:CGRectMake(8, 20, 100, 15)];
    [event_detail_label setTextColor:[UIColor whiteColor]];
    [event_detail_label setText:@"DD:HH:MM:SS"];
    [event_detail_label setFont:[UIFont openSansLightFontOfSize:10]];
    [event_detail_label setTextAlignment:NSTextAlignmentCenter];
    [titleView addSubview:event_detail_label];
    
    return titleView;
}

- (UIView *)leftMenuViews{
    
    UIButton *menu_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [menu_btn setImage:MENU_IMG forState:UIControlStateNormal];
    [menu_btn addTarget:menu_action action:@selector(menuClicked) forControlEvents:UIControlEventTouchUpInside];
    [menu_btn setFrame:CGRectMake(0, 0, 30, 20)];
    
    return menu_btn;
}


- (void)addTransition{
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    
    [self.nav.view.layer addAnimation:transition forKey:kCATransition];
}

@end
