//
//  ResizeManager.m
//  Imavox
//
//  Created by Andre Kristanto on 29/9/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import "ResizeManager.h"

static ResizeManager *singleton = nil;
static double _width = 0;
static double _height = 0;

@implementation ResizeManager

+(ResizeManager *)singleton{
    if(singleton == nil){
        singleton = [[self alloc] init];
    }
    return singleton;
}

-(void)initState:(CGRect)phone{
    _width = phone.size.width;
    _height = phone.size.height;
}

-(double)getWidth{ return _width; }
-(double)getHeight{ return _width; }

-(double)getApproxDistance{ return _height * 0.05; }

-(double)distanceX:(id)x{
    if([x isKindOfClass:[UIView class]]){
        UIView *temp = (UIView *)x;
        return temp.frame.size.width + temp.frame.origin.x;
    }
    if(strcmp([x objCType], @encode(CGRect)) == 0){
        CGRect temp;
        [(NSValue*)x getValue:&temp];
        return temp.size.width + temp.origin.x;
    }
    return 0;
}
-(double)distanceY:(id)y{
    if([y isKindOfClass:[UIView class]]){
        UIView *temp = (UIView *)y;
        return temp.frame.size.height + temp.frame.origin.y;
    }
    if(strcmp([y objCType], @encode(CGRect)) == 0){
        CGRect temp;
        [(NSValue*)y getValue:&temp];
        return temp.size.height + temp.origin.y;
    }
    return 0;
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToFillSize:(CGSize)size
{
    CGFloat scale = MAX(size.width/image.size.width, size.height/image.size.height);
    CGFloat width = image.size.width * scale;
    CGFloat height = image.size.height * scale;
    CGRect imageRect = CGRectMake((size.width - width)/2.0f,
                                  (size.height - height)/2.0f,
                                  width,
                                  height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [image drawInRect:imageRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
