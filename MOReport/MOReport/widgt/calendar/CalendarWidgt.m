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
//  CalendarWidgt.m
//  MOReport
//
//  Created by 卢棪 on 2/28/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "CalendarWidgt.h"
#import "CalendarListCell_iPhone.h"
#import "CalendarCell.h"

#pragma mark -

@interface CalendarWidgt ()
{
    CalendarCell *_calendarCell;
    BOOL         _isShowCalendar;
}



@end

@implementation CalendarWidgt

DEF_OUTLET(BeeUIScrollView, list)

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)showWithParentCtrl:(UIViewController*)parentCtrl{
    _calendarCell = [CalendarCell cell];
    _calendarCell.hidden = YES;
    [parentCtrl.view addSubview:self];
    [parentCtrl.view addSubview:_calendarCell];
    
}

- (void)load
{
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    
    @weakify(self);
    self.list.lineCount = 1;
    self.list.animationDuration = 0.25;
    
    self.list.whenReloading = ^{
        
        @normalize(self);
        self.list.total = self.dateList.count;
        for (int i=0; i<self.list.total; i++) {
            BeeUIScrollItem *item = self.list.items[i];
            item.size = CGSizeAuto;
            item.clazz = [CalendarListCell_iPhone class];
            item.data = self.dateList[i];
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

- (void)setDateList:(NSArray *)dateList{
    _dateList = dateList;
    [self.list reloadData];
}

- (void)layoutSubviews{
    self.frame = CGRectMake(SCREEN_WIDTH-60, 100, 60, 535);
    _calendarCell.frame = CGRectMake(SCREEN_WIDTH-60-200, 100, 200, 223);
}

//弹出日历
ON_SIGNAL3(CalendarWidgt, choose_calendar, signal){
    if (_isShowCalendar) {
        _calendarCell.hidden = YES;
        _isShowCalendar = NO;
    } else {
        _calendarCell.hidden = NO;
        _isShowCalendar = YES;
    }
}

//点击向上翻
ON_SIGNAL3(CalendarWidgt, up_arrow, signal){
    
}

//点击向下翻
ON_SIGNAL3(CalendarWidgt, down_arrow, signal){
    
}

//日期点击事件
ON_SIGNAL2(CalendarListCell_iPhone, signal){

}
@end
