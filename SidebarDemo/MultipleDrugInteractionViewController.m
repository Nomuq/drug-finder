//
//  MultipleDrugInteractionViewController.m
//  DrugFinder
//
//  Created by Satish on 3/15/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "MultipleDrugInteractionViewController.h"
#import "SWRevealViewController.h"
#import "DBManager.h"
#import "CheckForIneractionTableViewController.h"
@interface MultipleDrugInteractionViewController ()
@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *arrPeopleInfo;
@property (nonatomic, strong) NSArray *arrPeopleInfo2;
@end

@implementation MultipleDrugInteractionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    namearr = [[NSMutableArray alloc]init];
    [super viewDidLoad];
    [self.tableView reloadData];
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"interaction.db"];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Reload the table view.
    
    
    [self loadData];
    [self.tableView reloadData];
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
-(void)loadData{
    // Form the query.
    NSString *query = @"select * from list";
    
    // Get the results.
    if (self.arrPeopleInfo != nil) {
        self.arrPeopleInfo = nil;
    }
    self.arrPeopleInfo = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    
    [self.tableView reloadData];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrPeopleInfo.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Dequeue the cell.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    NSInteger indexOfname = [self.dbManager.arrColumnNames indexOfObject:@"name"];
   //NSInteger indexOfrxid = [self.dbManager.arrColumnNames indexOfObject:@"id"];
    
    
    // Set the loaded data to the appropriate cell labels.
    //cell.textLabel.text = [NSString stringWithFormat:@"%@ || %@ || %@", [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfFirstname], [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfAddress] , [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfmobile]];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfname]];
    //NSString *str = [NSString stringWithFormat:@"%@",[[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfrxid]];
    
    //[idarr addObject:str];
    NSString *str2 = [NSString stringWithFormat:@"%@", [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfname]];
    [namearr addObject:str2];
    
    
    return cell;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)act_reload:(id)sender {
    
    
    
    [self loadData];
    [self.tableView reloadData];
    
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the selected record.
        // Find the record ID.
//        NSInteger indexOfFirstname = [self.dbManager.arrColumnNames indexOfObject:@"name"];
//        NSString *recordIDToDelete = [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfFirstname];
        
        NSInteger indexOfid = [self.dbManager.arrColumnNames indexOfObject:@"id"];
        NSString *recordid =  [[self.arrPeopleInfo objectAtIndex:indexPath.row] objectAtIndex:indexOfid];
        // Prepare the query.
        
        //NSString *query = [NSString stringWithFormat:@"delete from customer where name='%@' and mobile='%@'", recordIDToDelete,recordIDToDeletemob];
        NSString *query = [NSString stringWithFormat:@"delete from list where id='%@'", recordid];
        // Execute the query.
        [self.dbManager executeQuery:query];
        
        // Reload the table view.
        [self loadData];
    }
    
}
-(void)editingInfoWasFinished{
    // Reload the data.
    [self loadData];
}
- (IBAction)act_clear:(id)sender {
    
    NSString *query = [NSString stringWithFormat:@"delete from list"];
    // Execute the query.
    [self.dbManager executeQuery:query];
    [self loadData];
    
}

- (IBAction)act_checkforintraction:(id)sender {
    idarr = [[NSMutableArray alloc]init];
    NSString *query = @"select * from list";
    
    // Get the results.
    if (self.arrPeopleInfo2 != nil) {
        self.arrPeopleInfo2 = nil;
    }
    self.arrPeopleInfo2 = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
   
    for (int i=0; i<_arrPeopleInfo2.count;i++)
    {
        NSInteger indexOfrxid = [self.dbManager.arrColumnNames indexOfObject:@"id"];
        
        NSString *str = [NSString stringWithFormat:@"%@",[[self.arrPeopleInfo2 objectAtIndex:i] objectAtIndex:indexOfrxid]];
        
        [idarr addObject:str];
    }
 
    NSLog(@"%@",idarr);
    CheckForIneractionTableViewController *dfd = [self.storyboard instantiateViewControllerWithIdentifier:@"checkforint"];
    
    NSMutableArray *removeelement = [[NSMutableArray alloc]init];
    NSString *check = @"true";
    if (idarr.count < 2)
    {
        NSLog(@"Please At least enter two Med");
        check = @"null";
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                       message:@"Please At least enter two Med"
                                    
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        for (int i=0; i<idarr.count; i++) {
            
            NSString *str = [idarr objectAtIndex:i];
            //NSLog(@"%@", str);
            if ([str isEqual:@"(null)"]) {
                [removeelement addObject:[namearr objectAtIndex:i]];
                check = @"false";
            }
           
        }
        if ([check isEqual:@"true"])
        {
            //NSLog(@"else");
            dfd.arrid = idarr;
            [self.navigationController pushViewController:dfd animated:YES];
        }
        else if ([check isEqual:@"false"])
        {
            //NSLog(@"Remove object = %@",removeelement);
            
            NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:removeelement];
            NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:arrayWithDuplicates];
            NSArray *finalarr = [orderedSet array];
            NSString *joinedString = [finalarr componentsJoinedByString:@","];
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Remove This Med"
                                                                           message:joinedString
                                        
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        
        
    }
}
@end
