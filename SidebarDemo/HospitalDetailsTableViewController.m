//
//  HospitalDetailsTableViewController.m
//  DrugFinder
//
//  Created by Satish on 3/30/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "HospitalDetailsTableViewController.h"
#import "DBManager.h"
@interface HospitalDetailsTableViewController ()
@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *arrqueryresult;

@end
NSArray *colname;
NSArray *collumnsname;
@implementation HospitalDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Hospital Info";
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"hospital.db"];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    colname = @[@"ProviderID",
    @"HospitalName",
    @"Address",
    @"City",
    @"State",
    @"ZIPCode",
    @"CountyName",
    @"PhoneNumber",
    @"HospitalType",
    @"HospitalOwnership",
    @"EmergencyServices",
    @"MeetscriteriaformeaningfuluseofEHRs",
    @"Hospitaloverallrating",
    @"Hospitaloverallratingfootnote",
    @"Mortalitynationalcomparison",
    @"Mortalitynationalcomparisonfootnote",
    @"Safetyofcarenationalcomparison",
    @"Safetyofcarenationalcomparisonfootnote",
    @"Readmissionnationalcomparison",
    @"Readmissionnationalcomparisonfootnote",
    @"Patientexperiencenationalcomparison",
    @"Patientexperiencenationalcomparisonfootnote",
    @"Effectivenessofcarenationalcomparison",
    @"Effectivenessofcarenationalcomparisonfootnote",
    @"Timelinessofcarenationalcomparison",
    @"Timelinessofcarenationalcomparisonfootnote",
    @"Efficientuseofmedicalimagingnationalcomparison",
    @"Efficientuseofmedicalimagingnationalcomparisonfootnote"];
    
    collumnsname = @[@"Provider ID",
                @"Hospital Name",
                @"Address",
                @"City",
                @"State",
                @"ZIPCode",
                @"County Name",
                @"Phone Number",
                @"Hospital Type",
                @"Hospital Ownership",
                @"Emergency Services",
                @"Meets criteria for meaningful use of EHRs",
                @"Hospital overall rating",
                @"Hospital overall rating footnote",
                @"Mortality national comparison",
                @"Mortality national comparison footnote",
                @"Safety of carenational comparison",
                @"Safety of carenational comparison footnote",
                @"Readmission national comparison",
                @"Readmission national comparison footnote",
                @"Patient experience national comparison",
                @"Patient experience national comparison footnote",
                @"Effectiveness of carenational comparison",
                @"Effectiveness of carenational comparisonfootnote",
                @"Timeliness of carenational comparison",
                @"Timeliness of carenational comparison footnote",
                @"Efficient use of medical imagingnational comparison",
                @"Efficient use of medical imagingnational comparison footnote"];
    [self loadData];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)loadData{
    // Form the query.
    
    NSString *query =[NSString stringWithFormat:@"select * from General_Information where ProviderID='%@'",self.providerid] ;
    
    // Get the results.
    
    NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:arrayWithDuplicates];
    self.arrqueryresult = [orderedSet array];
    
 
    
   
    
    [self.tableView reloadData];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return colname.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [collumnsname objectAtIndex:section];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:17]];
    NSString *string =[colname objectAtIndex:section];
    /* Section header is in 0th index... */
    [label setText:string];
    [view addSubview:label];
    [view setBackgroundColor:[UIColor lightGrayColor]]; //your background color...
    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    
    NSInteger indexOfState = [self.dbManager.arrColumnNames indexOfObject:[colname objectAtIndex:indexPath.section]];
    
    
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOfState]];
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
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
