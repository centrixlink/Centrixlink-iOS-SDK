//
//  CentrixlinkProtocol.h
//  Centrixlink
//
//  Created by Codi on 2017/3/30.
//  Copyright © 2017年 Centrixlink. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CentrixlinkADItem;


#pragma mark - CentrixLinkADDelegate

@protocol CentrixLinkADDelegate <NSObject>

@required

/**
 *  广告关闭
 *
 *  @param ADInfo 预留信息
 */
- (void)centrixLinkVideoADClose:(NSDictionary *)ADInfo;

@optional

/**
 *  本地是否有预加载广告
 *
 *  @param hasPreload YES:存在 NO:不存在
 */
- (void)centrixLinkAdPlayability:(BOOL)isAdPlayable;


/**
 *  广告即将显示
 *
 *  @param ADInfo 广告信息
 */
- (void)centrixLinkVideoADWillShow:(NSDictionary *)ADInfo;

/**
 *  广告完成显示
 *
 *  @param ADInfo 广告信息
 */
- (void)centrixLinkVideoADDidShow:(NSDictionary *)ADInfo;




/**
 *  触发endCard的action事件
 *
 *  @param ADInfo 预留信息
 */
- (void)centrixLinkVideoADAction:(NSDictionary *)ADInfo;


/**
 *  显示广告出错
 *
 *  @param error 通过不同的error code区分不同的错误类型
 */
- (void)centrixLinkVideoADShowFail:(NSError *)error;


@end



#pragma mark - CentrixLinkSplashADDelegate

@protocol CentrixLinkSplashADDelegate <NSObject>


/**
 *  开屏广告关闭
 *
 *  @param info
 */
- (void)centrixlinkSplashADClosed:(NSDictionary *)info;


/**
 *  开屏广告显示成功
 *
 *  @param info
 */
- (void)centrixlinkSplashADDidShow:(NSDictionary *)info;


/**
 *  开屏广告跳过
 *
 *  @param info
 */
- (void)centrixlinkSplashADSkip:(NSDictionary *)info;


/**
 *  开屏广告触发了action事件
 *
 *  @param info
 */
- (void)centrixlinkSplashADAction:(NSDictionary *)info;


/**
 *  开屏广告显示失败
 *
 *  @param error 不同的error code对于不同的错误信息
 */
- (void)centrixlinkSplashADShowFail:(NSError *)error;



@end






