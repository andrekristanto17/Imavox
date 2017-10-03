//
//  Imanov_Network.m
//  Imavox
//
//  Created by Andre Kristanto on 1/10/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import "Imanov_Network.h"
#import "PlaceholderConstant.h"

static Imanov_Network *singleton = nil;

@implementation Imanov_Network

+ (Imanov_Network *)shared{
    if(singleton == nil){
        singleton = [[Imanov_Network alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        singleton.requestSerializer = [AFJSONRequestSerializer serializer];
        singleton.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return singleton;
}

- (void)serviceDoLogin:(NSMutableDictionary *)param :(void (^)(BOOL, id _Nullable))completion{
    NSMutableDictionary *response = [self postENCODING:[USERS stringByAppendingString:AUTH_USER] :param];
    if(response == nil){
        completion(false, NULL);
    } else {
        completion(true, response);
    }
}

- (void)serviceDoLinkedIn:(NSMutableDictionary *)param :(void (^)(BOOL, id _Nullable))completion{
    NSMutableDictionary *response = [self postENCODING:USERS :param];
    if(response == nil){
        completion(false, NULL);
    } else {
        completion(true, response);
    }
}

- (NSMutableDictionary *)postENCODING:(NSString *)url :(NSMutableDictionary *)param{
    NSMutableArray *httpDataComponents = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSString *key in param) {
        [httpDataComponents addObject:[NSString stringWithFormat:@"%@=%@", key, param[key]]];
    }
    NSString *httpDataString = [httpDataComponents componentsJoinedByString:@"&"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[BASE_URL stringByAppendingString:url]]];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[httpDataString dataUsingEncoding:NSUTF8StringEncoding]];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:request
                                          returningResponse:&response
                                                      error:&error];
    
    if (error == nil)
    {
        NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
        dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        return dict;
    } else {
        return nil;
    }
}
@end
