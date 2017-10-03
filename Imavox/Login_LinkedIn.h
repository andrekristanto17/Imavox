//
//  Login_LinkedIn.h
//  Imavox
//
//  Created by Andre Kristanto on 1/10/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Login_LinkedIn : NSObject

+ (void)doLinkedIn:(void(^ _Nullable)(BOOL success, id _Nullable response))completion;

@end
