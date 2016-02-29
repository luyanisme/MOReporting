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
//  NoticeCell_iPhone.m
//  MOReport
//
//  Created by 卢棪 on 2/29/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "NoticeCell_iPhone.h"

#pragma mark -

@implementation NoticeCell_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    $(@"#voice").HIDE();
}

- (void)unload
{
}

- (void)dataDidChanged
{
    // TODO: fill data
    if (self.data) {
        NOTICEITEM *noticeItem = self.data;
        if (noticeItem.isReaded) {
            $(@"#dot").ATTR(@"background-color", @"#a4a4a4");
//                                      $(@"#red_line").RELAYOUT();
        } else {
            $(@"#dot").ATTR(@"background-color", @"#F54036");
        }
        
        if ([noticeItem.noticeType isEqualToNumber:@(0)]) {
            $(@"#content").SHOW();
            $(@"#content").DATA(noticeItem.noticeContent);
            $(@"#voice").HIDE();
        } else {
            $(@"#content").DATA(@"");
            $(@"#voice").SHOW();
            $(@"#content").HIDE();
        }
    }
}

- (void)layoutDidFinish
{
    // TODO: custom layout here
}

@end
