//
//  ViewController.m
//  CentrixlinkDemo
//
//  Created by 王俊拯 on 16/8/12.
//  Copyright © 2016年 Centrixlink. All rights reserved.
//

#import "ViewController.h"
#import <Centrixlink/Centrixlink.h>
@interface ViewController ()<CentrixLinkADDelegate>
@property (nonatomic, weak) IBOutlet UITextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self outputMessage:@""];
    [[CentrixlinkAD sharedInstance] setDelegate:self];
    [[CentrixlinkAD sharedInstance] setDebugBlock:^(NSString *message, CLSLogLevel level) {
    
        [self outputMessage:message];

    }];
}


-(void)outputMessage:(NSString *)message
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.textView setEditable:YES];
        NSString *str = [message stringByAppendingString:@"\n----------\n"];
        [self.textView  setText:[[_textView text] stringByAppendingString:str]];
        [self.textView  setEditable:NO];
        [self.textView scrollRangeToVisible:NSMakeRange([[_textView text] length], 0)];

    });
}


#pragma mark ----CentrixlinkDelegate

- (void)centrixLinkADDidShowAD:(NSDictionary *)ADInfo
{
   NSString *message =  [ NSString stringWithFormat:@"centrixLinkADDidShowAD %@", ADInfo ];
    
    [self outputMessage:message];
}

- (void)centrixLinkADWillShowAD:(NSDictionary *)ADInfo
{
    NSString *message =  [ NSString stringWithFormat:@"centrixLinkADWillShowAD %@", ADInfo ];

    [self outputMessage:message];

}

- (void)centrixLinkADWillCloseAD:(NSDictionary *)ADInfo
{
    
    NSString *message =  [ NSString stringWithFormat:@"centrixLinkADWillCloseAD %@", ADInfo ];
    [self outputMessage:message];
}


- (void)centrixLinkADVideoDidPlayStatus:(NSDictionary *)ADInfo
{
    NSNumber *isPlayFinish= [ADInfo objectForKey:ADInfoKEYADPlayStatus];
    
    if ([isPlayFinish boolValue]) {
        [self outputMessage:[NSString stringWithFormat:@"广告 ID:%@ 完整播放",[ADInfo objectForKey:ADInfoKEYADID]]];
        
    }else{
        
        [self outputMessage:[NSString stringWithFormat:@"广告 ID:%@ 跳过播放",[ADInfo objectForKey:ADInfoKEYADID]]];
        
    }
    
    NSString *message =  [ NSString stringWithFormat:@"centrixLinkADVideoPlayFinishedAD %@", ADInfo ];
    
    [self outputMessage:message];
    
}

- (void)centrixLinkADDidCloseAD:(NSDictionary *)ADInfo
{
    if ([ADInfo objectForKey:@"error"]) {
        
        [self outputMessage:[ADInfo objectForKey:@"error"]];
    }else{
        NSString *message =  [ NSString stringWithFormat:@"centrixLinkADDidCloseAD %@", ADInfo ];
        [self outputMessage:message];
    }
 }

- (IBAction)reopenActiveUser
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO] forKey:@"Centrixlink.firstLaunch"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self outputMessage:@"reopenActiveUser"];

}

-(IBAction)ADClick:(id)sender
{
    
    //当前是否可以显示广告
    CentrixlinkAD *manager = [CentrixlinkAD sharedInstance];
    NSError *error;

    if(manager.isShowableAD)
    {
        //manager.hasPreloadAD可预先判断是否有有效预加载广告
        if (manager.hasPreloadAD) {
            [self outputMessage:@"当前存在有效的预加载广告"];
        }else{
            [self outputMessage:@"当前无有效的预加载广告"];
        }

         //插屏显示，如全屏显示则NO
        BOOL isInterstitialShow = NO;
        
        //是否只显示预加载广告,如果允许显示实时广告则为NO
        BOOL isOnlyPreloadADShow = YES;
        
        [manager showAD:self options:@{ShowADOptionKeyInterstitialAD:[NSNumber numberWithBool:isInterstitialShow],ShowADOptionKeyOnlyPreload:[NSNumber numberWithBool:isOnlyPreloadADShow]} error:&error];
        if (error) {
            [self outputMessage:[error description]];
        }

    }else{
        [self outputMessage:@"广告没有准备好"];
    }
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end



