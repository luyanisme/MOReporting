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
//  ShopInfoBoard_iPhone.m
//  MOReport
//
//  Created by 卢棪 on 2/29/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "ShopInfoBoard_iPhone.h"

#pragma mark -

@interface ShopInfoBoard_iPhone()
{
	//<#@private var#>
    AddressCell_iPhone *_addressCell;
    UIView             *_aglinView;
}
@end

@implementation ShopInfoBoard_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    /*需要写在上面,避免不加载*/
    _addressCell = [AddressCell_iPhone cell];
    
    $(@"#address_line").SHOW();
    $(@"#tools_line").HIDE();
    $(@"#displays_line").HIDE();
    $(@"#other_line").HIDE();
    
}

- (void)unload
{
}

#pragma mark - Signal

ON_CREATE_VIEWS( signal )
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_addressCell];
}

ON_DELETE_VIEWS( signal )
{
}

ON_LAYOUT_VIEWS( signal )
{
    _aglinView = $(@"algin_view").view;
    _addressCell.frame = CGRectMake(_aglinView.frame.origin.x, _aglinView.frame.origin.y+10, _aglinView.frame.size.width, 150);
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

/*地址信息*/
ON_SIGNAL3(ShopInfoBoard_iPhone, address, signal){
    $(@"#address_line").SHOW();
    $(@"#tools_line").HIDE();
    $(@"#displays_line").HIDE();
    $(@"#other_line").HIDE();
}

/*工程道具清单*/
ON_SIGNAL3(ShopInfoBoard_iPhone, tools, signal){
    $(@"#address_line").HIDE();
    $(@"#tools_line").SHOW();
    $(@"#displays_line").HIDE();
    $(@"#other_line").HIDE();
}

/*陈列道具清单*/
ON_SIGNAL3(ShopInfoBoard_iPhone, displays, signal){
    $(@"#address_line").HIDE();
    $(@"#tools_line").HIDE();
    $(@"#displays_line").SHOW();
    $(@"#other_line").HIDE();
}

/*其他资料*/
ON_SIGNAL3(ShopInfoBoard_iPhone, other, signal){
    $(@"#address_line").HIDE();
    $(@"#tools_line").HIDE();
    $(@"#displays_line").HIDE();
    $(@"#other_line").SHOW();
}
@end
