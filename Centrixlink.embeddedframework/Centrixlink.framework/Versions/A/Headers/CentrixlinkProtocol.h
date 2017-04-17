//
//  CentrixlinkProtocol.h
//  Centrixlink
//
//  Created by Codi on 2017/3/30.
//  Copyright © 2017年 Centrixlink. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - CentrixLinkADDelegate

@protocol CentrixLinkADDelegate <NSObject>

@required
- (void)centrixLinkADDidCloseAD:(NSDictionary *)ADInfo;

@optional


- (void)centrixLinkADPreloadADStatusChange:(BOOL)hasPreload;

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
 *   注：当广告有成功点击跳转才被调用
 *  @param ADInfo 广告信息
 */
- (void)centrixLinkADWillCloseAD:(NSDictionary *)ADInfo;


/**
 *   广告显示已关闭
 *
 *  @param ADInfo 广告信息及广告播放错误信息
 */


/**
 *   广告视频播放完毕状态
 *
 *  @param ADInfo 广告信息
 */
- (void)centrixLinkADVideoDidPlayStatus:(NSDictionary *)ADInfo;


@end



#pragma mark - CentrixLinkSplashADDelegate

@protocol CentrixLinkSplashADDelegate <NSObject>

@required



- (void)splashAdClosed:(NSDictionary *)splashADInfo;


@optional

- (void)splashSuccessPresentScreen:(NSDictionary *)splashADInfo;

- (void)splashFailPresentScreen:(NSDictionary *)splashADInfo error:(NSError *)error;

- (void)splashAdClicked:(NSDictionary *)splashADInfo;



@end




