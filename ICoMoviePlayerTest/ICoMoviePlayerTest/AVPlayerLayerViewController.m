//
//  AVPlayerLayerViewController.m
//  ICoMoviePlayerTest
//
//  Created by 정다운 on 2017. 5. 18..
//  Copyright © 2017년 정다운. All rights reserved.
//

#import "AVPlayerLayerViewController.h"
#import <AVFoundation/AVFoundation.h>

#define MOVIE_URL @"http://image-aka.qpyou.cn/prvideo/test/360p/15s_summon.mp4"

@interface AVPlayerLayerViewController ()

@end

@implementation AVPlayerLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showVideo];
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

- (void)showVideo{
    NSURL *url = [NSURL URLWithString:MOVIE_URL];
    
    UIView *playerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    playerView.backgroundColor = [UIColor blackColor];
    {
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
        AVPlayer *avPlayer = [AVPlayer playerWithPlayerItem:playerItem];
        {
            AVPlayerLayer *avPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:avPlayer];
            avPlayerLayer.frame = CGRectMake(0, 0, 320, 480);
            avPlayerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
            [playerView.layer addSublayer:avPlayerLayer];
            [self.view addSubview:playerView];
            
            
            [avPlayer play];
        }
        avPlayer.actionAtItemEnd = AVPlayerActionAtItemEndNone;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:[avPlayer currentItem]];
    }
}

- (void)playerItemDidReachEnd:(NSNotification *)notification {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Video END" message:@"Video Play END" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
    [alert show];
}

@end
