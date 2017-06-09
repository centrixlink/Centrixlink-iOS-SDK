//
//  CLSLog.h
//  Centrixlink
//
//  Created by 王俊拯 on 16/7/20.
//  Copyright © 2016年 Centrixlink. All rights reserved.
//

#ifndef _CLSLOG_H_
#define _CLSLOG_H_

#ifdef __cplusplus
#import <Foundation/Foundation.h>
#else
@import Foundation;
#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CLSLogLevel){
    CLSLogLevelError,
    CLSLogLevelWarning,
    CLSLogLevelInformation,
    CLSLogLevelDebug
    
};


#define CLSLog(level, ...) \
{ \
CLSLogEx(level, @(__FILE__), @(__PRETTY_FUNCTION__), __LINE__, nil, __VA_ARGS__); \
}


static const NSUInteger CLSLogLevelCount = CLSLogLevelDebug + 1;


//! Log to Error level
#define CLSLogError(...)        CLSLog(CLSLogLevelError,__VA_ARGS__)
//! Log to Warning level
#define CLSLogWarning(...)      CLSLog(CLSLogLevelWarning,  __VA_ARGS__)
//! Log to Information level
#define CLSLogInfo(...)         CLSLog(CLSLogLevelInformation,  __VA_ARGS__)
//! Log to Debug level
#define CLSLogDebug(...)        CLSLog(CLSLogLevelDebug, __VA_ARGS__)



FOUNDATION_EXPORT void CLSLogEx(CLSLogLevel level,
                                NSString *file,
                                NSString *function,
                                unsigned int line,
                                id __nullable contextObject,
                                NSString *format, ...) NS_FORMAT_FUNCTION(6,7);

FOUNDATION_EXTERN NSString *CLSLogLevelToString(CLSLogLevel level);



NS_ASSUME_NONNULL_END


#endif
