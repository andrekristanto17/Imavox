//
//  MenuAction.m
//  Imavox
//
//  Created by Andre Kristanto on 1/10/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import "MenuAction.h"

#import "LoginAction.h"
#import "Imanov_Nav.h"

static MenuAction *singleton = nil;
static LoginAction *login = nil;

static BOOL isOpening = false;

@implementation MenuAction

+(MenuAction *)shared{
    if (singleton == nil) {
        singleton = [[MenuAction alloc] init];
        login = [LoginAction shared];
    }
    return singleton;
}

- (void)menuClicked{
    [self logOutPressed];
    isOpening = !isOpening;
    if(isOpening){
        
    } else {
        
    }
}

- (void)showMenuView{
    
}

- (void)hideMenuView{
    
}

- (void)logOutPressed{
    [login doLogout];
}

@end
