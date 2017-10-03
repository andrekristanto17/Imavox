//
//  User.m
//  Imavox
//
//  Created by Andre Kristanto on 1/10/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import "User.h"

#import "PlaceholderConstant.h"

static User *singleton = nil;

@implementation User{
    BOOL onLogin;
    BOOL onManualEmail;
    BOOL onLinkedIn;
    
    NSString *fullName;
    NSString *firstName;
    NSString *lastName;
    
    NSString *r_email;
    NSString *r_password;
    
    NSString *user_id;
}

+(User *)shared{
    if(singleton == nil){
        singleton = [[User alloc] init];
    }
    return singleton;
}

- (void)processUser:(id)param :(login_type)type{
    [self setOnLogin:true];
    switch (type) {
        case kManual: [self setOnManualEmail:YES]; break;
        case kLinkedIn: [self setOnLinkedIn:YES] ;break;
        default: break;
    }
    [self setFirstName:[param valueForKey:FIRST_NAME]];
    [self setLastName:[param valueForKey:LAST_NAME]];
    [self set_user_id:[param valueForKey:USER_ID]];
}

- (void)getInitialState{
    BOOL hasLogin = [[NSUserDefaults standardUserDefaults] boolForKey:ON_LOGIN];
    if(hasLogin){
        BOOL linked = [[NSUserDefaults standardUserDefaults] boolForKey:ON_LINKED_IN];
        BOOL manual = [[NSUserDefaults standardUserDefaults] boolForKey:ON_MANUAL_EMAIL];
        NSString *fname = [[NSUserDefaults standardUserDefaults] valueForKey:FIRST_NAME];
        NSString *lname = [[NSUserDefaults standardUserDefaults] valueForKey:LAST_NAME];
        NSString *u_id = [[NSUserDefaults standardUserDefaults] valueForKey:USER_ID];
        [self setOnLinkedIn:linked];
        [self setOnManualEmail:manual];
        [self setFirstName:fname];
        [self setLastName:lname];
        [self set_user_id:u_id];
    }
    [self setOnLogin:hasLogin];
}

- (void)logOut{
    [self setOnLogin:false];
    [self setOnLinkedIn:false];
    [self setOnManualEmail:false];
    [self setFirstName:@""];
    [self setLastName:@""];
    [self set_user_id:@""];
}
// -----------------------------------------------------
// GETTER
// -----------------------------------------------------
- (BOOL)onLogin{ return onLogin; }
- (BOOL)onManualEmail{ return onManualEmail; }
- (BOOL)onLinkedIn{ return onLinkedIn; }

- (NSString *)fullName{ return fullName; }
- (NSString *)firstName{ return firstName; }
- (NSString *)lastName{ return lastName; }

- (NSString *)r_email{ return r_email; }
- (NSString *)r_password{ return r_password; }
- (NSString *)user_id{ return user_id; }

// -----------------------------------------------------
// SETTER
// -----------------------------------------------------
- (void)setOnLogin:(BOOL)data{
    onLogin = data;
    [[NSUserDefaults standardUserDefaults] setBool:onLogin forKey:ON_LOGIN];
}
- (void)setOnManualEmail:(BOOL)data{
    onManualEmail = data;
    [[NSUserDefaults standardUserDefaults] setBool:onManualEmail forKey:ON_MANUAL_EMAIL];
}
- (void)setOnLinkedIn:(BOOL)data{
    onLinkedIn = data;
    [[NSUserDefaults standardUserDefaults] setBool:onLinkedIn forKey:ON_LINKED_IN];
}

- (void)setFullName:(NSString *)data{
    fullName = data;
    [[NSUserDefaults standardUserDefaults] setValue:fullName forKeyPath:FULL_NAME];
}
- (void)setFirstName:(NSString *)data{
    firstName = data;
    [[NSUserDefaults standardUserDefaults] setValue:firstName forKeyPath:FIRST_NAME];
}
- (void)setLastName:(NSString *)data{
    lastName = data;
    [[NSUserDefaults standardUserDefaults] setValue:lastName forKeyPath:LAST_NAME];
}

- (void)set_r_email:(NSString *)data{
    r_email = data;
    [[NSUserDefaults standardUserDefaults] setValue:r_email forKeyPath:R_EMAIL];
}
- (void)set_r_password:(NSString *)data{
    r_password = data;
    [[NSUserDefaults standardUserDefaults] setValue:r_password forKeyPath:R_PASSWORD];
}

- (void)set_user_id:(NSString *)data{
    user_id = data;
    [[NSUserDefaults standardUserDefaults] setValue:user_id forKeyPath:USER_ID];
}

@end
