//
//  CentrixlinkAD.h
//  Centrixlink
//
//  Created by 王俊拯 on 16/6/14.
//  Copyright © 2016年 Centrixlink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLSLog.h"


NS_ASSUME_NONNULL_BEGIN

@class UIViewController;

extern NSString* ShowADOptionKeyInterstitialAD;
extern NSString* ShowADOptionKeyOrientations;
extern NSString* ShowADOptionKeyUser;
extern NSString* ShowADOptionKeyPlacement;
extern NSString* ShowADOptionKeyExtraInfoDictionary;
extern NSString* ShowADOptionKeyExtra1;
extern NSString* ShowADOptionKeyExtra2;
extern NSString* ShowADOptionKeyExtra3;
extern NSString* ShowADOptionKeyExtra4;
extern NSString* ShowADOptionKeyExtra5;
extern NSString* ShowADOptionKeyExtra6;
extern NSString* ShowADOptionKeyExtra7;
extern NSString* ShowADOptionKeyExtra8;

/**
 *   后台下载完成block 定义
 */

typedef void (^BackgroudCompletionHandler)();

/**
 *   自定义debug输出block
 *
 *  @param message debug 内容
 *  @param level   debug 级别,具体定义
 
 */

typedef void (^CentrixLinkADDebugBlock)(NSString *message, CLSLogLevel level);


@protocol CentrixLinkADDelegate <NSObject>

@optional

/**
 *    广告即将显示
 *
 *  @param ADInfo 广告信息
 */

- (void)centrixLinkADWillShowAD:(NSDictionary *)ADInfo;



/**
 *   广告完成显示
 *
 *  @param ADInfo 广告信息
 */
- (void)centrixLinkADDidShowAD:(NSDictionary *)ADInfo;

/**
 *   广告显示即将关闭
 *
 *  @param ADInfo 广告信息
 */
- (void)centrixLinkADWillCloseAD:(NSDictionary *)ADInfo;


/**
 *   广告显示已关闭
 *
 *  @param ADInfo 广告信息
 */
- (void)centrixLinkADDidCloseAD:(NSDictionary *)ADInfo;


/**
 *   测试数据加载完成
 *
 *  @param error error description
 */
- (void)loadAsssetDidFinished:(NSError *)error;

@end




@interface CentrixlinkAD : NSObject

/**   代理
 *
 */
@property (nonatomic, weak) id<CentrixLinkADDelegate>delegate;

/**
 *  iOS后台下载完成系统回调，
 * 
 @discusstion:
    若开启后台广告预载请添加如下代码：
 
  -(void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler{
    [CentrixlinkAD sharedInstance].backgroudCompletionHandler = completionHandler;
 }
*/
@property (nonatomic, copy) BackgroudCompletionHandler backgroudCompletionHandler;

/**
 *   单例
 *
 *  @return Centrixlink 类对象
 */

+ (CentrixlinkAD *)sharedInstance;

/**
 *   启动SDK方法
 *
 *  @param appID        申请的APPID KEY 字符串
 *  @param AppSecretKey 申请的AppSecretkey 字符串
 *  @param error        成功返回nil, 失败返回Error信息
 */
- (void)startWithAppID:(NSString *)appID AppSecretKey:(NSString *)AppSecretKey error:(NSError * __autoreleasing*)error;


/**
 *   加载测试数据包
 *   仅用于SDK开发调试，集成SDK不需要关心此接口
 *  @param path 测试包文件路径
 */
- (void)loadAssetWithPath:(NSString *)path;

/**
 *   是否可以显示广告
 *   每次播放广告前请进行判断，防止无广告显示。
 *  @return true 可以播放广告，false 暂时不能播放广告；
 */
- (BOOL)isShowableAD;

- (void)flushPreloadList;

/**
 *   播放广告
 *
 *  @param ViewController 当前显示页面ViewController对象
 *  @param options        自定义上传跟此次广告播放相关数据，便于跟踪广告及广告激励
 *  @param error          播放失败返回
 *
 *  @return true 成功播放，false 播放失败
 */
- (BOOL)showAD:(UIViewController *)ViewController options:(NSDictionary *)options error:(NSError * __autoreleasing*)error;


-(void)newAppID:(NSString *)appID AppSecretKey:(NSString *)AppSecretKey error:(NSError **)error;

/**
 *  还原Preload数据，清除缓存
 */
- (void)resetPreloadCache;


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