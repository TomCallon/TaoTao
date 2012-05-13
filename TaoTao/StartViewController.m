//
//  StartViewController.m
//  TaoTao
//
//  Created by Tom Callon (Hotmail) on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StartViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface StartViewController ()

@end

@implementation StartViewController
////Systems
@synthesize startReadingButton =_startReadingButton;
@synthesize myVacabulariesButton =_myVacabulariesButton;
@synthesize settingsButton =_settingsButton;
@synthesize aboutUsButton =_aboutUsButton;

////Animals
@synthesize tigerButon =_tigerButton;
@synthesize girafeButton =_giraffeButton;
@synthesize elephantButton =_elephantButton;
@synthesize monkeyButton =_monkeyButton;

///environments
@synthesize taotaoButton =_taotaoButton;
@synthesize cloudOneButton =_cloudOneButton;
@synthesize cloudTwoButton =_cloudTwoButton;
@synthesize cloudThreeButton =_cloudThreeButton;



@synthesize audioPlayer = _audioPlayer;
@synthesize backgroundMusicPlayer =_backgroundMusicPlayer;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)dealloc{
    [super dealloc];
    ///menue
    [_settingsButton release];
    [_myVacabulariesButton release];
    [_startReadingButton release];
    [_aboutUsButton release];
    
    //animals
    [_tigerButton release];
    [_giraffeButton release];
    [_elephantButton release];
    [_monkeyButton release];
    [_taotaoButton release];
    
    [_cloudOneButton release];
    [_cloudTwoButton release];
    [_cloudThreeButton release];

}

-(void)viewWillAppear:(BOOL)animated{
    
    [self addAllSystemTheButtons]; 
    [self showMenu];
    [self showAnimals];
    [self showEnvironments];
    [self playBackgroundMusic];

//    [self retateButton:_aboutUsButton];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    UIImage *background = [UIImage imageNamed:@"background.png"];
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithImage:background];
    
    
    CGRect  iPadFrame   = CGRectMake(0, 0, 1024, 768);
    CGRect  iPhoneFrame = CGRectMake(0, 0, 480, 320);
    CGRect  iOSFrame;
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
        iOSFrame = iPadFrame;
    }else {
        iOSFrame = iPhoneFrame;
    };

    [backgroundImageView setFrame:iOSFrame];
    [self.view insertSubview:backgroundImageView atIndex:0];
    [backgroundImageView release];
    
    ////play background Musics
    [self playBackgroundMusic];
    

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
    //
    [self setStartReadingButton:nil];
    [self setSettingsButton:nil];
    [self setAboutUsButton:nil];
    [self setMyVacabulariesButton:nil];
    
       
    [self setTigerButon:nil];
    [self setGirafeButton:nil];
    [self setElephantButton:nil];
    [self setMonkeyButton:nil];
    
    
    [self setCloudOneButton:nil];
    [self setCloudTwoButton:nil];
    [self setCloudThreeButton:nil];
     
    
}


- (void)addAnimationToMenuButton:(UIButton *)button
{
    CABasicAnimation *fallButtonAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    [fallButtonAnimation setDuration:2];
    [fallButtonAnimation setFromValue:[NSValue valueWithCGPoint:CGPointMake(160, 
                                                                            -20-button.center.y)]];
    [fallButtonAnimation setToValue:[NSValue valueWithCGPoint:button.center]];
    [fallButtonAnimation setFillMode:kCAFillModeForwards];
    [fallButtonAnimation setRemovedOnCompletion:NO];    
    fallButtonAnimation.delegate = self;
    
    CABasicAnimation *stayButtonAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    [stayButtonAnimation setDuration:2];
    [stayButtonAnimation setFromValue:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.4, 0, 0, 1)]];
    [stayButtonAnimation setToValue:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.4, 0, 0, 1)]];
    
    CABasicAnimation *rotateButton = [CABasicAnimation animationWithKeyPath:@"transform"];
    [rotateButton setDuration:1.2];
    [rotateButton setFromValue:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(-0.1, 0, 0, 1)]];
    [rotateButton setToValue:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.3, 0, 0, 1)]];
    [rotateButton setAutoreverses:YES];
    [rotateButton setRepeatCount:10000];
    [rotateButton setRemovedOnCompletion:YES]; 
    [rotateButton setBeginTime:CACurrentMediaTime() + 2];
    
    
    [button.layer removeAllAnimations];
    [button.layer addAnimation:rotateButton forKey:@"rotateButton"];
    [button.layer addAnimation:fallButtonAnimation forKey:@"fallButton"];
    [button.layer addAnimation:stayButtonAnimation forKey:@"stayButton"];
}

- (void)addAnimationToAnimalsButton:(UIButton *)button{

    
    CABasicAnimation *fallButtonAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    [fallButtonAnimation setDuration:2];
    [fallButtonAnimation setFromValue:[NSValue valueWithCGPoint:CGPointMake(160, 
                                                                            -20-button.center.y + 900)]];
    [fallButtonAnimation setToValue:[NSValue valueWithCGPoint:button.center]];
    [fallButtonAnimation setFillMode:kCAFillModeForwards];
    [fallButtonAnimation setRemovedOnCompletion:NO];    
    fallButtonAnimation.delegate = self;
    
    CABasicAnimation *stayButtonAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    [stayButtonAnimation setDuration:2];
    [stayButtonAnimation setFromValue:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.4, 0, 0, 1)]];
    [stayButtonAnimation setToValue:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.4, 0, 0, 1)]];
    
    CABasicAnimation *rotateButton = [CABasicAnimation animationWithKeyPath:@"transform"];
    [rotateButton setDuration:1.2];
    [rotateButton setFromValue:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(-0.1, 0, 0, 1)]];
    [rotateButton setToValue:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.1, 0, 0, 1)]];
    [rotateButton setAutoreverses:YES];
    [rotateButton setRepeatCount:10000];
    [rotateButton setRemovedOnCompletion:YES]; 
    [rotateButton setBeginTime:CACurrentMediaTime() + 2];
    
    
    [button.layer removeAllAnimations];
    [button.layer addAnimation:rotateButton forKey:@"rotateButton"];
    [button.layer addAnimation:fallButtonAnimation forKey:@"fallButton"];
    [button.layer addAnimation:stayButtonAnimation forKey:@"stayButton"];



}


-(void)retateButton :(UIButton *)button{
    
    CABasicAnimation *rotateButton = [CABasicAnimation animationWithKeyPath:@"transform"];
    [rotateButton setDuration:0.2];
    [rotateButton setFromValue:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(-0.1, 0, 0, 1)]];
    [rotateButton setToValue:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.1, 0, 0, 1)]];
    [rotateButton setAutoreverses:YES];
    [rotateButton setRepeatCount:1000000];
    [rotateButton setRemovedOnCompletion:YES]; 
    [rotateButton setBeginTime:CACurrentMediaTime() + 1];
    
    
    [button.layer removeAllAnimations];
    [button.layer addAnimation:rotateButton forKey:@"rotateButton"];
    
}


-(void)moveButton:(UIButton *)button{
    
    CABasicAnimation *fallButtonAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    [fallButtonAnimation setDuration:20];
    [fallButtonAnimation setFromValue:[NSValue valueWithCGPoint:CGPointMake(0, 0)]];
    [fallButtonAnimation setToValue:[NSValue valueWithCGPoint:button.center]];
    [fallButtonAnimation setFillMode:kCAFillModeForwards];
    [fallButtonAnimation setRemovedOnCompletion:NO];    
    fallButtonAnimation.delegate = self;
    [fallButtonAnimation setRepeatCount :1000000];
    
    
    [button.layer removeAllAnimations];
    [button.layer addAnimation:fallButtonAnimation forKey:@"position"];
    
    
}



- (void)showMenu
{
    [self addAnimationToMenuButton:_startReadingButton];
    [self addAnimationToMenuButton:_myVacabulariesButton];
    [self addAnimationToMenuButton:_settingsButton];
    [self addAnimationToMenuButton:_aboutUsButton];
    
}

-(void)showAnimals{
    
    ////show 
    [self addAnimationToAnimalsButton:_elephantButton];
    [self addAnimationToAnimalsButton:_tigerButton];
    [self addAnimationToAnimalsButton:_giraffeButton];
    [self addAnimationToAnimalsButton:_monkeyButton];
    [self addAnimationToAnimalsButton:_taotaoButton];

}

-(void)showEnvironments{
    
    ////show 
    [self moveButton:_cloudOneButton];
    [self moveButton:_cloudTwoButton];
    [self moveButton:_cloudThreeButton];
    
    
   
    

    
    
}



-(void)removeAllTheButtons{

    [_startReadingButton removeFromSuperview];
    [_myVacabulariesButton removeFromSuperview];
    [_settingsButton removeFromSuperview];
    [_aboutUsButton removeFromSuperview];

}

-(void)addAllSystemTheButtons{
    
    [self.view addSubview:_startReadingButton];
    [self.view addSubview:_settingsButton];
    [self.view addSubview:_myVacabulariesButton];
    [self.view addSubview:_aboutUsButton];
    
}

-(void)removeAllTheEnvironmentButton{
    
    [_cloudTwoButton removeFromSuperview];
    [_cloudOneButton removeFromSuperview];
    [_cloudThreeButton removeFromSuperview];

}


-(void)pauseAllTheAudion{
    [self.backgroundMusicPlayer pause];
    [self.audioPlayer pause];
}


- (IBAction)startReadingButton:(id)sender {
    [self pauseAllTheAudion];
    [self removeAllTheButtons];
    [self performSegueWithIdentifier:@"startViewSegue" sender:self];
}

- (IBAction)myVacabulariesButton:(id)sender {
    [self pauseAllTheAudion];
    [self removeAllTheButtons];
    [self performSegueWithIdentifier:@"ILearnSegue" sender:self];

}

- (IBAction)settingsButton:(id)sender {
    [self pauseAllTheAudion];
    [self removeAllTheButtons];
    [self performSegueWithIdentifier:@"SettingsSegue" sender:self];
}

- (IBAction)aboutUsButton:(id)sender {
    [self pauseAllTheAudion];
    [self removeAllTheButtons];
    [self performSegueWithIdentifier:@"AboutUsSegue" sender:self];
}


- (IBAction)animalsButton:(id)sender {
    
    UIButton *animalButton =(UIButton *)sender;
    
    NSInteger ANIMALS ;
    enum ANIMALS {
        elephantButton = 1,
        tigerButton,
        giraffeButton,
        monkeyButton,
        taotaoButton
    };
    
    ANIMALS =  [animalButton  tag];
    
    switch ( ANIMALS) {
        case elephantButton:
            NSLog(@"I AM A ELEPHANT");
            [self  PlayAudio:@"elephant"];
            break;
        case tigerButton:
            NSLog(@"I AM A TIGER");
            [self PlayAudio: @"tiger"];

            break;
        case giraffeButton:
            NSLog(@"I AM A GIRAFFE");
            [self PlayAudio:@"giraffe"];

            break;
        case monkeyButton:
            NSLog(@"I AM A MONKEY");
            [self PlayAudio :@"monkey"];
        case taotaoButton:
            NSLog(@"I AM A TAOTAO");
            [self PlayAudio :@"penguin"];
            break;
        default:
            break;
    }        
}


- (void )PlayAudio: (NSString *)who{
    
	NSString *musicPath = [[NSBundle mainBundle] pathForResource:who ofType:@"mp3"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:musicPath];
    
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    // 创建播放器
    self.audioPlayer= player; //赋值给自己定义的类变量
    [url release];
    [player release];
    
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer setVolume:9];
    self.audioPlayer.numberOfLoops = 0; //设置音乐播放次数  -1为一直循环
//    if(mainMusicStatus)
//    {
//        [myBackMusic play]; //播放
//    }
    
    [self.audioPlayer play];

}

-(void)playBackgroundMusic {
    
    
    NSString *musicPath = [[NSBundle mainBundle] pathForResource:@"background" ofType:@"mp3"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath:musicPath];
    
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    // 创建播放器
    self.backgroundMusicPlayer= player; //赋值给自己定义的类变量
    [url release];
    [player release];
    
    [self.backgroundMusicPlayer prepareToPlay];
    [self.backgroundMusicPlayer setVolume:3];
    self.backgroundMusicPlayer.numberOfLoops = 1000; //设置音乐播放次数  -1为一直循环
    //    if(mainMusicStatus)
    //    {
    //        [myBackMusic play]; //播放
    //    }
    
    [self.backgroundMusicPlayer play];



}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        return (UIInterfaceOrientationLandscapeLeft == interfaceOrientation ||
                UIInterfaceOrientationLandscapeRight == interfaceOrientation);
    } else {
        return (UIInterfaceOrientationLandscapeLeft == interfaceOrientation ||
                UIInterfaceOrientationLandscapeRight == interfaceOrientation);
    }
}
















@end
