//
//  StartViewController.h
//  TaoTao
//
//  Created by Tom Callon (Hotmail) on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface StartViewController : UIViewController<AVAudioPlayerDelegate>

{
    
    ////Stystmes
    UIButton *_startReadingButton;
    UIButton *_myVacabulariesButton;
    UIButton *_settingsButton;
    UIButton *_aboutUsButton;
    
   /////Animals
    
    UIButton *_elephantButton;
    UIButton *_tigerButton;
    UIButton *_giraffeButton;
    UIButton *_monkeyButton;
    
    
    ///environment
    UIButton *_taotaoButton;
    UIButton *_cloudOneButton;
    UIButton *_cloudTwoButton;
    UIButton *_cloudThreeButton;

    
    
    
    
    AVAudioPlayer *_audioPlayer;
    
    AVAudioPlayer *_backgroundMusicPlayer;
    

    
    
    
    
}
////Stystmes
@property (nonatomic,retain)  IBOutlet UIButton *startReadingButton;
@property (nonatomic,retain)  IBOutlet UIButton *myVacabulariesButton;
@property (nonatomic,retain)  IBOutlet UIButton *settingsButton;
@property (nonatomic,retain)  IBOutlet UIButton *aboutUsButton;

/////Animals
@property (nonatomic,retain) IBOutlet UIButton *elephantButton;
@property (nonatomic,retain) IBOutlet UIButton *tigerButon;
@property (nonatomic,retain) IBOutlet UIButton *girafeButton;
@property (nonatomic,retain) IBOutlet UIButton *monkeyButton;

////environments
@property (nonatomic,retain) IBOutlet UIButton *taotaoButton;
@property (nonatomic,retain) IBOutlet UIButton *cloudOneButton;
@property (nonatomic,retain) IBOutlet UIButton *cloudTwoButton;
@property (nonatomic,retain) IBOutlet UIButton *cloudThreeButton;


@property (nonatomic,retain) AVAudioPlayer *audioPlayer;
@property (nonatomic,retain)AVAudioPlayer *backgroundMusicPlayer;



- (IBAction)startReadingButton:(id)sender;
- (IBAction)myVacabulariesButton:(id)sender;
- (IBAction)settingsButton:(id)sender;
- (IBAction)aboutUsButton:(id)sender;
- (IBAction)animalsButton:(id)sender;

@end
