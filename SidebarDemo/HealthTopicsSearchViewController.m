//
//  HealthTopicsSearchViewController.m
//  DrugFinder
//
//  Created by Satish on 3/21/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "HealthTopicsSearchViewController.h"
#import <Foundation/Foundation.h>
#import "DBManager.h"
#import "SWRevealViewController.h"
#import "HealthTopicDescViewController.h"
@interface HealthTopicsSearchViewController ()
@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *arrqueryresult;

@end

@implementation HealthTopicsSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"healthtopics.db"];
    // Do any additional setup after loading the view.
   // self.tableview.delegate = self;
    //self.tableview.dataSource = self;

    
   

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)act_search:(id)sender {
    if([_txt_search.text length] > 2)
    {
        NSString *str = [self.txt_search.text stringByAppendingString:@"%"];
        NSString *query =[NSString stringWithFormat:@"select * from urllist where title LIKE '%@'", str];
        //NSLog(@"%@", query);
        // Get the results.
        
        NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
        NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:arrayWithDuplicates];
        self.arrqueryresult = [orderedSet array];
        //NSLog(@"%@", self.arrqueryresult);
       
        //[self.tableView reloadData];
      [_tableview reloadData];
        
    }
    else
    {
        self.arrqueryresult = nil;
        [_tableview reloadData];
    }
    
    
}

- (IBAction)act_search_end:(id)sender {
    [self.view endEditing:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.arrqueryresult.count;
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
    //cell.textLabel.text = jsonarr[indexPath.row];
    
   // NSInteger indexOfid = [self.dbManager.arrColumnNames indexOfObject:@"id"];
    NSInteger indexOftitle = [self.dbManager.arrColumnNames indexOfObject:@"title"];
   // NSInteger indexOfurl = [self.dbManager.arrColumnNames indexOfObject:@"url"];
    
   
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOftitle]];
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   // NSInteger indexOfid = [self.dbManager.arrColumnNames indexOfObject:@"id"];
    NSInteger indexOftitle = [self.dbManager.arrColumnNames indexOfObject:@"title"];
    NSInteger indexOfurl = [self.dbManager.arrColumnNames indexOfObject:@"url"];
    
    NSString *urltogo = [[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOfurl];
    NSString *titletogo = [[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOftitle];
    
    //NSLog(@"%@", _recordIDToEdit);
    HealthTopicDescViewController *update = [self.storyboard instantiateViewControllerWithIdentifier:@"HealthTopicDesc"];
    
    update.url = urltogo;
    update.title2 = titletogo;
    
    [self.navigationController pushViewController:update animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
