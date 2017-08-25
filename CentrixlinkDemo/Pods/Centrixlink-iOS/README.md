# # Centrixlink-iOS-SDK

### 平台支持
iOS7+ 版本

### 准备工作

#### Cocoapods管理
Centrixlink iOS SDK可以通过Cocoapods工具自动操作完成。使用Cocoapods工具安装Centrixlink iOS SDK，只需在工程Podfile文件中添加以下代码并运行pod install命令即可。

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '7.0'

target 'TargetName' do
    pod 'Centrixlink-iOS', '~> 2.4.0'
end
```

#### 手动操作
1.  从官网下载[Centrixlink_iOS_SDK](https://github.com/centrixlink/Centrixlink-iOS-SDK)文件。
2.  解压缩Centrixlink框架(Centrixlink.embeddedframework/Cntrixlink.framework)，并添加到XCode项目中。
3.  添加以下依赖库:
 
	```
	   * AdSupport.framework
	   * AVFoundation.framework
	   * CFNetwork.framework
	   * Foundation.framework
	   * MediaPlayer.framework  
 	   * Storekit.framework
	   * CoreLocation.framework
	   * SystemConfiguration.framework
	   * UIKit.framework
	   * libz.dylib
	   * libsqlite3.dylib
	   * libstdc++.dylib
	```
4.  添加编译参数

   > 在Xcode中选择项目的Targets->Build Settings，配置Other Link Flags 增加 -ObjC -all_load
 
5. 状态栏控制设置

 > 打开项目的Info.plist，增加 "View controller-based status bar appearance" 选项，并设置为 "No".
   
   
6. 申请：[App ID、App Key](https://dashboard.centrixlink.com/login)

## 集成说明

### 1. 添加头文件 
* AppDelegate.h:

```objc
 #import <Centrixlink/Centrixlink.h>
```



### 2. 激活SDK

* AppDelegate.m:

```objc
- (BOOL)application:(UIApplication *)application 
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   //开启debug
    [[CentrixlinkAD sharedInstance] setDebugEnable:YES]; 
    //激活SDK
    NSError *error;
    
    NSString *  Default_App_ID = @"ECbUXI7E5l";
    NSString * Default_App_Key = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCq2c/yohc/9kWa0cfmMo1DTGM4rUmRyZ7WcKyhJZZNH8tiFY9i32FGMN8x4QT2hr2iiPfzizRkGfYoG+++9wAAWHhobu2cZ+dIcBTwayDFY4OJo6k592YFbyDa9mwuirgb0fRGtWY3WzvI5oaigZnv9EFjRVdr1omLk10azYNcwQIDAQAB";
    
    /* 实际开发中请务必使用自己申请的AppID 和 AppSecretKey */
    [[CentrixlinkAD sharedInstance] startWithAppID:Default_App_ID AppSecretKey:Default_App_Key error:&error];
        if(error){
           NSLog(@"start Error %@", error);
        }else{
           NSLog(@"start Success");
        }
}
```


### 3. 添加代码到展示视频广告的ViewController中

#### 3.1 添加代理
```objc
- (void)viewDidLoad{
  //设置代理（广告代理）
   [[CentrixlinkAD sharedInstance] setDelegate:self];
  }
```

#### 3.2 跟踪视频广告展示添加相关委托接口

```objc
/**
 *  广告adId
 */
UIKIT_EXTERN NSString *const ADInfoKEYADID;


/**
 *  视频广告播放状态，true为视频广告完整播放，false为视频广告非完整播放
 */
UIKIT_EXTERN NSString *const ADInfoKEYADPlayStatus;


/**
 * 视频广告是否被点击，true为点击，false为未点击
 */
UIKIT_EXTERN NSString *const ADInfoKEYIsClick;


#pragma mark ----CentrixlinkDelegate

-(void)centrixLinkHasPreloadAD:(BOOL)hasPreload {
    NSLog(@"视频预加载状态 %@",hasPreload? @"有预加载视频广告":@"无预加载视频广告");
}

/**
 *    视频广告即将展示
 *
 *  @param ADInfo 视频广告信息
 */
 
 
- (void)centrixLinkVideoADWillShow:(NSDictionary *)ADInfo {
    //广告资源ID
    NSString *adid = [ADInfo objectForKey:ADInfoKEYADID];
    NSLog(@"视频广告数据已经准备完毕，即将开始展示；请保存当前应用或游戏状态");
}


/**
 *   视频广告完成展示
 *
 *  @param ADInfo 视频广告信息
 */
- (void)centrixLinkVideoADDidShow:(NSDictionary *)ADInfo {
    //广告资源ID
    NSString *adid = [ADInfo objectForKey:ADInfoKEYADID];
    NSLog(@"视频广告页面已经展示");
}

/**
 *   视频广告展示已关闭
 *
 *  @param ADInfo 视频广告信息，若播放广告错误则ADInfo包含error字段及错误信息
 */
 
- (void)centrixLinkVideoADClose:(NSDictionary *)ADInfo {
    //广告资源ID
    NSString *adid = [ADInfo objectForKey:ADInfoKEYADID];
    //是否有点击事件
    BOOL isClick = [[ADInfo objectForKey:ADInfoKEYIsClick] boolValue];
    //是否完整播放
    BOOL isplayFinished = [ADInfo objectForKey:ADInfoKEYADPlayStatus];
    //详细信息
    NSLog(@"ADInfo: %@",ADInfo);
    
}

/**
 显示广告出错

 @param error 通过不同的error code区分不同的错误类型
 */
- (void)centrixLinkVideoADShowFail:(NSError *)error {
    NSLog(@"%@", error);
    /* code
    100	广告的播放间隔时间不满足条件
    101	本地没有可播放广告
    105	当前正在播放其它广告
    106	处于静默状态
    108	当前用户播放超限
    */
}


```

#### 3.3 展示视频广告
    
```objc
//只展示预加载视频广告
- (void)showPreloadAD:(id )sender {
    CentrixlinkAD *manager = [CentrixlinkAD sharedInstance];
    NSError *error = nil;
    //当前是否可以显示广告
    if([manager hasPreloadAD]) {
        [manager playAD:self options:nil error:&error];
        if (error) {
            //处理错误
            NSLog(@"%@", error);
        }
    }else{
        NSLog(@"当前无有效的预加载视频广告");
    }
  }
```
#### 3.4 非全屏视频广告位置自定义

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
//option:参数为NSDictionary,方便以后扩展参数。如果不穿options=nil,则非全屏视频广告为默认居中显示
[manager playUnFullScreenAD:self options:@{ADRESIZEVIDEOPosition:positionDict} error:&error];
if (error) {
    NSLog(@"%@",error);            
}

```
#### 3.5 修改非全屏视频广告位置
```objc
/**
 调整非全屏视频广告的布局
 (注意：所有参数均为百分比
       top\left取值范围:[0 1)
       videoScale取值范围:(0 1]

 @param top 上边距
 @param left 左边距
 @param videoScale 短边占比(例如：在竖屏模式下，指的是视频播放窗口宽度占屏幕宽的比例，反之横屏模式下就是视频播放窗口高度占屏幕高的比例)
 */
- (BOOL)resizeADWithTop:(float)top left:(float)left videoScale:(float)videoScale;

//可以通过该接口修改非全屏视频广告广告的位置信息，例如可以在监听手机转屏的方法中修改横屏和竖屏模式下非全屏展示的位置和比例。
- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context) {
        if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
            //横屏
            [[CentrixlinkAD sharedInstance] resizeADWithTop:0 left:0 videoScale:1];
        }else {
            //竖屏
            [[CentrixlinkAD sharedInstance] resizeADWithTop:0.2 left:0.2 videoScale:0.8];
        }
    } completion:nil];
}

```

#### 3.6 设置视频广告显示方向是否跟随应用方向

```objc
/**
 设置视频广告显示方向是否跟随应用方向(YES:跟随应用方向、NO:不跟随)

 @param enable default = NO;
 */
- (void)setEnableFollowAppOrientation:(BOOL)enable;
```

### 4 开屏图片广告相关接口

#### 4.1 设置开屏图片广告代理委托及加载开屏图片广告

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //在激活SDK后，调用开屏。
    
    //设置开屏代理
    [[CentrixlinkAD sharedInstance] setSplashADdelegate:self];
    //显示开屏
    [[CentrixlinkAD sharedInstance] playSplashAD];
}

```
#### 4.2 跟踪开屏图片广告展示添加相关委托接口

```objc
/**
 开屏广告关闭

 @param info
 */
- (void)centrixlinkSplashADClosed:(NSDictionary *)info {
    //广告资源ID
    NSString *adid = [info objectForKey:ADInfoKEYADID];
    //是否有点击事件
    BOOL isClick = [[info objectForKey:ADInfoKEYIsClick] boolValue];
    //是否跳过
    BOOL isSkip = [[info objectForKey:ADInfoKEYIsSkip] boolValue];
    //是否完整播放
    BOOL isplayFinished = [info objectForKey:ADInfoKEYADPlayStatus];
}


/**
 开屏广告显示成功

 @param info
 */
- (void)centrixlinkSplashADDidShow:(NSDictionary *)info {
    //广告资源ID
    NSString *adid = [info objectForKey:ADInfoKEYADID];
}


/**
 开屏广告跳过

 @param info
 */
- (void)centrixlinkSplashADSkip:(NSDictionary *)info {
    //广告资源ID
    NSString *adid = [info objectForKey:ADInfoKEYADID];
}


/**
 开屏广告触发了action事件

 @param info
 */
- (void)centrixlinkSplashADAction:(NSDictionary *)info {
    //广告资源ID
    NSString *adid = [info objectForKey:ADInfoKEYADID];
}


/**
 开屏广告显示失败

 @param error 不同的error code对于不同的错误信息
 */
- (void)centrixlinkSplashADShowFail:(NSError *)error {
    /*  Error Code
        201 本地没有预加载的开屏广告
    */
}

```


