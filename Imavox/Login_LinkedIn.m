//
//  Login_LinkedIn.m
//  Imavox
//
//  Created by Andre Kristanto on 1/10/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import "Login_LinkedIn.h"

#import "PlaceholderConstant.h"

#import <linkedin-sdk/LISDK.h>

@implementation Login_LinkedIn

+ (void)doLinkedIn:(void(^ _Nullable)(BOOL success, id _Nullable response))completion{
    [LISDKSessionManager
     createSessionWithAuth:[NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION, LISDK_EMAILADDRESS_PERMISSION, nil]
     state:nil
     showGoToAppStoreDialog:YES
     successBlock:^(NSString *returnState) {
         NSLog(@"%s","success called!");
         LISDKSession *session = [[LISDKSessionManager sharedInstance] session];
         if(session.isValid){
             NSString *url = @"https://api.linkedin.com/v1/people/~:(id,first-name,last-name,maiden-name,email-address)";
             [[LISDKAPIHelper sharedInstance] getRequest:url success:^(LISDKAPIResponse * success) {
                 NSError *jsonError;
                 NSData *objectData = [success.data dataUsingEncoding:NSUTF8StringEncoding];
                 NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                                      options:NSJSONReadingMutableContainers
                                                                        error:&jsonError];
                 NSMutableDictionary *param = [NSMutableDictionary new];
                 [param setObject:[json valueForKey:@"emailAddress"] forKey:USER_EMAIL_PARAM];
                 [param setObject:[json valueForKey:@"id"] forKey:USER_LINKEDIN_PARAM];
                 [param setValue:@"1234567890" forKey:USER_PASS_PARAM];
                 [param setObject:[json valueForKey:@"firstName"] forKey:USER_F_NAME_PARAM];
                 [param setObject:[json valueForKey:@"lastName"] forKey:USER_L_NAME_PARAM];
                 NSLog(@"success linked in get profile: %@", json);
                 completion(true, param);
             } error:^(LISDKAPIError * error) {
                 completion(false, NULL);
                 NSLog(@"error linked in get profile: %@", error);
             }];
         }
     }
     errorBlock:^(NSError *error) {
         NSLog(@"%s","error called!");
     }];
    
}

@end
