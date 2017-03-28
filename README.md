# Centrixlink-iOS-SDK

## 平台支持
iOS7+ 版本


#### CHANGELOG
##### 2.0.161-20170328
* 增加开屏广告支持
* 优化广告加载逻辑


##### 1.2.136-20170306
* 优化Preload逻辑
* 增加预加载状态回调

##### 1.1.81-20161108
* 优化视频声音静音逻辑


# 准备工作

## 自动操作
Centrixlink iOS SDK可以通过Cocoapods工具自动操作完成。使用Cocoapods工具安装Centrixlink iOS SDK，只需在工程Podfile文件中添加以下一行代码并重新运行pod install命令即可。

> pod 'Centrixlink-iOS', '~> 2.0'

## 手动操作
1.  从官网下载Centrixlink_iOS_SDK.zip文件;
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

   >在Xcode中选择项目的Targets->Build Settings，配置Other Link Flags 增加 -ObjC



# 添加集成需要的代码

### 1. 添加头文件 
* AppDelegate.h:
```objc
 #import <Centrixlink/Centrixlink.h>
```

### 2. 如开启后台下载添加如下代码
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


###  4. 添加如下代码到示视频显广告的ViewController中

#### 4.1 添加代理
```objc
- (void)viewDidLoad{
  //设置代理
   [[CentrixlinkAD sharedInstance] setDelegate:self];
  }
```

#### 4.2 跟踪视频广告显示添加相关委托接口

```objc
#pragma mark ----CentrixlinkDelegate

-(void)centrixLinkADPreloadADStatusChange:(BOOL)hasPreload
{
    NSLog(@"预加载状态 %@",hasPreload? @"有预加载广告":@"无预加载广告");
}

/**
 *    视频广告即将显示
 *
 *  @param ADInfo 广告信息
 */
 
 
- (void)centrixLinkADWillShowAD:(NSDictionary *)ADInfo
{
      NSLog(@"视频广告数据已经准备完毕，即将开始显示；请保存当前应用或游戏状态");
}



/**
 *   视频广告完成显示
 *
 *  @param ADInfo 广告信息
 */
- (void)centrixLinkADDidShowAD:(NSDictionary *)ADInfo
{
      NSLog(@"视频广告页面已经显示");
}



/**
 *   视频广告视频播放完毕状态
 *
 *  @param ADInfo 广告信息
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
 *   视频广告显示即将关闭
 *   注：当广告有成功点击跳转才被调用
 *  @param ADInfo 广告信息
 */
- (void)centrixLinkADWillCloseAD:(NSDictionary *)ADInfo
{
      NSLog(@"广告已被点击，广告页面即将关闭");

}
/**
 *   广告显示已关闭
 *
 *  @param ADInfo 视频广告信息，若播放广告错误则ADInfo包含error字段及错误信息
 */
 
- (void)centrixLinkADDidCloseAD:(NSDictionary *)ADInfo
{

 	if ([ADInfo objectForKey:@"error"]) {
        NSLog(@"播放广告错误 Error:%@",[ADInfo objectForKey:@"error"]);
    }
    
    NSLog(@"广告页面已经关闭，请恢复应用或游戏状态");

}


```

#### 4.3 显示视频广告
    
```objc

//只显示预加载广告
- (void)OnlyShowPreloadADClick:(id )sender {
    //当前是否可以显示广告
    CentrixlinkAD *manager = [CentrixlinkAD sharedInstance];
    NSError *error;

    if(manager.isShowableAD)
    {
 		if (manager.hasPreloadAD) {
 		   NSLog(@"当前存在有效的预加载视频广告");
  
         //是否只显示预加载广告,如果允许显示实时广告则为NO,推荐设置为只显示预加载广告
         BOOL isOnlyPreloadADShow = YES; 
         //插屏显示，如全屏显示则NO
         BOOL isInterstitialShow = YES;

         [manager showAD:self options:@{ShowADOptionKeyInterstitialAD:[NSNumber numberWithBool:isInterstitialShow],ShowADOptionKeyOnlyPreload:[NSNumber numberWithBool:isOnlyPreloadADShow]} error:&error];
         
        }else{
            NSLog(@"当前无有效的预加载视频广告");
        }
    }
  }
  
  //显示预加载及实时视频广告
  - (void)ADClick:(id )sender {
    //当前是否可以显示广告
    CentrixlinkAD *manager = [CentrixlinkAD sharedInstance];
    NSError *error;

    if(manager.isShowableAD)
    {
 		 //插屏显示，如全屏显示则NO
        BOOL isInterstitialShow = YES;
              
        [manager showAD:self options:@{ShowADOptionKeyInterstitialAD:[NSNumber numberWithBool:isInterstitialShow]} error:&error];

    }
  }
```
### 5 开屏广告相关接口

#### 5.1 设置开屏广告代理委托及加载开屏广告

```objc
- (void)ShowSplash
{
    CentrixlinkAD *manager = [CentrixlinkAD sharedInstance];

    [manager setSplashADdelegate:self];
    [manager showSplashAD];
}

```
#### 5.2 跟踪开屏广告显示添加相关委托接口

```objc
/*
 *   开屏广告已经显示
 *   
 *  @param splashADInfo 广告信息
 */
-(void)splashSuccessPresentScreen:(NSDictionary *)splashADInfo
{
    NSLog(@"splashSuccessPresentScreen %@",splashADInfo );

}

/*
 *   开屏广告已经关闭
 *   
 *  @param splashADInfo 广告信息
 */
-(void)splashAdClosed:(NSDictionary *)splashADInfo
{
    NSLog(@"splashAdClosed %@",splashADInfo );
}

/*
 *   开屏广告已被点击
 *   
 *  @param splashADInfo 广告信息
 */
-(void)splashAdClicked:(NSDictionary *)splashADInfo
{
    NSLog(@"splashAdClicked %@",splashADInfo );
}


/*
 *   显示开屏广告错误
 *   
 *  @param splashADInfo 广告信息
 *  @param error 错误信息
 */
-(void)splashFailPresentScreen:(NSDictionary *)splashADInfo error:(NSError *)error
{
    NSLog(@"splashFailPresentScreen %@ error %@",splashADInfo,error );
}


```

