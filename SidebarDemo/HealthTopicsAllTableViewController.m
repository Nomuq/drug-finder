//
//  HealthTopicsAllTableViewController.m
//  DrugFinder
//
//  Created by Satish on 3/21/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//
#import "SWRevealViewController.h"
#import "HealthTopicsAllTableViewController.h"
#import "DBManager.h"
#import "HealthTopicDescViewController.h"
@interface HealthTopicsAllTableViewController ()
@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *arrqueryresult;

@end

@implementation HealthTopicsAllTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"healthtopics.db"];
   
    NSString *query =[NSString stringWithFormat:@"select * from urllist"];
    //NSLog(@"%@", query);
    // Get the results.
    
    NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:arrayWithDuplicates];
    self.arrqueryresult = [orderedSet array];
    

    // Do any additional setup after loading the view.
    // self.tableview.delegate = self;
    //self.tableview.dataSource = self;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
