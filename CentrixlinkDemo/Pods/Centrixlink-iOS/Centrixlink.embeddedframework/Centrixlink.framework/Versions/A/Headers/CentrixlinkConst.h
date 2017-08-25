//
//  CentrixlinkConst.h
//  Centrixlink
//
//  Created by Codi on 30/03/2017.
//  Copyright © 2017 Centrixlink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CentrixlinkConst : NSObject

/**
 *  扩展信息
 */
UIKIT_EXTERN NSString *const CentrixlinkSDKVersion;
UIKIT_EXTERN NSString *const CentrixlinkPlayAdOptionKeyIECAutoClose;
UIKIT_EXTERN NSString *const CentrixlinkPlayAdOptionKeyUser;
UIKIT_EXTERN NSString *const CentrixlinkPlayAdOptionKeyExtraInfoDictionary;
UIKIT_EXTERN NSString *const CentrixlinkPlayAdOptionKeyExtra1;
UIKIT_EXTERN NSString *const CentrixlinkPlayAdOptionKeyExtra2;
UIKIT_EXTERN NSString *const CentrixlinkPlayAdOptionKeyExtra3;
UIKIT_EXTERN NSString *const CentrixlinkPlayAdOptionKeyExtra4;
UIKIT_EXTERN NSString *const CentrixlinkPlayAdOptionKeyExtra5;
UIKIT_EXTERN NSString *const CentrixlinkPlayAdOptionKeyExtra6;
UIKIT_EXTERN NSString *const CentrixlinkPlayAdOptionKeyExtra7;
UIKIT_EXTERN NSString *const CentrixlinkPlayAdOptionKeyExtra8;



UIKIT_EXTERN NSString *const K_AD_RESIZEVIDEO_TOP;

UIKIT_EXTERN NSString *const K_AD_RESIZEVIDEO_LEFT;

UIKIT_EXTERN NSString *const K_AD_RESIZEVIDEO_VIDEOSCALE;


UIKIT_EXTERN NSString *const SDK_VERSION;

UIKIT_EXTERN NSString *const SDK_VER_CODE;

UIKIT_EXTERN NSString *const REQUEST_ID;

UIKIT_EXTERN NSString *const ZP_REQUEST_ID;

#pragma Delegate 回调字典KEY
/**
 *  广告Key
 */
UIKIT_EXTERN NSString *const ADInfoKEYADID;

/**
 *  是否是缓存广告
 */
//UIKIT_EXTERN NSString *const ADInfoKEYPreloadStatus;
/**
 *  视频播放状态，true 为广告播放完毕，false为广告跳过
 */
UIKIT_EXTERN NSString *const ADInfoKEYADPlayStatus;


/**
 * 视频广告是否被点击，true 点击，false 未点击
 */
UIKIT_EXTERN NSString *const ADInfoKEYIsClick;

/**
 * 视频广告是否跳过
 */

UIKIT_EXTERN NSString *const ADInfoKEYIsSkip;


/**
 *  用于是否插屏广告显示开关
 */
UIKIT_EXTERN NSString *const ShowADOptionKeyRESIZEVIDEOAD;
/**
 *  支持广告的方向
 */
UIKIT_EXTERN NSString *const ShowADOptionKeyOrientations;
/**
 *  当前App 用户ID，用于激励广告
 */
UIKIT_EXTERN NSString *const ShowADOptionKeyUser;

/**
 *  只播放预加载广告
 */
UIKIT_EXTERN NSString *const ShowADOptionKeyOnlyPreload;


/**
 * 自动关闭EndCard页面，true 为广告自动关闭，false为手动关闭
 */
UIKIT_EXTERN NSString *const ShowADOptionKeyAutoCloseADView;


/**
 *  当前广告标识，用于激励广告
 */
UIKIT_EXTERN NSString *const ShowADOptionKeyPlacement;

/**
 *  插屏广告显示的位置
 */
UIKIT_EXTERN NSString *const ADRESIZEVIDEOPosition;


UIKIT_EXTERN NSString *const CL_UIInterfaceOrientationLandscapeLeft;
UIKIT_EXTERN NSString *const CL_UIInterfaceOrientationLandscapeRight;
UIKIT_EXTERN NSString *const CL_UIInterfaceOrientationPortrait;
UIKIT_EXTERN NSString *const CL_UIInterfaceOrientationPortraitUpsideDown;


UIKIT_EXTERN NSString *const CL_HTTP_HEADER_UUID;
UIKIT_EXTERN NSString *const CL_HTTP_HEADER_VERSION;
UIKIT_EXTERN NSString *const CL_HTTP_HEADER_APPID;
UIKIT_EXTERN NSString *const CL_HTTP_HEADER_REQUESTID;
UIKIT_EXTERN NSString *const CL_HTTP_HEADER_OS;
UIKIT_EXTERN NSString *const CL_HTTP_HEADER_MODEL;
UIKIT_EXTERN NSString *const CL_HTTP_HEADER_OSVER;
UIKIT_EXTERN NSString *const CL_HTTP_HEADER_APPVER;
UIKIT_EXTERN NSString *const CL_HTTP_HEADER_BUNDLEID;
UIKIT_EXTERN NSString *const CL_HTTP_HEADER_REPORT_REQUESTID;


/* VideoADEventTable */
UIKIT_EXTERN NSString *const VIDEO_EVENT_TABLE;
/* SplashADEventTable */
UIKIT_EXTERN NSString *const SPLASH_EVENT_TABLE;
/* ADDownloadedTable */
UIKIT_EXTERN NSString *const DOWNLOADED_AD_TABLE;
/* ADFileTable */
UIKIT_EXTERN NSString *const DOWNLOADED_FILE_TABLE;
/* BuryingPointTable */
UIKIT_EXTERN NSString *const BURYINGPOINT_TABLE;
/* ADRequestTable */
UIKIT_EXTERN NSString *const REQUEST_TABLE;
/* trackingUrl */
UIKIT_EXTERN NSString *const TRACKING_EVENT_TABLE;


@end
