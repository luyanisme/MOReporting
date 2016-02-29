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
@class NOTICEITEM;

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

@interface NOTICEITEM : NSObject

@property (nonatomic, strong) NSString *noticeContent;//消息内容
@property (nonatomic, strong) NSNumber *noticeType;//消息类型
@property (nonatomic, assign) BOOL      isReaded;//标识是否已读

@end