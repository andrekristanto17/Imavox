//
//  Imanov_TextField.m
//  Imavox
//
//  Created by Andre Kristanto on 29/9/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import "Imanov_TextField.h"
#import <UIFont+OpenSans.h>

@interface Imanov_TextField ()

@property tf_type TYPE;

@end

@implementation Imanov_TextField

+(Imanov_TextField *)typed:(tf_type)type{
    Imanov_TextField *textfield = [[Imanov_TextField alloc] init];
    [textfield setTYPE:type];
    [textfield setDelegate:textfield];
    [textfield addBorder_Acc];
    [textfield addPadding];
    [textfield addFont];
    [textfield addPlaceholder];
    [textfield setSecureTextEntry:(type == t_password ? true : false)];
    
    return textfield;
}

-(void)addBorder_Acc{
    [self.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.layer setBorderWidth:1];
    
    [self setBackground:email_bg_img];
}

-(void)addPadding{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    self.leftView = paddingView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

-(void)addFont{
    [self setFont:[UIFont openSansLightFontOfSize:15]];
    [self setTextColor:[UIColor whiteColor]];
}

-(void)addPlaceholder{
    UIColor *color = [UIColor whiteColor];
    NSString *string = self.TYPE == t_login ? EMAIL_PLACEHOLDER : PASSWORD_PLACEHOLDER;
    NSDictionary *attrs = @{ NSForegroundColorAttributeName : color };
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:string attributes:attrs];
    [self setAttributedPlaceholder:attrStr];
    
    self.keyboardType = self.TYPE == t_login? UIKeyboardTypeEmailAddress : UIKeyboardTypeDefault;
    self.returnKeyType = self.TYPE == t_login ? UIReturnKeyNext : UIReturnKeyDone;
    self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.autocorrectionType = UITextAutocorrectionTypeNo;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{ return YES; }

- (void)textFieldDidEndEditing:(UITextField *)textField{}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    UIResponder *nextResponder = (UITextField *)[textField.superview viewWithTag:textField.tag+1];
    if(nextResponder){
        [nextResponder becomeFirstResponder];
    }
    return YES;
}

@end
