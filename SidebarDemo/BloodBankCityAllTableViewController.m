//
//  BloodBankCityAllTableViewController.m
//  DrugFinder
//
//  Created by Satish on 3/31/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "BloodBankCityAllTableViewController.h"


#import "DBManager.h"
#import "BloodBankInfoAllTableViewController.h"
@interface BloodBankCityAllTableViewController ()
@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *arrqueryresult;
@end

@implementation BloodBankCityAllTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Blood Bank List";
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"bloodbank.db"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self loadData];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData{
    // Form the query.
    
    NSString *query =[NSString stringWithFormat:@"select * from bloodbank where District='%@'",self.city] ;
    
    // Get the results.
    
    NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:arrayWithDuplicates];
    self.arrqueryresult = [orderedSet array];
    [self.tableView reloadData];
    
}


#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrqueryresult.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Dequeue the cell.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    NSInteger indexOfState = [self.dbManager.arrColumnNames indexOfObject:@"h_name"];
    
    //NSInteger indexOfcity = [self.dbManager.arrColumnNames indexOfObject:@"city"];
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOfState]];
    
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //resultdic = arr2[indexPath.row];
    
    NSInteger indexOfState = [self.dbManager.arrColumnNames indexOfObject:@"id"];
    
    BloodBankInfoAllTableViewController *dfd = [self.storyboard instantiateViewControllerWithIdentifier:@"bloodbankinfo"];
    //dfd.Country = self.country;
    dfd.bid = [[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOfState];
    
    [self.navigationController pushViewController:dfd animated:YES];
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
