//
//  ResizeManager.h
//  Imavox
//
//  Created by Andre Kristanto on 29/9/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ResizeManager : NSObject

+(ResizeManager *)singleton;

-(void)initState:(CGRect)phone;

// -----------------------------------------------------
//ScreenSize
// -----------------------------------------------------
-(double)getWidth;
-(double)getHeight;

-(double)getApproxDistance;

// -----------------------------------------------------
//View's distance
// -----------------------------------------------------
-(double)distanceX:(id)x;
-(double)distanceY:(id)y;

- (UIImage *)imageWithImage:(UIImage *)image scaledToFillSize:(CGSize)size;
@end
