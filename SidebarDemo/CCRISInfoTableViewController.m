//
//  CCRISInfoTableViewController.m
//  DrugFinder
//
//  Created by Satish on 3/27/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "CCRISInfoTableViewController.h"
#import <Foundation/Foundation.h>
#import "DBManager.h"
@interface CCRISInfoTableViewController ()
@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *arrqueryresult;
@end
NSArray *sec;
NSArray *sec0;
NSArray *sec1;
NSArray *sec2;
NSArray *sec3;
NSArray *sec4;
NSArray *sec5;
NSArray *sec0db;
NSArray *sec1db;
NSArray *sec2db;
NSArray *sec3db;
NSArray *sec4db;
NSArray *sec5db;
NSArray *sub;
//NSDictionary *dic;
@implementation CCRISInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.title2;
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"ccris2.db"];
    
    
    
    sec= @[@"Administrative Information", @"Substance Identification/Use Information", @"Carcinogenicity Studies",@"Tumor Promotion Studies",@"Mutagenicity Studies",@"Tumor Inhibitor Studies"];
    
    sec0=@[@"Chemical Carcinogenesis Record Number",@"Last revision date",@"Update History"];
    
    sec1 = @[@"Name of Substance",@"CAS Registry Number",@"Major Use Class",@"Data Type"];
    
    sec2 = @[@"Species",@"Strain/Sex",@"Route",@"Dose",@"Tumor Site: Type of Lesion",@"Results"];
    
    
    sec3 = @[@"Species",@"Strain/Sex",@"Route [Promoter]",@"Doses [Promoter]",@"Carcinogen",@"Route [Carcinogen]",@"Doses [Carcinogen]",@"Target Tissue: Type of Lesion"];
    
    
    
    sec4 = @[@"Test System",@"Strain/Indicator",@"Metabolic Activation",@"Method",@"Dose Range",@"Results"];
    
    
    
    sec5 = @[@"Species",@"Number of Animals Tested",@"Strain/Sex",@"Route [Inhibitor]",@"Dose [Inhibitor]",@"Carcinogen",@"Route [Carcinogen]",@"Dose [Carcinogen]",@"Promoter",@"Route [Promoter]",@"Dose [Promoter]",@"Target Tissue: Type of Lesion",@"Endpoint [Incidence]",@"Endpoint [Multiplicity]",@"Endpoint [Latency]",@"Comments"];
    
    
    sec0db=@[@"ccn",@"date",@"daterevised"];
    
    sec1db = @[@"nameofsubstance",@"casregistrynumber",@"use",@"dtyp"];
    
    sec2db = @[@"cstuspecc",@"cstustsxc",@"csturoutc",@"cstudosec",@"cstutstlc",@"cstursltc"];
    
    
    sec3db = @[@"tstuspect",@"tstustsxt",@"tsturtprt",@"tstudoprt",@"tstucrcnt",@"tsturtcat",@"tstudocat",@"tstutttlt"];
    
    
    
    sec4db = @[@"mstutsstm",@"mstuindcm",@"mstumatvm",@"mstumethm",@"mstudosem",@"mstursltm"];
    
    
    
    sec5db = @[@"istuspeci",@"istunoat",@"istustsxi",@"isturtini",@"istudoini",@"istucrcni",@"isturtcai",@"istudocai",@"istuprmti",@"isturtpri",@"istudopri",@"istutttli",@"istuendii",@"istuendmi",@"istuendli",@"commi"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return sec.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sec objectAtIndex:section];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:15]];
    NSString *string =[sec objectAtIndex:section];
    /* Section header is in 0th index... */
    [label setText:string];
    [view addSubview:label];
    [view setBackgroundColor:[UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:1.0]]; //your background color...
    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger seccount = 0;
    if (section == 0) {
        seccount = sec0.count;
        
    }
    if (section == 1) {
        seccount = sec1.count;
    }
    
    if (section == 2) {
        seccount = sec2.count;
    }
    if (section == 3) {
        seccount = sec3.count;
    }
    if (section == 4) {
        seccount = sec4.count;
    }
    if (section == 5) {
        seccount = sec5.count;
    }
    
    return seccount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        //cell.textLabel.text = [sec0 objectAtIndex:indexPath.row];
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        NSString *str11 = [sec0db objectAtIndex:indexPath.row];
        
        NSString *query =[NSString stringWithFormat:@"select (%@) from ccris where nameofsubstance='%@'",str11,self.title2];
        
        NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
       
        
        NSInteger indexOftitle = [self.dbManager.arrColumnNames indexOfObject:str11];
        
        
        NSString *str33 = [[arrayWithDuplicates objectAtIndex:0] objectAtIndex:indexOftitle];
        
        NSString *str22 = [[NSString alloc]initWithFormat:@"%@ :  %@",[sec0 objectAtIndex:indexPath.row],str33];
        cell.textLabel.text = str22;
    }
    if (indexPath.section == 1) {
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        NSString *str11 = [sec1db objectAtIndex:indexPath.row];
        
        NSString *query =[NSString stringWithFormat:@"select (%@) from ccris where nameofsubstance='%@'",str11,self.title2];
        
        NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
        
        NSInteger indexOftitle = [self.dbManager.arrColumnNames indexOfObject:str11];
        
        
        NSString *str33 = [[arrayWithDuplicates objectAtIndex:0] objectAtIndex:indexOftitle];
        
        NSString *str22 = [[NSString alloc]initWithFormat:@"%@ :  %@",[sec1 objectAtIndex:indexPath.row],str33];
        cell.textLabel.text = str22;
    }
    
    if (indexPath.section == 2) {
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        NSString *str11 = [sec2db objectAtIndex:indexPath.row];
        
        NSString *query =[NSString stringWithFormat:@"select (%@) from ccris where nameofsubstance='%@'",str11,self.title2];
        
        NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
        
        NSInteger indexOftitle = [self.dbManager.arrColumnNames indexOfObject:str11];
        
        
        NSString *str33 = [[arrayWithDuplicates objectAtIndex:0] objectAtIndex:indexOftitle];
        
        NSString *str22 = [[NSString alloc]initWithFormat:@"%@ :  %@",[sec2 objectAtIndex:indexPath.row],str33];
        cell.textLabel.text = str22;
    }
    if (indexPath.section == 3) {
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        NSString *str11 = [sec3db objectAtIndex:indexPath.row];
        
        NSString *query =[NSString stringWithFormat:@"select (%@) from ccris where nameofsubstance='%@'",str11,self.title2];
        
        NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
        
        NSInteger indexOftitle = [self.dbManager.arrColumnNames indexOfObject:str11];
        
        
        NSString *str33 = [[arrayWithDuplicates objectAtIndex:0] objectAtIndex:indexOftitle];
        
        NSString *str22 = [[NSString alloc]initWithFormat:@"%@ :  %@",[sec3 objectAtIndex:indexPath.row],str33];
        cell.textLabel.text = str22;
    }
    if (indexPath.section == 4) {
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        NSString *str11 = [sec4db objectAtIndex:indexPath.row];
        
        NSString *query =[NSString stringWithFormat:@"select (%@) from ccris where nameofsubstance='%@'",str11,self.title2];
        
        NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
        
        NSInteger indexOftitle = [self.dbManager.arrColumnNames indexOfObject:str11];
        
        
        NSString *str33 = [[arrayWithDuplicates objectAtIndex:0] objectAtIndex:indexOftitle];
        
        NSString *str22 = [[NSString alloc]initWithFormat:@"%@ :  %@",[sec4 objectAtIndex:indexPath.row],str33];
        cell.textLabel.text = str22;
    }
    if (indexPath.section == 5) {
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        NSString *str11 = [sec5db objectAtIndex:indexPath.row];
        
        NSString *query =[NSString stringWithFormat:@"select (%@) from ccris where nameofsubstance='%@'",str11,self.title2];
        
        NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
        
        NSInteger indexOftitle = [self.dbManager.arrColumnNames indexOfObject:str11];
        
        
        NSString *str33 = [[arrayWithDuplicates objectAtIndex:0] objectAtIndex:indexOftitle];
        NSString *str22 = [[NSString alloc]initWithFormat:@"%@ :  %@",[sec5 objectAtIndex:indexPath.row],str33];
        cell.textLabel.text = str22;
    }
    
    
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
