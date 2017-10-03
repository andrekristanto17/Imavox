//
//  Imanov_Nav.h
//  Imavox
//
//  Created by Andre Kristanto on 30/9/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceholderConstant.h"
#import "ImageConstant.h"

@interface Imanov_Nav : NSObject

+(Imanov_Nav *)shared;

- (void)initWithCurrentNav:(UINavigationController *)nav;

- (void)nav_to_login;
- (void)nav_to_register;
- (void)nav_to_forgot;

- (void)nav_to_main;

@end
