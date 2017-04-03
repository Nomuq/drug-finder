//
//  HospitalSearchViewController.m
//  DrugFinder
//
//  Created by Satish on 3/30/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "HospitalSearchViewController.h"
#import "HospitalDetailsTableViewController.h"
#import "DBManager.h"
@interface HospitalSearchViewController ()
@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *arrqueryresult;
@end

@implementation HospitalSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"hospital.db"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)act_search:(id)sender {
    if([_txt_search.text length] > 2)
    {
        //self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil];
        NSString *str = [self.txt_search.text stringByAppendingString:@"%"];
        NSString *query =[NSString stringWithFormat:@"select * from General_Information where HospitalName LIKE '%@'", str];
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
    
    
    NSInteger indexOfState = [self.dbManager.arrColumnNames indexOfObject:@"HospitalName"];
    
    
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOfState]];
    
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //resultdic = arr2[indexPath.row];
    
    NSInteger indexOfState = [self.dbManager.arrColumnNames indexOfObject:@"ProviderID"];
    
    HospitalDetailsTableViewController *dfd = [self.storyboard instantiateViewControllerWithIdentifier:@"hospitalinfo"];
    //dfd.Country = self.country;
    dfd.providerid = [[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOfState];
    
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
