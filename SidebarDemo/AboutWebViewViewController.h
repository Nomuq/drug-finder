//
//  AboutWebViewViewController.h
//  DrugFinder
//
//  Created by Satish on 3/30/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutWebViewViewController : UIViewController <UIWebViewDelegate>
{
    UIView* loadingView;
}
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
