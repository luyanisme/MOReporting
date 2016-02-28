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
//  DataGridCell.m
//  MOReport
//
//  Created by 卢棪 on 2/27/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "DataGridCell.h"
#import "DataCell.h"

#pragma mark -

@implementation DataGridCell

DEF_OUTLET(BeeUIScrollView, list)

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    @weakify(self);
    self.list.lineCount = 6;
    self.list.animationDuration = 0.25;
    self.list.bounces = NO;
    
    self.list.whenReloading = ^{
        @normalize(self);
        self.list.total = self.dataList.count;
        for (int i=0; i<self.list.total; i++) {
            BeeUIScrollItem *item = self.list.items[i];
            item.size = CGSizeMake((SCREEN_WIDTH-200)/6, 100);
            item.clazz = [DataCell class];
            item.data = self.dataList[i];
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

-(void)setDataList:(NSArray *)dataList{
    _dataList = dataList;
    [self.list reloadData];
}

@end
