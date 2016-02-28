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
//  CalendarListCell_iPhone.m
//  MOReport
//
//  Created by 卢棪 on 2/28/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "CalendarListCell_iPhone.h"

#pragma mark -

@implementation CalendarListCell_iPhone

DEF_SIGNAL(TOUCHED)
SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    self.tappable = YES;
    self.tapSignal = self.TOUCHED;
}

- (void)unload
{
}

- (void)dataDidChanged
{
    // TODO: fill data
    if (self.data) {
        DATEITEM *dateItem = self.data;
        $(@"#month").DATA(dateItem.month);
        $(@"#date").DATA(dateItem.date);
    }
}

- (void)layoutDidFinish
{
    // TODO: custom layout here
}

@end
