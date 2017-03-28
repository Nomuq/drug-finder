//
//  SingleDrugInteractionInfoTableViewController.m
//  DrugFinder
//
//  Created by Satish on 3/17/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "SingleDrugInteractionInfoTableViewController.h"

@interface SingleDrugInteractionInfoTableViewController ()

@end

@implementation SingleDrugInteractionInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.strid);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    //https://rxnav.nlm.nih.gov/REST/interaction/interaction.json?rxcui=384455&sources=DrugBank
    //https://rxnav.nlm.nih.gov/REST/interaction/interaction.json?rxcui=384455&sources=ONCHigh
    
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
    
    

}
-(void)loaddata{
    
    [loadingView setHidden:NO];
    NSString *str =[NSString stringWithFormat:@"https://rxnav.nlm.nih.gov/REST/interaction/interaction.json?rxcui=%@&sources=DrugBank",self.strid];
    
    NSURL *url = [[NSURL alloc]initWithString:str];
    @try {
        NSData *data =[[NSData alloc]initWithContentsOfURL:url];
        dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
    
    //NSLog(@"%@", dic);
    NSArray *array = [dic valueForKey:@"interactionTypeGroup"];
    //NSLog(@"%@", array);
    fullInteractionType = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in array) {
        
        //fullInteractionType = [dict objectForKey:@"fullInteractionType"];
        NSDictionary *str = [dict objectForKey:@"interactionType"];
        //NSLog(@"%@", str);
        [fullInteractionType addObject:str];
        
    }
    
    //NSLog(@"Full interactin type ========================= %@", fullInteractionType);
    
    interactionPair = [[NSMutableArray alloc]init];
    
    for (int i=0; i<[fullInteractionType count]; i++) {
        NSDictionary *arrayResult = [fullInteractionType objectAtIndex:i];
        //NSLog(@"%@",[arrayResult objectForKey:@"interactionPair"]);
        //NSLog(@"%@", arrayResult);
        for (NSDictionary *dict in arrayResult) {
            
            //fullInteractionType = [dict objectForKey:@"fullInteractionType"];
            NSDictionary *str = [dict objectForKey:@"interactionPair"];
            //NSLog(@"%@", str);
            [interactionPair addObject:str];
            
        }
        
    }
    
    description  = [[NSMutableArray alloc]init];
    severity  = [[NSMutableArray alloc]init];
    interactionConcept  = [[NSMutableArray alloc]init];
    
    //NSLog(@"description ========================= %@", description);
    //NSLog(@"severity ========================= %@", severity);
    //NSLog(@"interactionConcept ========================= %@", interactionConcept);
    
    
    for (int i=0; i<[interactionPair count]; i++)
    {
        NSDictionary *arrayResult = [interactionPair objectAtIndex:i];
        //NSLog(@"%@",[arrayResult objectForKey:@"interactionPair"]);
        //NSLog(@"%@", arrayResult);
        for (NSDictionary *dict in arrayResult) {
            
            //fullInteractionType = [dict objectForKey:@"fullInteractionType"];
            NSDictionary *str = [dict objectForKey:@"description"];
            NSDictionary *str2 = [dict objectForKey:@"severity"];
            NSDictionary *str3 = [dict objectForKey:@"interactionConcept"];
            //NSLog(@"%@", str);
            [description addObject:str];
            [severity addObject:str2];
            [interactionConcept addObject:str3];
            
        }
        
    }
    minConceptItem = [[NSMutableArray alloc]init];
    for (int i=0; i<[interactionConcept count]; i++) {
        NSDictionary *arrayResult = [interactionConcept objectAtIndex:i];
        //NSLog(@"%@",[arrayResult objectForKey:@"interactionPair"]);
        //NSLog(@"%@", arrayResult);
        for (NSDictionary *dict in arrayResult) {
            
            //fullInteractionType = [dict objectForKey:@"fullInteractionType"];
            NSDictionary *str = [dict objectForKey:@"minConceptItem"];
            //NSLog(@"%@", str);
            [minConceptItem addObject:str];
            
        }
        
    }
    name = [[NSMutableArray alloc]init];
    
    for (NSDictionary *dict in minConceptItem) {
        
        //fullInteractionType = [dict objectForKey:@"fullInteractionType"];
        NSDictionary *str = [dict objectForKey:@"name"];
        //NSLog(@"%@", str);
        [name addObject:str];
        
    }
    // NSLog(@"name ========================= %@", name);
    nameodd = [[NSMutableArray alloc]init];
    nameeven = [[NSMutableArray alloc]init];
    for ( int i = 0; i < [name count]; i++ )
    {
        id object = name[i];
        
        if ( i % 2 == 0 ) {
            [nameeven addObject:object];
        }
        else {
            //  odd stuff here
            [nameodd addObject:object];
        }
    }
    
    [loadingView setHidden:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return description.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ : %@",nameeven[indexPath.row],nameodd[indexPath.row]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Severity : %@",severity[indexPath.row]];
    if ([severity[indexPath.row] isEqual:@"high"])
    {
        cell.detailTextLabel.textColor = [UIColor redColor];
    }
    if ([severity[indexPath.row] isEqual:@"N/A"])
    {
        cell.detailTextLabel.textColor = [UIColor greenColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSString *ser = [NSString stringWithFormat:@"Severity : %@",severity[indexPath.row]];
    NSString *desc =[NSString stringWithFormat:@"%@",description[indexPath.row]];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Description"
                                                                   message:desc
                                
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
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
