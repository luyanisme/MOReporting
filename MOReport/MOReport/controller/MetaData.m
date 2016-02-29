//
//  MetaData.m
//  MOReport
//
//  Created by 卢棪 on 2/27/16.
//  Copyright © 2016 sencloud. All rights reserved.
//

#import "MetaData.h"

@implementation DATAFORM

@synthesize month = _month;
@synthesize dataList = _dataList;

@end

@implementation DATAITEM

@synthesize dataTitle = _dataTitle;

@end

@implementation DATEITEM

@synthesize month = _month;
@synthesize date = _date;

@end

@implementation NOTICEITEM

@synthesize noticeContent = _noticeContent;
@synthesize noticeType = _noticeType;
@synthesize isReaded = _isReaded;

@end
