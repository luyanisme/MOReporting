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
//  LeftNaviBar.h
//  MOReport
//
//  Created by 卢棪 on 2/27/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "Bee.h"

#pragma mark -
AS_UI(LeftNaviBar, leftBar)
@interface LeftNaviBar : BeeUICell

AS_SINGLETON(LeftNaviBar)
AS_OUTLET(BeeUIScrollView, list)

@end
