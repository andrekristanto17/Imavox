//
//  Imanov_TextField.h
//  Imavox
//
//  Created by Andre Kristanto on 29/9/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceholderConstant.h"
#import "ImageConstant.h"

typedef enum tf_type{
    t_login,
    t_password,
}tf_type;

@interface Imanov_TextField : UITextField <UITextFieldDelegate>

+(Imanov_TextField *)typed:(tf_type)type;

@end
