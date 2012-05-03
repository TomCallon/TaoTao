



#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@class FirstPageViewController;

@interface ViewController : UIViewController<AVAudioPlayerDelegate,UIGestureRecognizerDelegate>

{
    NSInteger        pageInteger;
    UIButton        *_backButton;
    UILabel          *_textLabel;
    UILabel    *_pageNumberLabel;
    UIButton *_autoPlayingButton;
   
    FirstPageViewController *_firstPageViewController;
    
    UIImageView  *_imageView;
    AVAudioPlayer *_audioPlayer;
    UIView *_currentView;
    
    UIView *pieceForReset;

    
    BOOL  showEnglish;    
}

@property (nonatomic,assign) NSInteger pageInteger;
@property (nonatomic,retain) UIButton *backButton;
@property (nonatomic,retain) UILabel *textLabel;
@property (nonatomic,retain) UILabel *pageNumberLabel;
@property (nonatomic,retain) UIButton *autoPlayingButton;
@property (nonatomic,retain) UIView *currentView;
@property (nonatomic,retain) UIImageView  *imageView;


@property (nonatomic,retain)FirstPageViewController *firstPageViewController;


@property (nonatomic,assign) BOOL showEnglish;
@property (nonatomic,retain) AVAudioPlayer *audioPlayer;

- (IBAction)pageBackButton:(id)sender;
- (IBAction)pageForwardButton:(id)sender;
- (IBAction)backButton:(id)sender;
- (IBAction)translationButton:(id)sender;
@end
