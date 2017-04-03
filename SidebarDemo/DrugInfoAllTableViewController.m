//
//  DrugInfoAllTableViewController.m
//  DrugFinder
//
//  Created by Satish on 3/29/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "DrugInfoAllTableViewController.h"

@interface DrugInfoAllTableViewController ()

@end
NSArray *secname;
NSArray *secname0;


@implementation DrugInfoAllTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.popname;
    secname0 = @[@"brandName",@"displayName",@"synonym",@"fullName",@"fullGenericName",@"strength",@"rxtermsDoseForm",@"route",@"termType",@"rxcui",@"genericRxcui",@"rxnormDoseForm",@"suppress"];
    secname = @[@"Brand Name",@"Display Name",@"Synonym",@"Full Name",@"Full Generic Name",@"Strength",@"Rxterms Dose Form",@"Route",@"Term Type",@"RXCUI",@"Generic Rxcui",@"Rxnorm Dose Form",@"Suppress"];
    
    
    loadingView = [[UIView alloc]initWithFrame:CGRectMake(100, 400, 80, 80)];
    loadingView.backgroundColor = [UIColor colorWithWhite:0. alpha:0.6];
    loadingView.layer.cornerRadius = 5;
    
    UIActivityIndicatorView *activityView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.center = CGPointMake(loadingView.frame.size.width / 2.0, 35);
    [activityView startAnimating];
    activityView.tag = 100;
    [loadingView addSubview:activityView];
    
    UILabel* lblLoading = [[UILabel alloc]initWithFrame:CGRectMake(0, 48, 80, 30)];
    lblLoading.text = @"Loading...";
    lblLoading.textColor = [UIColor whiteColor];
    lblLoading.font = [UIFont fontWithName:lblLoading.font.fontName size:15];
    lblLoading.textAlignment = NSTextAlignmentCenter;
    [loadingView addSubview:lblLoading];
    loadingView.center = self.view.center;
    [self.view addSubview:loadingView];
    
    
    [self loaddata];
    [self.tableView reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loaddata {
    [loadingView setHidden:NO];
    NSString *str =[NSString stringWithFormat:@"https://rxnav.nlm.nih.gov/REST/RxTerms/rxcui/%@/allinfo.json",self.rxcui];
    NSURL *url = [[NSURL alloc]initWithString:str];
    @try {
        NSData *data =[[NSData alloc]initWithContentsOfURL:url];
    NSDictionary *dic2 = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    self.dictr = [dic2 objectForKey:@"rxtermsProperties"];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
   
    
    [loadingView setHidden:YES];
   
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return secname.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [secname objectAtIndex:section];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:17]];
    NSString *string =[secname objectAtIndex:section];
    /* Section header is in 0th index... */
    [label setText:string];
    [view addSubview:label];
    [view setBackgroundColor:[UIColor colorWithRed:196/255.0 green:255/255.0 blue:248/255.0 alpha:1.0]]; //your background color...
    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
            //cell.textLabel.text = [sec0 objectAtIndex:indexPath.row];
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
    
        NSString *str11 = [secname0 objectAtIndex:indexPath.section];
    
    NSString *str33 = [self.dictr objectForKey:str11];
   
        NSString *str22 = [[NSString alloc]initWithFormat:@"%@",str33];
        cell.textLabel.text = str22;
    
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
