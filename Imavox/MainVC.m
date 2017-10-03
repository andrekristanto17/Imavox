//
//  MainVC.m
//  Imavox
//
//  Created by Andre Kristanto on 30/9/17.
//  Copyright © 2017 HIPSTER. All rights reserved.
//

#import "MainVC.h"

#import "Imanov_Button.h"
#import "Imanov_View.h"

#import "User.h"
#import "ResizeManager.h"

#import <UIFont+OpenSans.h>

#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height

#define CELL_WIDTH WIDTH/3 - 1
#define CELL_HEIGHT 120

@interface MainVC ()

@end

@implementation MainVC{
    UIView *cell_view;
    Imanov_Button *agenda_btn;
    Imanov_Button *access_btn;
    Imanov_Button *event_btn;
    Imanov_Button *delegates_btn;
    Imanov_Button *speaker_btn;
    Imanov_Button *partner_btn;
    Imanov_Button *info_btn;
    Imanov_Button *alert_btn;
    Imanov_Button *chat_btn;
    
    
    ResizeManager *resizing;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initVariable];
    [self createSubViews];
}

- (void)initVariable{
    resizing = [ResizeManager singleton];
    [resizing initState:self.view.frame];
}

- (void)createSubViews{
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [bgView setBackgroundColor:DARK_LIGHT_BLUE];
    [self.view addSubview:bgView];
    
    Imanov_View *topBar = [Imanov_View topMenu:self.view.frame];
    [self.view addSubview:topBar];
    
    UIImageView *headerView = [[UIImageView alloc] initWithFrame:CGRectMake(2.5, [resizing distanceY:topBar], WIDTH-5, (WIDTH -5) * 500/1060)];
    [headerView setImage:EVENT_HEADER];
    [headerView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:headerView];
    
    cell_view = [[UIView alloc] initWithFrame:CGRectMake(0.5, [resizing distanceY:headerView] + 0.5, WIDTH-0.5, 3 * CELL_HEIGHT)];
    [self addCellSubViews];
    [self.view addSubview:cell_view];
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(WIDTH/2 - 50, [resizing distanceY:cell_view], 100, 50)];
    
    UILabel *poweredByLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
    [poweredByLabel setText:POWERED_BY];
    [poweredByLabel setFont:[UIFont openSansLightFontOfSize:10]];
    [poweredByLabel setTextColor:[UIColor whiteColor]];
    [poweredByLabel setTextAlignment:NSTextAlignmentCenter];
    [footerView addSubview:poweredByLabel];
    
    UIImageView *footerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 100, 30)];
    [footerImageView setImage:LOGO_IMG_FOOTER];
    [footerImageView setContentMode:UIViewContentModeScaleAspectFit];
    [footerView addSubview:footerImageView];
    
    [self.view addSubview:footerView];
}

- (void)addCellSubViews{
    agenda_btn = [Imanov_Button cell_button:agenda];
    [agenda_btn setFrame:CGRectMake(0, 0, CELL_WIDTH, CELL_HEIGHT)];
    [cell_view addSubview:agenda_btn];
    
    access_btn = [Imanov_Button cell_button:access_loc];
    [access_btn setFrame:CGRectMake(CELL_WIDTH + 0.5, 0, CELL_WIDTH, CELL_HEIGHT)];
    [cell_view addSubview:access_btn];
    
    event_btn = [Imanov_Button cell_button:event];
    [event_btn setFrame:CGRectMake(2 * CELL_WIDTH + 0.5, 0, CELL_WIDTH, CELL_HEIGHT)];
    [cell_view addSubview:event_btn];
    
    delegates_btn = [Imanov_Button cell_button:delegates];
    [delegates_btn setFrame:CGRectMake(0, CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT)];
    [cell_view addSubview:delegates_btn];
    
    speaker_btn = [Imanov_Button cell_button:speaker];
    [speaker_btn setFrame:CGRectMake(CELL_WIDTH + 0.5, CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT)];
    [cell_view addSubview:speaker_btn];
    
    partner_btn = [Imanov_Button cell_button:partner];
    [partner_btn setFrame:CGRectMake(2 * CELL_WIDTH + 0.5, CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT)];
    [cell_view addSubview:partner_btn];
    
    info_btn = [Imanov_Button cell_button:info];
    [info_btn setFrame:CGRectMake(0, 2 * CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT)];
    [cell_view addSubview:info_btn];
    
    alert_btn = [Imanov_Button cell_button:alert];
    [alert_btn setFrame:CGRectMake(CELL_WIDTH + 0.5, 2 * CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT)];
    [cell_view addSubview:alert_btn];
    
    chat_btn = [Imanov_Button cell_button:chat];
    [chat_btn setFrame:CGRectMake(2 * CELL_WIDTH + 0.5, 2 * CELL_HEIGHT, CELL_WIDTH, CELL_HEIGHT)];
    [cell_view addSubview:chat_btn];
    
}
@end
