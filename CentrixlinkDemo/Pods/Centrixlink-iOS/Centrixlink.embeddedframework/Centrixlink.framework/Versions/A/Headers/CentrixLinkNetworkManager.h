//
//  CentrixLinkNetworkManager.h
//  CentrixlinkNetworkDemo
//
//  Created by Codi on 2017/4/7.
//  Copyright © 2017年 Codi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CentrixLinkNetworkManager : NSObject

+ (instancetype _Nullable )manager;

- (NSURLSessionDataTask *_Nullable)POST:(NSString *_Nullable)urlString
                             parameters:(id _Nullable )parameters
                                success:(void (^_Nullable)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                                failure:(void (^_Nullable)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;



@end
