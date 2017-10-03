//
//  Imanov_Button.m
//  Imavox
//
//  Created by Andre Kristanto on 30/9/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import "Imanov_Button.h"
#import "ResizeManager.h"

#import <UIFont+OpenSans.h>



static ResizeManager *size = nil;

@interface Imanov_Button ()

@property (nonatomic) cell_btn_type type;
@property (strong, nonatomic) UIColor *normalColor;

@end

@implementation Imanov_Button{
    
}

-(instancetype)init{
    self = [super init];
    if(self){
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            size = [ResizeManager singleton];
        });
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted{
    if(highlighted){
        [self setBackgroundColor:[UIColor grayColor]];
    } else {
        [self setBackgroundColor:self.normalColor];
    }
    [super setHighlighted:highlighted];
}
#pragma mark LOGIN + REGISTRATION
+ (Imanov_Button *)login{
    Imanov_Button *login = [[Imanov_Button alloc] init];
    
    [login setNormalColor:LOGIN_COLOR];
    [login setBackgroundColor:LOGIN_COLOR];
    [login setTitle:LOGIN_TEXT forState:UIControlStateNormal];
    [login.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [login.titleLabel setFont:[UIFont openSansSemiBoldFontOfSize:15]];
    [login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [login setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    
    return login;
}
+ (Imanov_Button *)linked_in{
    Imanov_Button *linked_in = [[Imanov_Button alloc] init];
    
    [linked_in setNormalColor:LINKED_IN_COLOR];
    [linked_in setBackgroundColor:LINKED_IN_COLOR];
    [linked_in setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    
    return linked_in;
}

+ (Imanov_Button *)not_registered{
    Imanov_Button *not_registered = [[Imanov_Button alloc] init];
    
    [not_registered setNormalColor:[UIColor clearColor]];
    [not_registered setBackgroundColor:[UIColor clearColor]];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:NOT_REGISTERED_YET];
    [string addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [string length])];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, [string length])];
    [string addAttribute:NSFontAttributeName value:[UIFont openSansLightFontOfSize:13] range:NSMakeRange(0, [string length])];
    [not_registered setAttributedTitle:string forState:UIControlStateNormal];
    
    return not_registered;
}
+ (Imanov_Button *)forgot_password{
    Imanov_Button *forgot_password = [[Imanov_Button alloc] init];
    
    [forgot_password setNormalColor:[UIColor clearColor]];
    [forgot_password setBackgroundColor:[UIColor clearColor]];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:FORGOT_PASSWORD];
    [string addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [string length])];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, [string length])];
    [string addAttribute:NSFontAttributeName value:[UIFont openSansLightFontOfSize:13] range:NSMakeRange(0, [string length])];
    [forgot_password setAttributedTitle:string forState:UIControlStateNormal];
    
    return forgot_password;
}

#pragma mark -

#pragma mark MAIN APP

+ (Imanov_Button *)cell_button:(cell_btn_type)type{
    Imanov_Button *btn = [[Imanov_Button alloc] init];
    [btn setType:type];
    
    [btn setNormalColor:[UIColor clearColor]];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn setBackgroundImage:BG_BTN forState:UIControlStateNormal];
    [btn.layer setBorderColor:[UIColor whiteColor].CGColor];
    [btn.layer setBorderWidth:0.2f];
    
    return btn;
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    
    if(!self.type) return;
    [self cell_btnRecenter];
}

- (void)cell_btnRecenter{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - 25, 20, 50, 50)];
    [imgView setImage:[self imageFor:self.type]];
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    [self addSubview:imgView];
    
    UILabel *label = [[UILabel alloc] init];
    [label setText:[self stringFor:self.type]];
    [label setFont:[UIFont openSansSemiBoldFontOfSize:13]];
    [label setTextColor:[UIColor whiteColor]];
    [label setNumberOfLines:2];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    [label setFrame:CGRectMake(self.frame.size.width*0.1, self.frame.size.height - 60, self.frame.size.width*0.8, 50)];
    [label setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:label];
}
- (UIImage *)imageFor:(cell_btn_type)type{
    switch (type) {
        case agenda: return AGENDA_IMG;
        case access_loc: return ACCESS_IMG;
        case event: return EVENT_IMG;
        case delegates: return DELEGATES_IMG;
        case speaker: return SPEAKER_IMG;
        case partner: return PARTNER_IMG;
        case info: return INFO_IMG;
        case alert: return ALERT_IMG;
        case chat: return CHAT_IMG;
        default: return nil;
    }
    return nil;
}

- (NSString *)stringFor:(cell_btn_type)type{
    switch (type) {
        case agenda: return AGENDA_STR;
        case access_loc: return ACCESS_STR;
        case event: return EVENT_STR;
        case delegates: return DELEGATES_STR;
        case speaker: return SPEAKER_STR;
        case partner: return PARTNER_STR;
        case info: return INFO_STR;
        case alert: return ALERT_STR;
        case chat: return CHAT_STR;
        default: return nil;
    }
    return nil;
}

#pragma mark -

@end
