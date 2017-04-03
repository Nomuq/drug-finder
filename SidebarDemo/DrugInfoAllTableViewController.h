//
//  DrugInfoAllTableViewController.h
//  DrugFinder
//
//  Created by Satish on 3/29/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrugInfoAllTableViewController : UITableViewController
{
    UIView* loadingView;
    NSArray *sectionname;
    NSArray *sectionname0;
}

@property (nonatomic) NSDictionary *dictr;

@property (nonatomic) NSString *rxcui;
@property (nonatomic) NSString *popname;
@end
