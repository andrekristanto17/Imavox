//
//  Imanov_View.m
//  Imavox
//
//  Created by Andre Kristanto on 1/10/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import "Imanov_View.h"
#import "MenuAction.h"
#import "PlaceholderConstant.h"
#import "ImageConstant.h"

#import <UIFont+OpenSans.h>

@implementation Imanov_View

+ (Imanov_View *)topMenu:(CGRect)frame{
    Imanov_View *view = [[Imanov_View alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 65)];
    MenuAction *menu_action = [MenuAction shared];
    
    UIButton *menu_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [menu_btn setImage:MENU_IMG forState:UIControlStateNormal];
    [menu_btn addTarget:menu_action action:@selector(menuClicked) forControlEvents:UIControlEventTouchUpInside];
    [menu_btn setFrame:CGRectMake(10, 30, 30, 20)];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width/2 - 50, 22.5, 100, 35)];
    UILabel *event_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 15)];
    [event_label setTextColor:[UIColor whiteColor]];
    [event_label setText:@"Event Start"];
    [event_label setFont:[UIFont openSansLightFontOfSize:10]];
    [event_label setTextAlignment:NSTextAlignmentCenter];
    [titleView addSubview:event_label];
    
    UILabel *event_detail_label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 100, 15)];
    [event_detail_label setTextColor:[UIColor whiteColor]];
    [event_detail_label setText:@"DD:HH:MM:SS"];
    [event_detail_label setFont:[UIFont openSansLightFontOfSize:10]];
    [event_detail_label setTextAlignment:NSTextAlignmentCenter];
    [titleView addSubview:event_detail_label];
    
    [view setBackgroundColor:[UIColor colorWithPatternImage:TOP_MENU_BG]];
    [view addSubview:menu_btn];
    [view addSubview:titleView];
    
    return view;
}

@end
