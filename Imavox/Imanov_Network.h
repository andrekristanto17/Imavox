//
//  Imanov_Network.h
//  Imavox
//
//  Created by Andre Kristanto on 1/10/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface Imanov_Network : AFHTTPSessionManager

+(Imanov_Network *_Nonnull)shared;

- (void)serviceDoLogin:(NSMutableDictionary *_Nonnull)param :(void(^_Nullable)(BOOL success, id _Nullable response))completion;
- (void)serviceDoLinkedIn:(NSMutableDictionary *_Nonnull)param :(void(^_Nullable)(BOOL success, id _Nullable response))completion;

@end
