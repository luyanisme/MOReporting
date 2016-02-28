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
//  CalendarCell.m
//  MOReport
//
//  Created by 卢棪 on 2/28/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "CalendarCell.h"

#pragma mark -

@interface CalendarCell ()
{
    CKCalendarView *_calendar;
}

@end

@implementation CalendarCell

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    self.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
    
    _calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
    _calendar.delegate = self;
    _calendar.backgroundColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
    _calendar.dateBackgroundColor = [UIColor clearColor];
    _calendar.dateBorderColor = [UIColor clearColor];
    _calendar.selectedDateBackgroundColor = [UIColor colorWithRed:0.91f green:0.20f blue:0.34f alpha:1.00f];
    _calendar.dateTextColor = [UIColor whiteColor];
    _calendar.selectedDateTextColor = [UIColor whiteColor];
    _calendar.currentDateTextColor = [UIColor colorWithRed:0.62 green:0.62 blue:0.63 alpha:1.0f];
    _calendar.dayOfWeekTextColor = [UIColor whiteColor];
    _calendar.titleFont = [UIFont systemFontOfSize:20];
    _calendar.titleColor = [UIColor whiteColor];
    _calendar.dayOfWeekFont = [UIFont systemFontOfSize:12];
    _calendar.dateFont = [UIFont systemFontOfSize:12];
    _calendar.layer.cornerRadius = 8.0f;
    [self addSubview:_calendar];

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

- (void)layoutSubviews{
    _calendar.frame = self.bounds;
}

#pragma mark - Delegate of calendar
- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date
{
    //日历集成的代码，没有设置时区，导致点击某一天比实际差一天，这块代码进行修改
    //源代码中修改，会导致天数乱掉
    //    NSString* clickDate = [self getCurrentDate:date];
    //    NSLog(@"%@",clickDate);
    //    [self postNotification:self.DATE_CHANGE withObject:date];
    //    [self.stack popBoardAnimated:YES];
}
@end
