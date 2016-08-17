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

- (void)centrixLinkADDidCloseAD:(NSDictionary *)ADInfo
{
    NSString *message =  [ NSString stringWithFormat:@"centrixLinkADDidCloseAD %@", ADInfo ];
    [self outputMessage:message];
}

- (IBAction)reopenActiveUser
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO] forKey:@"Centrixlink.firstLaunch"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self outputMessage:@"reopenActiveUser"];

}
- (IBAction)resetPreload:(id)sender{
    CentrixlinkAD *manager = [CentrixlinkAD sharedInstance];

    [manager resetPreloadCache];
    [self outputMessage:@"resetPreloadCache"];

}

-(IBAction)ADClick:(id)sender
{
    //当前是否可以显示广告
    CentrixlinkAD *manager = [CentrixlinkAD sharedInstance];
    NSError *error;
    if(manager.isShowableAD)
    {
         //插屏显示，如全屏显示则NO
        BOOL isInterstitialShow = YES;
        [manager showAD:self options:@{ShowADOptionKeyInterstitialAD:[NSNumber numberWithBool:isInterstitialShow]} error:&error];

        
    }else{
        [self outputMessage:@"广告没有准备好"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



