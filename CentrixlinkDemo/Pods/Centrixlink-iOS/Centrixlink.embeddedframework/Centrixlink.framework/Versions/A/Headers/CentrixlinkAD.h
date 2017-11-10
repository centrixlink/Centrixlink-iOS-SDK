//
//  CentrixlinkAD.h
//  Centrixlink
//
//  Created by 王俊拯 on 16/6/14.
//  Copyright © 2016年 Centrixlink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CentrixlinkConst.h"
#import "CentrixlinkProtocol.h"
#import "CLSLog.h"


NS_ASSUME_NONNULL_BEGIN

@class UIViewController;


typedef void (^CentrixLinkADDebugCallBack)(NSString *message, CLSLogLevel level);

@interface CentrixlinkAD : NSObject

@property (nonatomic, weak) id<CentrixLinkADDelegate>delegate;

@property (nonatomic, weak) id<CentrixLinkSplashADDelegate>splashADdelegate;


/**
 *   单例
 *
 *  @return Centrixlink 类对象
 */

+ (CentrixlinkAD *)sharedInstance;

+ (NSString *)SDKVersion;

/**
 *  是否有效的预加载广告
 *
 *  @return true 有可播放预加载广告，false 暂无可播放预加载广告
 */
- (BOOL)isAdPlayable;

/**
 设置视频广告的展示方向

 @param orientation 视频广告展示方向(UIInterfaceOrientationMaskPortrait / UIInterfaceOrientationMaskLandscape / UIInterfaceOrientationMaskAll = default)
 */
- (void)setPlayAdOrientation:(UIInterfaceOrientationMask)orientation;





/**
 *  开屏广告
 */
- (BOOL)playSplashAD;



/**
 *   播放视频全屏广告
 *
 *  @param ViewController 当前显示页面ViewController对象
 *  @param options        自定义上传跟此次广告播放相关数据，便于跟踪广告及广告激励
 *  @param error          播放失败返回
 *
 *  @return true 成功播放，false 播放失败
 */
- (BOOL)playAD:(UIViewController *)ViewController options:(NSDictionary * __nullable)options error:(NSError * __autoreleasing*)error;



/**
 *   启动SDK方法
 *
 *  @param appID        申请的APPID KEY 字符串
 *  @param AppSecretKey 申请的AppSecretkey 字符串
 *  @param error        成功返回nil, 失败返回Error信息
 */
- (BOOL)startWithAppID:(NSString *)appID AppSecretKey:(NSString *)AppSecretKey error:(NSError * __autoreleasing*)error;

/**
 *   DeBug开关显示
 *
 *  @param enable true 开启debug，false 关闭debug
 */
- (void)setDebugEnable:(BOOL)enable;


/**
 *   自定义debug 内容回调显示
 *
 *  @param debugBlock debugBlock，若不设置则在Xcode debug中显示，
 */
- (void)setDebugCallBack:(CentrixLinkADDebugCallBack)callBack;

@end


NS_ASSUME_NONNULL_END
