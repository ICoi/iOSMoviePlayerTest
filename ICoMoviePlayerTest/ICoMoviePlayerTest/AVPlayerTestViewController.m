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
#import <Foundation/Foundation.h>
#import <Foundation/NSKeyValueObserving.h>


#define MOVIE_URL @"http://image-aka.qpyou.cn/prvideo/test/360p/15s_summon.mp4"
@interface AVPlayerTestViewController ()
@property (strong, nonatomic) UITextView *leftTimeTV;
@property  CMTime movieDuration;
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

//    
//    // 방법 1.
//    //create an AVPlayer
    AVPlayer *player = [AVPlayer playerWithURL:url];
    
    // create a player view controller
    AVPlayerViewController *controller = [[AVPlayerViewController alloc] init];
    controller.showsPlaybackControls = false;
    controller.player = player;
    [player play];
    
    // show the view Controller
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
    controller.view.frame = self.view.frame;
    
    self.movieDuration = player.currentItem.asset.duration;
    
    
    self.leftTimeTV = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.leftTimeTV.text = @"";
    [controller.view addSubview:self.leftTimeTV];
    
    
    [player.currentItem.asset addObserver:self forKeyPath:@"duration" options:NSKeyValueObservingOptionNew context:@"12333"];
    
    // About CMTimeMake https://devpassya.wordpress.com/2012/09/26/cmtime-에-대한-이해/
    [player addPeriodicTimeObserverForInterval:CMTimeMake(1.0, 6.0) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        // TODO
//        NSLog(@"aaa %f", CMTimeGetSeconds(time));
        [self.leftTimeTV setText:[NSString stringWithFormat:@"%f / %f", CMTimeGetSeconds(time) , CMTimeGetSeconds(self.movieDuration)]];
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:[player currentItem]];
}


- (void)playerItemDidReachEnd:(NSNotification *)notification {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Video END" message:@"Video Play END" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
    [alert show];
}
@end
