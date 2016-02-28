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
//  CalendarWidgt.h
//  MOReport
//
//  Created by 卢棪 on 2/28/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "Bee.h"

#pragma mark -

@interface CalendarWidgt : BeeUICell

@property (nonatomic, strong) NSArray *dateList;

AS_OUTLET(BeeUIScrollView, list)

- (void)showWithParentCtrl:(UIViewController*)parentCtrl;

@end
