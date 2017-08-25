//
//  ViewController.m
//  CentrixlinkDemo
//
//  Created by 王俊拯 on 16/8/12.
//  Copyright © 2016年 Centrixlink. All rights reserved.
//

#import "ViewController.h"
#import <Centrixlink/Centrixlink.h>
#import "AppDelegate.h"
@interface ViewController ()<CentrixLinkADDelegate>

@property (nonatomic, weak) IBOutlet UIButton *resetButton;
@property (nonatomic, weak) IBOutlet UIButton *fullButton;
@property (nonatomic, weak) IBOutlet UIButton *interButton;
@property (weak, nonatomic) IBOutlet UITextField *appIDTextField;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *appKeyTextField;

@end






@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.interButton setEnabled:NO];
    [self.fullButton setEnabled:NO];

    
    extern NSString *App_ID;
    extern NSString *Default_App_ID;
    NSString *appId = [[NSUserDefaults standardUserDefaults] objectForKey:App_ID];
    if ([appId isEqualToString:Default_App_ID]) {
        self.label.text = @"当前正在使用: 默认AppID & AppKey";
    }else {
        self.label.text = @"当前正在使用: Yout AppID & AppKey";
    }
    
    
    [[CentrixlinkAD sharedInstance] setDelegate:self];
    
    [[CentrixlinkAD sharedInstance] setDebugCallBack:^(NSString *message, CLSLogLevel level) {
        [self outputMessage:message];
    }];
}


-(void)outputMessage:(NSString *)message {
   
}

#pragma mark ----CentrixlinkDelegate


- (void)centrixLinkHasPreloadAD:(BOOL)hasPreload {
    [self.interButton setEnabled:hasPreload];
    [self.fullButton setEnabled:hasPreload];
    NSString *message =  [ NSString stringWithFormat:@"Preload Status %@ ", hasPreload?@"hasPreload": @"No Preload"];
//    [self outputMessage:message];
    NSLog(@"%@", message);
}

- (void)centrixLinkVideoADWillShow:(NSDictionary *)ADInfo {
    NSString *message =  @" ***CallBack*** \n - (void)centrixLinkVideoADWillShow:(NSDictionary *)ADInfo \n";
//    [self outputMessage:message];
    NSLog(@"%@", message);
}

- (void)centrixLinkVideoADDidShow:(NSDictionary *)ADInfo {
    NSString *message =  @" ***CallBack*** \n - (void)centrixLinkVideoADDidShow:(NSDictionary *)ADInfo \n";
//    [self outputMessage:message];
    NSLog(@"%@", message);
    
}

- (void)centrixLinkVideoADClose:(NSDictionary *)ADInfo {
    NSString *message =  @" ***CallBack*** \n - (void)centrixLinkVideoADClose:(NSDictionary *)ADInfo \n";
//    [self outputMessage:message];
    NSLog(@"%@", message);
    
    NSLog(@"close-ADInfo = %@", ADInfo);
}

- (void)centrixLinkVideoADAction:(NSDictionary *)ADInfo {
    NSString *message =  @" ***CallBack*** \n - (void)centrixLinkVideoADAction:(NSDictionary *)ADInfo \n";
//    [self outputMessage:message];
    NSLog(@"%@", message);
}


- (void)centrixLinkVideoADShowFail:(NSError *)error {
    NSString *message =  [NSString stringWithFormat:@" ***CallBack*** \n - (void)centrixLinkVideoADShowFail:(NSError *)error %@\n", error];
//    [self outputMessage:message];
    NSLog(@"%@", message);
}


- (IBAction)localList:(id)sender {
    
}

-(IBAction)ADClick:(id)sender
{
    //当前是否可以显示广告
    CentrixlinkAD *manager = [CentrixlinkAD sharedInstance];
    NSError *error;
    if([manager hasPreloadAD]) {
        //manager.hasPreloadAD可预先判断是否有有效预加载广告
        [manager playAD:self options:nil error:&error];
        if (error) {
            [self outputMessage:[error description]];
        }

    }else{
        [self outputMessage:@"广告没有准备好"];
    }
}

-(IBAction)interADClick:(id)sender {
    
}


- (IBAction)userAppIdAction:(id)sender {
    extern NSString *App_ID;
    extern NSString *App_Key;
    
    NSString *appId = self.appIDTextField.text;
    NSString *appKey = self.appKeyTextField.text;
    if (appId.length && appKey.length) {
        
        self.label.text = @"当前正在使用: Yout AppID & AppKey";
        
        [[NSUserDefaults standardUserDefaults] setObject:appId forKey:App_ID];
        [[NSUserDefaults standardUserDefaults] setObject:appKey forKey:App_Key];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [[CentrixlinkAD sharedInstance] startWithAppID:appId AppSecretKey:appKey error:nil];
        
    }else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"appID Or appKey error" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
        [alertView show];
    }
}

- (IBAction)defaultAppIdAction:(id)sender {
    
    extern NSString *App_ID;
    extern NSString *App_Key;

    extern NSString *Default_App_ID;
    extern NSString *Default_App_Key;
    
    self.label.text = @"当前正在使用: 默认AppID & AppKey";
    
    [[NSUserDefaults standardUserDefaults] setObject:Default_App_ID forKey:App_ID];
    [[NSUserDefaults standardUserDefaults] setObject:Default_App_Key forKey:App_Key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[CentrixlinkAD sharedInstance] startWithAppID:Default_App_ID AppSecretKey:Default_App_Key error:nil];
    
}





- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end



