//
//  User.h
//  Imavox
//
//  Created by Andre Kristanto on 1/10/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum login_type{
    kManual,
    kLinkedIn
}login_type;

@interface User : NSObject

+ (User *)shared;

- (void)getInitialState;

- (void)processUser:(id)param :(login_type)type;
- (void)logOut;

// -----------------------------------------------------
// GETTER
// -----------------------------------------------------
- (BOOL)onLogin;
- (BOOL)onManualEmail;
- (BOOL)onLinkedIn;

- (NSString *)fullName;
- (NSString *)firstName;
- (NSString *)lastName;

- (NSString *)r_email;
- (NSString *)r_password;
- (NSString *)user_id;

@end
