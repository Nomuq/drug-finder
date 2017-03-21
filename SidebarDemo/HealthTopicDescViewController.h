//
//  HealthTopicDescViewController.h
//  DrugFinder
//
//  Created by Satish on 3/21/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HealthTopicDescViewController : UIViewController <UIWebViewDelegate>
{
    UIView* loadingView;
}
@property (nonatomic) NSString *url;
@property (nonatomic) NSString *title2;
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end
