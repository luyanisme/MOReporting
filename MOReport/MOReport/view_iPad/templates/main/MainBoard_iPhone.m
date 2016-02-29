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
//  MainBoard_iPhone.m
//  MOReport
//
//  Created by 卢棪 on 2/27/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "MainBoard_iPhone.h"
#import "LeftNaviBar.h"
#import "NoticeCell_iPhone.h"

#pragma mark -

@interface MainBoard_iPhone()
{
	//<#@private var#>
    NSArray *_noticeList;
}
@end

@implementation MainBoard_iPhone

DEF_OUTLET(BeeUIScrollView, list)

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    [self loadData];
}

- (void)unload
{
}

- (void)loadData{
    NOTICEITEM *noticeItem = [[NOTICEITEM alloc] init];
    noticeItem.noticeContent = @"未读消息显示总部反馈信息";
    noticeItem.noticeType = @(0);
    noticeItem.isReaded = NO;
    
    NOTICEITEM *noticeItem2 = [[NOTICEITEM alloc] init];
    noticeItem2.noticeContent = @"未读消息显示总部反馈信息";
    noticeItem2.noticeType = @(0);
    noticeItem.isReaded = YES;
    
    NOTICEITEM *noticeItem1 = [[NOTICEITEM alloc] init];
    noticeItem1.noticeContent = @"未读消息显示总部反馈信息";
    noticeItem1.noticeType = @(1);
    
    _noticeList = @[noticeItem,noticeItem,noticeItem,noticeItem2,noticeItem2,noticeItem1,noticeItem1];
}

#pragma mark - Signal

ON_CREATE_VIEWS( signal )
{
    self.view.backgroundColor = [UIColor blackColor];
    
    @weakify(self);
    self.list.lineCount = 1;
    self.list.animationDuration = 0.25;
    
    self.list.whenReloading = ^{
        
        NOTICEITEM *noticeItem;
        @normalize(self);
        self.list.total = _noticeList.count;
        for (int i=0; i<self.list.total; i++) {
            noticeItem = _noticeList[i];
            BeeUIScrollItem *item = self.list.items[i];
            item.size = [noticeItem.noticeType isEqualToNumber:@(0)] ? CGSizeMake(self.list.width, 20) : CGSizeMake(self.list.width, 40);
            item.clazz = [NoticeCell_iPhone class];
            item.data = noticeItem;
        }
    };
    
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
}

ON_SIGNAL3( BeeUINavigationBar, LEFT_TOUCHED, signal )
{
}

ON_SIGNAL3( BeeUINavigationBar, RIGHT_TOUCHED, signal )
{
}

/*潮流速递*/
ON_SIGNAL3(MainBoard_iPhone, fashion_news, signal){

}

/*培训资料*/
ON_SIGNAL3(MainBoard_iPhone, trainning_data, signal){
    
}

/*陈列基础手册*/
ON_SIGNAL3(MainBoard_iPhone, display_book, signal){
    
}

/*更多消息*/
ON_SIGNAL3(MainBoard_iPhone, more_btn, signal){

}
@end
