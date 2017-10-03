//
//  MenuAction.h
//  Imavox
//
//  Created by Andre Kristanto on 1/10/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuAction : NSObject

+ (MenuAction *)shared;
- (void)menuClicked;

@end
