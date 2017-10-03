//
//  Imanov_Button.h
//  Imavox
//
//  Created by Andre Kristanto on 30/9/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceholderConstant.h"
#import "ImageConstant.h"

typedef enum cell_btn_type{
    agenda = 1, access_loc, event,
    delegates, speaker, partner,
    info, alert, chat
}cell_btn_type;
@interface Imanov_Button : UIButton

// -----------------------------------------------------
// LOGIN + REGISTRATION
// -----------------------------------------------------

+ (Imanov_Button *)login;
+ (Imanov_Button *)linked_in;

+ (Imanov_Button *)not_registered;
+ (Imanov_Button *)forgot_password;

// -----------------------------------------------------
// MAIN APP
// -----------------------------------------------------

+ (Imanov_Button *)cell_button:(cell_btn_type)type;
- (void)cell_btnRecenter;

// -----------------------------------------------------
// SIDE BAR
// -----------------------------------------------------


@end
