//
//  CCIRSSearchViewController.m
//  DrugFinder
//
//  Created by Satish on 3/27/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "CCIRSSearchViewController.h"
#import "SWRevealViewController.h"
#import "DBManager.h"
#import "CCRISInfoTableViewController.h"
@interface CCIRSSearchViewController ()
@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *arrqueryresult;
@end

@implementation CCIRSSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.txt_search becomeFirstResponder];
    // Do any additional setup after loading the view.
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"ccris2.db"];
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
        NSString *query =[NSString stringWithFormat:@"select * from ccris where nameofsubstance LIKE '%@'", str];
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
    NSInteger indexOftitle = [self.dbManager.arrColumnNames indexOfObject:@"nameofsubstance"];
    // NSInteger indexOfurl = [self.dbManager.arrColumnNames indexOfObject:@"url"];
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOftitle]];
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSInteger indexOftitle = [self.dbManager.arrColumnNames indexOfObject:@"nameofsubstance"];
   
    
    NSString *titletogo = [[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOftitle];
    
    CCRISInfoTableViewController *update = [self.storyboard instantiateViewControllerWithIdentifier:@"ccrisinfo"];
    
    
    update.title2 = titletogo;
    
    
    [self.navigationController pushViewController:update animated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
//- (IBAction)act_search_end:(id)sender {
//    [self.view endEditing:YES];
//}

- (IBAction)tap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)swipe:(id)sender {
    [self.view endEditing:YES];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

@end
