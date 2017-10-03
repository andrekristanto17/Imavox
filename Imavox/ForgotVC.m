//
//  ForgotVC.m
//  Imavox
//
//  Created by Andre Kristanto on 29/9/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import "ForgotVC.h"

@interface ForgotVC ()

@end

@implementation ForgotVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self initVariable];
//    [self createSubViews];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

@end
