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
//  DisplayFormBoard_iPhone.m
//  MOReport
//
//  Created by 卢棪 on 2/28/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "DisplayFormBoard_iPhone.h"
#import "CalendarWidgt.h"

#pragma mark -

@interface DisplayFormBoard_iPhone()
{
	//<#@private var#>
    CalendarWidgt *_calendarWidgt;
    NSArray       *_dateList;
}
@end

@implementation DisplayFormBoard_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    [self loadData];
    _calendarWidgt = [CalendarWidgt cell];
    _calendarWidgt.dateList = _dateList;
}

- (void)unload
{
}

- (void)loadData{
    DATEITEM *dataItem = [[DATEITEM alloc] init];
    dataItem.month = @"JUNE";
    dataItem.date = @"30";
    
    _dateList = @[dataItem,dataItem,dataItem,dataItem,dataItem,dataItem,dataItem,dataItem,dataItem,dataItem];
    
}

#pragma mark - Signal

ON_CREATE_VIEWS( signal )
{
    self.view.backgroundColor = [UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f];
    
    [_calendarWidgt showWithParentCtrl:self];
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

@end
