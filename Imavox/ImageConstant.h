//
//  ImageConstant.h
//  Imavox
//
//  Created by Andre Kristanto on 1/10/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RGB(r,g,b) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1.0]
#define LOGIN_COLOR RGB(121,187,226)
#define LINKED_IN_COLOR RGB(113,93,163)
#define LIGHT_BLUE RGB(118,188,228)
#define DARK_LIGHT_BLUE RGB(128, 199, 233)

#define LINKED_IN_LOGO [UIImage imageNamed:@"linked_in_logo"]

#define BG_BTN [UIImage imageNamed:@"bg_btn"]
#define AGENDA_IMG [UIImage imageNamed:@"agenda"];
#define ACCESS_IMG [UIImage imageNamed:@"access"];
#define EVENT_IMG [UIImage imageNamed:@"event_floorplan"];
#define DELEGATES_IMG [UIImage imageNamed:@"users"];
#define SPEAKER_IMG [UIImage imageNamed:@"speakers"];
#define PARTNER_IMG [UIImage imageNamed:@"partners"];
#define INFO_IMG [UIImage imageNamed:@"infos"];
#define ALERT_IMG [UIImage imageNamed:@"alerts"];
#define CHAT_IMG [UIImage imageNamed:@"chat"];

#define BG_IMG [UIImage imageNamed:@"login_bg"]
#define LOGO_IMG [UIImage imageNamed:@"logo"]
#define CHECKBOX_IMG [UIImage imageNamed:@"checkbox_white"]
#define MENU_IMG [UIImage imageNamed:@"side_menu"]
#define TOP_MENU_BG [UIImage imageNamed:@"top_bar_bg"]

#define email_bg_img [UIImage imageNamed:@"email_bg"]
#define password_bg_img [UIImage imageNamed:@"password_bg"]

#define EVENT_HEADER [UIImage imageNamed:@"Event_header"]
#define LOGO_IMG_FOOTER [UIImage imageNamed:@"logo_small"]


@interface ImageConstant : NSObject

@end
