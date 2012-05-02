



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
    
    AVAudioPlayer *_audioPlayer;
    
    BOOL  showEnglish;    
}

@property (nonatomic,assign) NSInteger pageInteger;
@property (nonatomic,retain) UIButton *backButton;
@property (nonatomic,retain) UILabel *textLabel;
@property (nonatomic,retain) UILabel *pageNumberLabel;
@property (nonatomic,retain) UIButton *autoPlayingButton;
@property (nonatomic,retain) UIImageView     *imageView;
@property (nonatomic,assign) BOOL showEnglish;
@property (nonatomic,retain) AVAudioPlayer *audioPlayer;

- (IBAction)pageBackButton:(id)sender;
- (IBAction)pageForwardButton:(id)sender;
- (IBAction)backButton:(id)sender;
- (IBAction)translationButton:(id)sender;
@end
