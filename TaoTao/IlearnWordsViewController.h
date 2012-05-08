//
//  IlearnWordsViewController.h
//  TaoTao
//
//  Created by Tom Callon (Hotmail) on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IlearnWordsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

{
 	  NSArray *list;


}

@property (nonatomic,retain) NSArray *list;

- (IBAction)backButton:(id)sender;

@end
