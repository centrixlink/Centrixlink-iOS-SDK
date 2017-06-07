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
@property (nonatomic, weak) IBOutlet UITextView *textView;
@property (nonatomic, weak) IBOutlet UIButton *resetButton;
@property (nonatomic, weak) IBOutlet UIButton *fullButton;
@property (nonatomic, weak) IBOutlet UIButton *interButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.interButton setEnabled:NO];
    [self.fullButton setEnabled:NO];

    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    [[CentrixlinkAD sharedInstance] setDelegate:self];
    
    [[CentrixlinkAD sharedInstance] setDebugCallBack:^(NSString *message, CLSLogLevel level) {
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


- (void)centrixLinkHasPreloadAD:(BOOL)hasPreload {
    [self.interButton setEnabled:hasPreload];
    [self.fullButton setEnabled:hasPreload];
    NSString *message =  [ NSString stringWithFormat:@"Preload Status %@ ", hasPreload?@"hasPreload": @"No Preload"];
    [self outputMessage:message];
}

- (void)centrixLinkVideoADWillShow:(NSDictionary *)ADInfo {
    NSString *message =  @" ***CallBack*** \n - (void)centrixLinkVideoADWillShow:(NSDictionary *)ADInfo \n";
    [self outputMessage:message];
    NSLog(@"%@", message);
}

- (void)centrixLinkVideoADDidShow:(NSDictionary *)ADInfo {
    NSString *message =  @" ***CallBack*** \n - (void)centrixLinkVideoADDidShow:(NSDictionary *)ADInfo \n";
    [self outputMessage:message];
    NSLog(@"%@", message);
    
}

- (void)centrixLinkVideoADClose:(NSDictionary *)ADInfo {
    NSString *message =  @" ***CallBack*** \n - (void)centrixLinkVideoADClose:(NSDictionary *)ADInfo \n";
    
    
    
    [self outputMessage:message];
    NSLog(@"%@", message);
}

- (void)centrixLinkVideoADAction:(NSDictionary *)ADInfo {
    NSString *message =  @" ***CallBack*** \n - (void)centrixLinkVideoADAction:(NSDictionary *)ADInfo \n";
    [self outputMessage:message];
    NSLog(@"%@", message);
}


- (void)centrixLinkVideoADShowFail:(NSError *)error {
    NSString *message =  [NSString stringWithFormat:@" ***CallBack*** \n - (void)centrixLinkVideoADShowFail:(NSError *)error %@\n", error];
    [self outputMessage:message];
    NSLog(@"%@", message);
}


- (IBAction)restCache {


}

-(IBAction)ADClick:(id)sender
{
    //当前是否可以显示广告
    CentrixlinkAD *manager = [CentrixlinkAD sharedInstance];
    NSError *error;
    if([manager hasPreloadAD])
    {
        //manager.hasPreloadAD可预先判断是否有有效预加载广告
        if (manager.hasPreloadAD) {
            [self outputMessage:@"当前存在有效的预加载广告"];
        }else{
            [self outputMessage:@"当前无有效的预加载广告"];
        }
        
        [manager playAD:self options:nil error:&error];
        if (error) {
            [self outputMessage:[error description]];
        }

    }else{
        [self outputMessage:@"广告没有准备好"];
    }
}

-(IBAction)interADClick:(id)sender
{
    
    //当前是否可以显示广告
    CentrixlinkAD *manager = [CentrixlinkAD sharedInstance];
    NSError *error;
    
    if([manager hasPreloadAD]) {
        //manager.hasPreloadAD可预先判断是否有有效预加载广告
        NSDictionary *positionDict = @{
                                       K_AD_RESIZEVIDEO_TOP:@(0.2),
                                       K_AD_RESIZEVIDEO_LEFT:@(0.2),
                                       K_AD_RESIZEVIDEO_VIDEOSCALE:@(0.8)
                                       };
        [manager playUnFullScreenAD:self options:@{ADRESIZEVIDEOPosition:positionDict} error:&error];
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



