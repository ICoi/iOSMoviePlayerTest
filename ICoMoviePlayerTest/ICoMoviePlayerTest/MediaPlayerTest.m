//
//  MoviePlayerTest.m
//  ICoMoviePlayerTest
//
//  Created by 정다운 on 2017. 5. 16..
//  Copyright © 2017년 정다운. All rights reserved.
// https://mobiarch.wordpress.com/2014/01/31/playing-video-from-a-url-in-ios7/
#import "MediaPlayerTest.h"
#import <MediaPlayer/MediaPlayer.h>

#define MOVIE_URL @"http://image-aka.qpyou.cn/prvideo/test/360p/15s_summon.mp4"

@implementation MediaPlayerTest


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
    MPMoviePlayerController *controller = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    self.mc = controller;   // Super important
    controller.view.frame = self.view.bounds;
    
    [self.view addSubview:controller.view];     // Show the view
    [controller play];
}
@end
