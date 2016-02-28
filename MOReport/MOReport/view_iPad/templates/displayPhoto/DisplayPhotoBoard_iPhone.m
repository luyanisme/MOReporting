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
//  DisplayPhotoBoard_iPhone.m
//  MOReport
//
//  Created by 卢棪 on 2/28/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "DisplayPhotoBoard_iPhone.h"
#import "DisplayPhotoBoardCell_iPhone.h"

#pragma mark -

@interface DisplayPhotoBoard_iPhone()
{
	//<#@private var#>
}
@end

@implementation DisplayPhotoBoard_iPhone

DEF_OUTLET(BeeUIScrollView, list)

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
}

- (void)unload
{
}

#pragma mark - Signal

ON_CREATE_VIEWS( signal )
{
    self.view.backgroundColor = [UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f];
    
    @weakify(self);
    self.list.lineCount = 3;
    self.list.animationDuration = 0.25;
    
    self.list.whenReloading = ^{
    
        @normalize(self);
        self.list.total = 12;
        for (int i=0; i<12; i++) {
            BeeUIScrollItem *item = self.list.items[i];
            item.size = CGSizeMake(self.list.size.width/3, self.list.size.height/3);
            item.clazz = [DisplayPhotoBoardCell_iPhone class];
            item.data = nil;
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

/*cell的点击事件*/
ON_SIGNAL2(DisplayPhotoBoardCell_iPhone, signal){

}
@end
