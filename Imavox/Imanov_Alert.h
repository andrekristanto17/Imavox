//
//  Imanov_Alert.h
//  Imavox
//
//  Created by Andre Kristanto on 1/10/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum error_type{
    kEmail,
    kPassword,
    kConfirmPassword,
    kFailed,
}error_type;

@interface Imanov_Alert : UIAlertController

+ (void)showAlert:(error_type)error;

@end
