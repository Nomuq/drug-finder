//
//  HSBDTableViewController.h
//  DrugFinder
//
//  Created by Satish on 3/28/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSBDTableViewController : UITableViewController <UITableViewDelegate,UITableViewDataSource>
{
    UIView* loadingView;
}
@property (nonatomic) NSString *title2;
@property (nonatomic) NSArray *dict;
@property (nonatomic) NSString *id2;

@end
