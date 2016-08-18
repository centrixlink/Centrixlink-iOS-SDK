# Centrixlink-iOS-SDK

# 平台支持
iOS iOS7+ 版本

#准备工作
## Cocoapods
The Centrixlink iOS SDK can also be installed via Cocoapods. To install the Centrixlink iOS SDK via Cocoapods add the following line to your Podfile and re-run the pod install command:

> pod 'Centrixlink-iOS', '~> 1.0'

## Manual
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

###  4. 添加如下代码到显示广告的ViewController中

#### 4.1 添加代理
```objc
- (void)viewDidLoad{
  //设置代理
  [[CentrixlinkAD sharedInstance] setDelegate:self];
  }
```

#### 4.2 跟踪广告显示添加相关委托接口

```objc
#pragma mark ----CentrixlinkDelegate

- (void)centrixLinkADDidShowAD:(NSDictionary *)ADInfo
{
    
}


- (void)centrixLinkADWillShowAD:(NSDictionary *)ADInfo
{
    
}


- (void)centrixLinkADWillCloseAD:(NSDictionary *)ADInfo
{
    
}

- (void)centrixLinkADDidCloseAD:(NSDictionary *)ADInfo
{
    
}


```

#### 4.3 显示广告
    
```objc
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
