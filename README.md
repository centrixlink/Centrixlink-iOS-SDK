# Centrixlink-iOS-SDK

### 平台支持
iOS7+ 版本

### 准备工作

#### 自动操作
Centrixlink iOS SDK可以通过Cocoapods工具自动操作完成。使用Cocoapods工具安装Centrixlink iOS SDK，只需在工程Podfile文件中添加以下一行代码并重新运行pod install命令即可。

> pod 'Centrixlink-iOS'

#### 手动操作
1.  从官网下载Centrixlink_iOS_SDK.zip文件。
2.  解压缩Centrixlink框架(Centrixlink.embeddedframework)，并添加到XCode项目中。
3.  添加以下依赖库:
 
	```
	   * AdSupport.framework
	   * AVFoundation.framework
	   * CFNetwork.framework
	   * Foundation.framework
	   * MediaPlayer.framework
	   * libz.dylib
	   * Storekit.framework
	   * libstdc++.dylib
	   * CoreLocation.framework
	   * SystemConfiguration.framework
	   * UIKit.framework
	   
	```
4.  添加编译参数

   >在Xcode中选择项目的Targets->Build Settings，配置Other Link Flags 增加 -ObjC -all_load
   
5. 申请：[App ID、App Key](https://dashboard.centrixlink.com/login)

### 集成说明

### 1. 添加头文件 
* AppDelegate.h:

```objc
 #import <Centrixlink/Centrixlink.h>
```

### 2. 开启后台预加载
* AppDelegate.m:

```objc
- (void)application:(UIApplication *) application 
    handleEventsForBackgroundURLSession:(NSString *)identifier
     completionHandler:(void (^)())completionHandler {
  [CentrixlinkAD sharedInstance].backgroudCompletionHandler = completionHandler;
}
```

### 3. 激活SDK

* AppDelegate.m:

```objc
- (BOOL)application:(UIApplication *)application 
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   //开启debug
    [[CentrixlinkAD sharedInstance] setDebugEnable:YES]; 
    //激活SDK
    NSError *error;
    [[CentrixlinkAD sharedInstance] startWithAppID:@"Your AppID Here" 
        AppSecretKey:@"Your SecretKey Here" error:&error];
        if(error){
           NSLog(@"start Error %@", error);
        }else{
           NSLog(@"start Success");
        }
}
```

###  4. 添加代码到展示视频广告的ViewController中

#### 4.1 添加代理
```objc
- (void)viewDidLoad{
  //设置代理
   [[CentrixlinkAD sharedInstance] setDelegate:self];
  }
```

#### 4.2 跟踪视频广告展示添加相关委托接口

```objc
/**
 *  广告Key
 */
UIKIT_EXTERN NSString *const ADInfoKEYADID;

/**
 *  是否有缓存视频广告
 */
UIKIT_EXTERN NSString *const ADInfoKEYPreloadStatus;
/**
 *  视频广告播放状态，true为视频广告播放完毕，false为视频广告跳过
 */
UIKIT_EXTERN NSString *const ADInfoKEYADPlayStatus;


/**
 * 视频广告是否被点击，true为点击，false为未点击
 */
UIKIT_EXTERN NSString *const ADInfoKEYIsClick;


#pragma mark ----CentrixlinkDelegate

-(void)centrixLinkADPreloadADStatusChange:(BOOL)hasPreload
{
    NSLog(@"视频预加载状态 %@",hasPreload? @"有预加载视频广告":@"无预加载视频广告");
}

/**
 *    视频广告即将展示
 *
 *  @param ADInfo 视频广告信息
 */
 
 
- (void)centrixLinkADWillShowAD:(NSDictionary *)ADInfo
{
      NSLog(@"视频广告数据已经准备完毕，即将开始展示；请保存当前应用或游戏状态");
}


/**
 *   视频广告完成展示
 *
 *  @param ADInfo 视频广告信息
 */
- (void)centrixLinkADDidShowAD:(NSDictionary *)ADInfo
{
      NSLog(@"视频广告页面已经展示");
}


/**
 *   视频广告视频播放完毕状态
 *
 *  @param ADInfo 视频广告信息
 */
 
- (void)centrixLinkADVideoDidPlayStatus:(NSDictionary *)ADInfo
{
  
    
     NSNumber *isPlayFinish= [ADInfo objectForKey:ADInfoKEYADPlayStatus];
    
    if ([isPlayFinish boolValue]) {
         NSLog(@"广告视频完整播放");
 
    }else{
          NSLog(@"广告视频播放被跳过");
    }
    
}

/**
 *   视频广告展示即将关闭
 *   注：当视频广告有成功点击跳转才被调用
 *  @param ADInfo 广告信息
 */
- (void)centrixLinkADWillCloseAD:(NSDictionary *)ADInfo
{
      NSLog(@"视频广告已被点击，广告页面即将关闭");

}
/**
 *   视频广告展示已关闭
 *
 *  @param ADInfo 视频广告信息，若播放广告错误则ADInfo包含error字段及错误信息
 */
 
- (void)centrixLinkADDidCloseAD:(NSDictionary *)ADInfo
{
    if ([ADInfo objectForKey:@"error"]) {
        NSLog(@"%@",[ADInfo objectForKey:@"error"]);
    }else{
        
        if ([[ADInfo objectForKey:ADInfoKEYIsClick] boolValue]) {
            NSString *message =  @"视频广告被点击";
            NSLog(@"%@",message);
        }else
        {
            NSString *message =  @"视频广告没有点击";
            NSLog(@"%@",message);

        }
        NSString *message =  [NSString stringWithFormat:@"centrixLinkADDidCloseAD %@", ADInfo ];
        NSLog(@"%@",message);
    }
}


```

#### 4.3 展示视频广告
    
```objc
/**
 *  用于是否展示非全屏视频广告开关
 */
UIKIT_EXTERN NSString *const ShowADOptionKeyInterstitialAD;

/**
 *  只播放预加载视频广告
 */
UIKIT_EXTERN NSString *const ShowADOptionKeyOnlyPreload;

/**
 * 自动关闭Endcard页面，true为视频广告自动关闭，false为手动关闭
 */
UIKIT_EXTERN NSString *const ShowADOptionKeyAutoCloseADView;

//只展示预加载视频广告
- (void)OnlyShowPreloadADClick:(id )sender {
    //当前是否可以展示视频广告
    CentrixlinkAD *manager = [CentrixlinkAD sharedInstance];
    NSError *error;

    if(manager.isShowableAD)
    {
 		if (manager.hasPreloadAD) {
 		   NSLog(@"当前存在有效的预加载视频广告");
  
         //是否只展示预加载视频广告,如果允许展示实时视频广告则为NO,推荐设置为只展示预加载视频广告
         BOOL isOnlyPreloadADShow = YES; 
         //视频广告非全屏展示，如全屏展示则为NO
         BOOL isInterstitialShow = YES;

         [manager showAD:self options:@{ShowADOptionKeyInterstitialAD:[NSNumber numberWithBool:isInterstitialShow],ShowADOptionKeyOnlyPreload:[NSNumber numberWithBool:isOnlyPreloadADShow]} error:&error];
         
        }else{
            NSLog(@"当前无有效的预加载视频广告");
        }
    }
  }
  
  //展示预加载及实时视频广告
  - (void)ADClick:(id )sender {
    //当前是否可以展示视频广告
    CentrixlinkAD *manager = [CentrixlinkAD sharedInstance];
    NSError *error;

    if(manager.isShowableAD)
    {
        //视频广告非全屏展示，如全屏展示则为NO
        BOOL isInterstitialShow = YES;
              
        [manager showAD:self options:@{ShowADOptionKeyInterstitialAD:[NSNumber numberWithBool:isInterstitialShow]} error:&error];

    }
  }
```
#### 4.4 非全屏视频广告位置自定义

```objc
/*
    当使用非全屏视频广告功能并自定义位置时可以在参数options中加入自定义的位置信息：
*/

//其中0.2、0.2、0.8分别表示距离上边距20%、左边距20%、最短边所占比例80%(最短边表示在竖屏模式下视频播放窗口宽度占屏幕宽的比例，横屏模式下视频播放窗口高度占屏幕高的比例)。
NSDictionary *positionDict = @{
                                       K_AD_INTERSTITIAL_TOP:@(0.2),
                                       K_AD_INTERSTITIAL_LEFT:@(0.2),
                                       K_AD_INTERSTITIAL_VIDEOSCALE:@(0.8)
                                       };

CentrixlinkAD *manager = [CentrixlinkAD sharedInstance];

[manager showAD:self options:@{ADInterstitialPosition:positionDict,ShowADOptionKeyOnlyPreload:[NSNumber numberWithBool:YES],ShowADOptionKeyInterstitialAD:[NSNumber numberWithBool:YES]} error:&error];
if (error) {
    NSLog(@"%@",error);            
}

```
#### 4.5 修改非全屏视频广告位置
```objc
/**
 调整非全屏视频广告的布局
 (注意：所有参数均为百分比，取值范围:[0 1])

 @param top 上边距
 @param left 左边距
 @param videoScale 短边占比(例如：在竖屏模式下，指的是视频播放窗口宽度占屏幕宽的比例，反之横屏模式下就是视频播放窗口高度占屏幕高的比例)
 */
- (BOOL)resizeInterstitialADWithTop:(float)top left:(float)left videoScale:(float)videoScale;

//可以通过该接口修改视频非全屏播放的位置信息，例如可以在监听手机转屏的方法中修改横屏和竖屏模式下非全屏展示的位置和比例。
- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context) {
        if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
            //横屏
            [[CentrixlinkAD sharedInstance] resizeInterstitialADWithTop:0 left:0 videoScale:1];
        }else {
            //竖屏
            [[CentrixlinkAD sharedInstance] resizeInterstitialADWithTop:0.2 left:0.2 videoScale:0.8];
        }
    } completion:nil];
}

```

### 5 开屏图片广告相关接口

#### 5.1 设置开屏图片广告代理委托及加载开屏图片广告

```objc
- (void)ShowSplash
{
    CentrixlinkAD *manager = [CentrixlinkAD sharedInstance];

    [manager setSplashADdelegate:self];
    [manager showSplashAD];
}

```
#### 5.2 跟踪开屏图片广告展示添加相关委托接口

```objc
/*
 *   开屏图片广告已经展示
 *   
 *  @param splashADInfo 开屏图片广告信息
 */
-(void)splashSuccessPresentScreen:(NSDictionary *)splashADInfo
{
    NSLog(@"splashSuccessPresentScreen %@",splashADInfo );

}

/*
 *   开屏图片广告已经关闭
 *   
 *  @param splashADInfo 开屏图片广告信息
 */
-(void)splashAdClosed:(NSDictionary *)splashADInfo
{
    NSLog(@"splashAdClosed %@",splashADInfo );
}

/*
 *   开屏图片广告已被点击
 *   
 *  @param splashADInfo 开屏图片广告信息
 */
-(void)splashAdClicked:(NSDictionary *)splashADInfo
{
    NSLog(@"splashAdClicked %@",splashADInfo );
}


/*
 *   展示开屏图片广告错误
 *   
 *  @param splashADInfo 开屏图片广告信息
 *  @param error 错误信息
 */
-(void)splashFailPresentScreen:(NSDictionary *)splashADInfo error:(NSError *)error
{
    NSLog(@"splashFailPresentScreen %@ error %@",splashADInfo,error );
}

```
