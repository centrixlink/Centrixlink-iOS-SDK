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


typedef void (^CentrixLinkADDebugBlock)(NSString *message, CLSLogLevel level);



@interface CentrixlinkAD : NSObject

/**   代理
 *
 */
@property (nonatomic, weak) id<CentrixLinkADDelegate>delegate;


@property (nonatomic, weak) id<CentrixLinkSplashADDelegate>splashADdelegate;

@property (nonatomic, assign) NSInteger fetchDelay;
/**
 *   单例
 *
 *  @return Centrixlink 类对象
 */

+ (CentrixlinkAD *)sharedInstance;



+ (NSString *)SDKVersion;
/**
 *   启动SDK方法
 *
 *  @param appID        申请的APPID KEY 字符串
 *  @param AppSecretKey 申请的AppSecretkey 字符串
 *  @param error        成功返回nil, 失败返回Error信息
 */
- (BOOL)startWithAppID:(NSString *)appID AppSecretKey:(NSString *)AppSecretKey error:(NSError * __autoreleasing*)error;


/**
 *   检查当前是否可以显示广告包括实时广告及预加载广告
 *   每次播放广告前请进行判断，防止无广告显示。
 *   @return true 可以播放广告，false 暂时不能播放广告；
 */
- (BOOL)isShowableAD;


/**
 *  是否有效的预加载广告
 *
 *  @return true 有预加载广告，false 暂无预加载广告
 */
- (BOOL)hasPreloadAD;


/**
 调整插屏的布局

 (注意：所有参数均为百分比，取值范围:[0 1])
 
 @param top 上边距
 @param left 左边距
 @param videoScale 短边占比(例如：在竖屏模式下，指的是指定区域的宽占整个屏幕宽的比例，反之横屏模式下就是指定区域的高占整个屏幕高的比例)
 @return YES:可以调整、 NO:不可以调整
 */

- (BOOL)resizeInterstitialADWithTop:(float)top left:(float)left videoScale:(float)videoScale;



/**
 *   播放广告
 *
 *  (注意：这里可以指定播放区域的大小位置信息)
 *
 *  @param ViewController 当前显示页面ViewController对象
 *  @param options        自定义上传跟此次广告播放相关数据，便于跟踪广告及广告激励
 *  @param error          播放失败返回
 *
 *  @return true 成功播放，false 播放失败
 */
- (BOOL)showAD:(UIViewController *)ViewController options:(NSDictionary *)options error:(NSError * __autoreleasing*)error;






/**
 开屏广告
 */
- (BOOL)showSplashAD;



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
- (void)setDebugBlock:(CentrixLinkADDebugBlock)debugBlock;

@end


NS_ASSUME_NONNULL_END
