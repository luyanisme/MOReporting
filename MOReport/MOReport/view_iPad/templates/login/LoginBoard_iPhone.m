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
//  LoginBoard_iPhone.m
//  MOReport
//
//  Created by 卢棪 on 2/27/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "LoginBoard_iPhone.h"
#import "AppBoard_iPad.h"

#pragma mark -

@interface LoginBoard_iPhone()
{
	//<#@private var#>
}
@end

@implementation LoginBoard_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
}

- (void)unload
{
}

#pragma mark - Signal

ON_CREATE_VIEWS( signal )
{
    self.view.backgroundColor = [UIColor whiteColor];
}

ON_DELETE_VIEWS( signal )
{
}

ON_LAYOUT_VIEWS( signal )
{
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
    bee.ui.appBoard.popBtn.hidden = NO;
}

ON_SIGNAL3( BeeUINavigationBar, LEFT_TOUCHED, signal )
{
}

ON_SIGNAL3( BeeUINavigationBar, RIGHT_TOUCHED, signal )
{
}

ON_SIGNAL3(LoginBoard_iPhone, login_btn, signal){
    
    /*到时候用的时候打开
    NSString * userName = $(@"userName").text.trim;
    NSString * password = $(@"password").text.trim;
    
    if (userName.length == 0) {
        [self presentMessageTips:@"请输入用户名"];
        return;
    }
    
    if (password.length == 0) {
        [self presentMessageTips:@"请输入密码"];
        return;
    }
     */
    
    [bee.ui.router open:@"MainBoard_iPhone" animated:YES];
}

ON_SIGNAL3(LoginBoard_iPhone, register_btn, signal){
}
@end
