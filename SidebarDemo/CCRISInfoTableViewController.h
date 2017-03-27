//
//  CCRISInfoTableViewController.h
//  DrugFinder
//
//  Created by Satish on 3/27/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCRISInfoTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
{
    UIView* loadingView;
}
@property (nonatomic) NSString *title2;
@property (nonatomic) NSDictionary *dict;
@end
