//
//  HelpViewController.h
//  DrugFinder
//
//  Created by Satish on 3/29/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpViewController : UIViewController <UIWebViewDelegate>
{
    UIView* loadingView;
}
- (IBAction)act_refresh:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@end
