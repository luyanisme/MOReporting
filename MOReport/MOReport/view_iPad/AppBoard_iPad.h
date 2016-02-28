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
//  AppBoard_iPad.h
//  MOReport
//
//  Created by 卢棪 on 2/27/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "Bee.h"

AS_UI(AppBoard_iPad, appBoard)

@interface AppBoard_iPad : BeeUIBoard

AS_SINGLETON( AppBoard_iPad )
@property(nonatomic, strong) BeeUIButton *popBtn;//弹出做导航栏

@end
