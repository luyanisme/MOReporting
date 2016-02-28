//
//  MetaData.h
//  MOReport
//
//  Created by 卢棪 on 2/27/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DATAFORM;
@class DATAITEM;
@class DATEITEM;

@interface DATAFORM : NSObject

@property (nonatomic, strong) NSString *month;
@property (nonatomic, strong) NSArray  *dataList;

@end

@interface DATAITEM : NSObject

@property (nonatomic, strong) NSString *dataTitle;

@end

@interface DATEITEM : NSObject

@property (nonatomic, strong) NSString *month;
@property (nonatomic, strong) NSString *date;

@end