//
//  AVPlayerViewController.m
//  ICoMoviePlayerTest
//
//  Created by 정다운 on 2017. 5. 16..
//  Copyright © 2017년 정다운. All rights reserved.
//
// http://pinkstone.co.uk/how-to-play-videos-in-ios-9/
// vhttp://www.childc.co.kr/295 -> 이거도 추가해서 해보기..


#import "AVPlayerTestViewController.h"
@import AVFoundation;
@import AVKit;


#define MOVIE_URL @"http://image-aka.qpyou.cn/prvideo/test/360p/15s_summon.mp4"
@interface AVPlayerTestViewController ()

@end

@implementation AVPlayerTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self playMovie];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 */



- (void)playMovie{
     NSURL *url = [NSURL URLWithString:MOVIE_URL];

    
    // 방법 1.
    //create an AVPlayer
    AVPlayer *player = [AVPlayer playerWithURL:url];
    
    // create a player view controller
    AVPlayerViewController *controller = [[AVPlayerViewController alloc] init];
    controller.player = player;
    [player play];
    
    // show the view Controller
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
    controller.view.frame = self.view.frame;
    
    
    
    // 방법 2. 이건 배경이 흰색으로.. 재생바 없이 나옴.. 왜?
//    AVAsset *avAsset = [AVAsset assetWithURL:url];
//    AVPlayerItem* avPlayerItem =[[AVPlayerItem alloc]initWithAsset:avAsset];
//    AVPlayer* avPlayer = [[AVPlayer alloc]initWithPlayerItem:avPlayerItem];
//    AVPlayerLayer *avPlayerLayer =[AVPlayerLayer playerLayerWithPlayer:avPlayer];
//    [avPlayerLayer setFrame:self.view.frame];
//    [self.view.layer addSublayer:avPlayerLayer];
//    //[avPlayerLayer setBackgroundColor:[[UIColor redColor]CGColor]];
//    [avPlayer seekToTime:kCMTimeZero];
//    [avPlayer play];
}

@end
