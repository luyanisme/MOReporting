//
//	 ______    ______    ______    
//	/\  __ \  /\  ___\  /\  ___\   
//	\ \  __<  \ \  __\_ \ \  __\_ 
//	 \ \_____\ \ \_____\ \ \_____\ 
//	  \/_____/  \/_____/  \/_____/ 
//
//	Powered by BeeFramework
//
//
//  AppBoard_iPad.m
//  MOReport
//
//  Created by 卢棪 on 2/27/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "AppBoard_iPad.h"
#import "LoginBoard_iPhone.h"
#import "MainBoard_iPhone.h"
#import "LeftNaviBar.h"
#import "DataGridBoard_iPhone.h"
#import "DisplayPhotoBoard_iPhone.h"
#import "DisplayFormBoard_iPhone.h"

#pragma mark -

@interface AppBoard_iPad ()
{
    BOOL _naviBaiIsShow;//naviBar是否弹出
    BeeUIButton *_shadowView;//遮罩层
}

@end

DEF_UI(AppBoard_iPad, appBoard)

@implementation AppBoard_iPad

DEF_SINGLETON( AppBoard_iPad )

- (void)load
{
    self.popBtn = [[BeeUIButton alloc] initWithFrame:CGRectMake(0, 70, 40, 60)];
    self.popBtn.hidden = YES;
    self.popBtn.backgroundColor = [UIColor grayColor];
    [self.popBtn addSignal:@"popLeftNavi" forControlEvents:UIControlEventTouchUpInside];
    
    _shadowView = [[BeeUIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _shadowView.hidden = YES;
    _shadowView.backgroundColor = [UIColor clearColor];
    [_shadowView addSignal:@"shadowView" forControlEvents:UIControlEventTouchUpInside];
}

- (void)unload
{
}

#pragma mark Signal

ON_CREATE_VIEWS( signal )
{
    [self.view addSubview:bee.ui.router.view];
    [self.view addSubview:self.popBtn];
    
    [self.view addSubview:bee.ui.leftBar];
    [self.view insertSubview:_shadowView belowSubview:bee.ui.leftBar];
    
    //映射stack map
    [bee.ui.router map:@"LoginBoard_iPhone" toClass:[LoginBoard_iPhone class]];
    [bee.ui.router map:@"MainBoard_iPhone" toClass:[MainBoard_iPhone class]];
    [bee.ui.router map:@"DataGridBoard_iPhone" toBoard:[DataGridBoard_iPhone board]];
    [bee.ui.router map:@"DisplayPhotoBoard_iPhone" toBoard:[DisplayPhotoBoard_iPhone board]];
    [bee.ui.router map:@"DisplayFormBoard_iPhone" toBoard:[DisplayFormBoard_iPhone board]];
    
    [bee.ui.router open:@"LoginBoard_iPhone"];
}

ON_DELETE_VIEWS( signal )
{
}

ON_LAYOUT_VIEWS( signal )
{
    
    bee.ui.leftBar.frame = CGRectMake(-250, 0, 250, SCREEN_HEIGHT);
}

ON_WILL_APPEAR( signal )
{
}

ON_DID_APPEAR( signal )
{
}

ON_WILL_DISAPPEAR( signal )
{
}

ON_DID_DISAPPEAR( signal )
{
}

ON_SIGNAL3( BeeUINavigationBar, LEFT_TOUCHED, signal )
{
}

ON_SIGNAL3( BeeUINavigationBar, RIGHT_TOUCHED, signal )
{
}

ON_SIGNAL2(BeeUIButton, signal){
    if ([signal is:@"popLeftNavi"]) {
        [self showLeftNaviBar];
        _shadowView.hidden = NO;
    }
    
    if ([signal is:@"shadowView"]) {
        [self hideLeftNaviBar];
        _shadowView.hidden = YES;
    }
}

- (void)showLeftNaviBar{
    if (!_naviBaiIsShow) {
        [UIView animateWithDuration:0.25 animations:^{
            self.popBtn.frame = CGRectMake(-40, 70, 40, 60);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
                bee.ui.leftBar.frame = CGRectMake(0, 0, 250, SCREEN_HEIGHT);
            }];
        }];
        _naviBaiIsShow = YES;
    }
}

- (void)hideLeftNaviBar{
    if (_naviBaiIsShow) {
        [UIView animateWithDuration:0.25 animations:^{
            bee.ui.leftBar.frame = CGRectMake(-250, 0, 250, SCREEN_HEIGHT);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
                self.popBtn.frame = CGRectMake(0, 70, 40, 60);
            }];
        }];
        _naviBaiIsShow = NO;
    }
}

ON_SIGNAL2(FounctionCell_iPhone, signal){
    if ([signal.sourceCell.data isEqualToString:@"首页"]) {
        [bee.ui.router open:@"MainBoard_iPhone" animated:YES];
    }
    
    if ([signal.sourceCell.data isEqualToString:@"关键数据分析"]) {
        [bee.ui.router open:@"DataGridBoard_iPhone" animated:YES];
    }
    
    if ([signal.sourceCell.data isEqualToString:@"陈列照片反馈"]) {
        [bee.ui.router open:@"DisplayPhotoBoard_iPhone" animated:YES];
    }
    
    if ([signal.sourceCell.data isEqualToString:@"巡店表格"]) {
        [bee.ui.router open:@"DisplayFormBoard_iPhone" animated:YES];
    }
    
    _shadowView.hidden = YES;
    [self hideLeftNaviBar];
}
@end
