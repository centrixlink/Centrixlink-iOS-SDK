# Centrixlink-iOS-SDK

## 平台支持
iOS7+ 版本

#准备工作

## 自动操作
Centrixlink iOS SDK可以通过Cocoapods工具自动操作完成。使用Cocoapods工具安装Centrixlink iOS SDK，只需在工程Podfile文件中添加以下一行代码并重新运行pod install命令即可。

> pod 'Centrixlink-iOS', '~> 1.0'

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



##已支持HTTPS,无需ATS Support操作

~~## IOS9 ATS Support~~

~~在Info.plist中添加以下字段~~

```
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
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

- (void)centrixLinkADVideoDidPlayStatus:(NSDictionary *)ADInfo
{
  
    
     NSNumber *isPlayFinish= [ADInfo objectForKey:ADInfoKEYADPlayStatus];
    
    if ([isPlayFinish boolValue]) {
         NSLog(@"广告视频完整播放")
 
    }else{
          NSLog(@"广告视频播放被跳过")
    }
    
}


- (void)centrixLinkADWillCloseAD:(NSDictionary *)ADInfo
{
      NSLog(@"广告已被点击，广告页面即将关闭")

}

- (void)centrixLinkADDidCloseAD:(NSDictionary *)ADInfo
{
    NSLog(@"广告页面关闭")
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
