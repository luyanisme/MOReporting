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
//  LeftNaviBar.m
//  MOReport
//
//  Created by 卢棪 on 2/27/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "LeftNaviBar.h"
#import "FounctionCell_iPhone.h"

#pragma mark -

DEF_UI(LeftNaviBar, leftBar)
@implementation LeftNaviBar

DEF_SINGLETON(LeftNaviBar)

DEF_OUTLET(BeeUIScrollView, list)

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    
    @weakify(self);
    self.list.lineCount = 1;
    self.list.animationDuration = 0.25;
    self.list.bounces = NO;
    
    NSArray *testArray = @[@"首页",@"陈列照片反馈",@"店铺物料反馈",@"巡店表格",@"即时陈列指引",@"本店资料",@"关键数据分析"];
    
    self.list.whenReloading = ^{
    
        @normalize(self);
        self.list.total = testArray.count;
        for (int i=0; i<self.list.total; i++) {
            BeeUIScrollItem *item = self.list.items[i];
            item.size = CGSizeAuto;
            item.clazz = [FounctionCell_iPhone class];
            item.data = testArray[i];
        }
    };
}

- (void)unload
{
}

- (void)dataDidChanged
{
    // TODO: fill data
}

- (void)layoutDidFinish
{
    // TODO: custom layout here
}

@end
