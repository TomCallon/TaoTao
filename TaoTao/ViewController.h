//
//  ViewController.h
//  TaoTao
//
//  Created by Tom Callon (Hotmail) on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController<AVAudioPlayerDelegate>

{
    NSInteger        pageInteger;
    UIButton        *_backButton;
    UILabel          *_textLabel;
    UILabel    *_pageNumberLabel;
    UIButton *_autoPlayingButton;
    UIImageView       *_imageView;
    
}

@property (nonatomic,assign) NSInteger pageInteger;
@property (nonatomic,retain) UIButton *backButton;
@property (nonatomic,retain) UILabel *textLabel;
@property (nonatomic,retain) UILabel *pageNumberLabel;
@property (nonatomic,retain) UIButton *autoPlayingButton;
@property (nonatomic,retain) UIImageView     *imageView;





- (IBAction)pageBackButton:(id)sender;

- (IBAction)pageForwardButton:(id)sender;

- (IBAction)backButton:(id)sender;


@end
