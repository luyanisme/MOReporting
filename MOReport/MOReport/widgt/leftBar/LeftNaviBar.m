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
    
    self.list.whenReloading = ^{
    
        @normalize(self);
        self.list.total = self.titleLists.count;
        for (int i=0; i<self.list.total; i++) {
            BeeUIScrollItem *item = self.list.items[i];
            item.size = CGSizeAuto;
            item.clazz = [FounctionCell_iPhone class];
            item.data = self.titleLists[i];
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

-(void)setTitleLists:(NSArray *)titleLists{
    _titleLists = titleLists;
}

@end
