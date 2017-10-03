//
//  Imanov_Alert.m
//  Imavox
//
//  Created by Andre Kristanto on 1/10/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import "Imanov_Alert.h"

#import "PlaceholderConstant.h"
#import "ImageConstant.h"

@implementation Imanov_Alert

+ (void)showAlert:(error_type)error{
    NSString *msg;
    switch (error) {
        case kEmail: msg = ERROR_EMAIL; break;
        case kPassword: msg = ERROR_PASSWORD; break;
        case kConfirmPassword: msg = ERROR_CONF_PASSWORD; break;
        case kFailed: msg = ERROR_LOGIN_FAILED; break;
        default: msg = ERROR_STR; break;
    }
    Imanov_Alert *alert = [Imanov_Alert alertControllerWithTitle:IMANOV_STR message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:OK style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [alert present];
}

- (void)present{
    UIWindow *alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    alertWindow.rootViewController = [[UIViewController alloc] init];
    
    id<UIApplicationDelegate> delegate = [UIApplication sharedApplication].delegate;
    // Applications that does not load with UIMainStoryboardFile might not have a window property:
    if ([delegate respondsToSelector:@selector(window)]) {
        alertWindow.tintColor = delegate.window.tintColor;
    }
    
    // window level is above the top window (this makes the alert, if it's a sheet, show over the keyboard)
    UIWindow *topWindow = [UIApplication sharedApplication].windows.lastObject;
    alertWindow.windowLevel = topWindow.windowLevel + 1;
    
    [alertWindow makeKeyAndVisible];
    [alertWindow.rootViewController presentViewController:self animated:YES completion:nil];

}

@end
