//
//  DrugInfoDetailsViewController.h
//  SidebarDemo
//
//  Created by Satish on 3/12/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "ViewController.h"

@interface DrugInfoDetailsViewController : ViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSDictionary *dic;
    NSArray *jsonarr;
    NSDictionary *drugGroup;
    NSMutableDictionary *conceptGroup;
    NSMutableDictionary *conceptProperties;
    NSArray *arr2;
    NSArray *arr23;
    NSDictionary *resultdic;
    
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableview;


@property (nonatomic) NSString *strname;

@end
