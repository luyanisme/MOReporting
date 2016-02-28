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
//  DataCell.m
//  MOReport
//
//  Created by 卢棪 on 2/27/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "DataCell.h"

#pragma mark -

@implementation DataCell

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
}

- (void)unload
{
}

- (void)dataDidChanged
{
    // TODO: fill data
    if (self.data) {
        $(@"#title").DATA(self.data);
    }
}

- (void)layoutDidFinish
{
    // TODO: custom layout here
}

@end
