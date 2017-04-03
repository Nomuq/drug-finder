//
//  BloodBankSearchByNameViewController.m
//  DrugFinder
//
//  Created by Satish on 3/31/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "HospitalIndiaSearchByNameViewController.h"
#import "DBManager.h"
#import "HospitalIndiaInfoAllTableViewController.h"
@interface HospitalIndiaSearchByNameViewController ()
@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *arrqueryresult;
@end

@implementation HospitalIndiaSearchByNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.txt_search becomeFirstResponder];
    // Do any additional setup after loading the view.
    //    SWRevealViewController *revealViewController = self.revealViewController;
    //    if ( revealViewController )
    //    {
    //
    //        [self.sidebarButton setTarget: self.revealViewController];
    //        [self.sidebarButton setAction: @selector( revealToggle: )];
    //        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    //    }
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"Hospitalindia.db"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)act_search:(id)sender {
    if([_txt_search.text length] > 2)
    {
        //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil];
        NSString *str = [self.txt_search.text stringByAppendingString:@"%"];
        NSString *query =[NSString stringWithFormat:@"select * from hospital where Hospital_Name LIKE '%@'", str];
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




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Dequeue the cell.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    NSInteger indexOfState = [self.dbManager.arrColumnNames indexOfObject:@"Hospital_Name"];
    
    NSInteger indexOfcity = [self.dbManager.arrColumnNames indexOfObject:@"District"];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ -%@", [[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOfState],[[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOfcity]];
    
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //resultdic = arr2[indexPath.row];
    
    NSInteger indexOfState = [self.dbManager.arrColumnNames indexOfObject:@"Sr_No"];
    
    HospitalIndiaInfoAllTableViewController *dfd = [self.storyboard instantiateViewControllerWithIdentifier:@"HospitalIndiainfo"];
    //dfd.Country = self.country;
    dfd.bid = [[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOfState];
    
    [self.navigationController pushViewController:dfd animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
