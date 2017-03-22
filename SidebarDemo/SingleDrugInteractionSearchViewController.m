//
//  SingleDrugInteractionSearchViewController.m
//  DrugFinder
//
//  Created by Satish on 3/17/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "SingleDrugInteractionSearchViewController.h"
#import "DBManager.h"
#import "SingleDrugInteractionInfoTableViewController.h"
#import "SWRevealViewController.h"
@interface SingleDrugInteractionSearchViewController ()
@property (nonatomic, strong) DBManager *dbManager;
@end

@implementation SingleDrugInteractionSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"interaction.db"];
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
        
        
        NSString *str =[NSString stringWithFormat:@"https://rxnav.nlm.nih.gov/REST/spellingsuggestions.json?name=%@",_txt_search.text];
        NSURL *url = [[NSURL alloc]initWithString:str];
        NSData *data =[[NSData alloc]initWithContentsOfURL:url];
        dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        suggestionList = [dic objectForKey:@"suggestionGroup"];
        
        suggestion = [suggestionList objectForKey:@"suggestionList"];
        jsonarr = [suggestion objectForKey:@"suggestion"];
        [_tableview reloadData];
        
    }
    else
    {
        jsonarr = nil;
        [_tableview reloadData];
    }
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return jsonarr.count;
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
    cell.textLabel.text = jsonarr[indexPath.row];
    
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.str = jsonarr[indexPath.row];
    
    NSLog(@"%@", self.str);
    
    
    NSString *str =[NSString stringWithFormat:@"https://rxnav.nlm.nih.gov/REST/drugs.json?name=%@",self.str];
    NSURL *url = [[NSURL alloc]initWithString:str];
    NSData *data =[[NSData alloc]initWithContentsOfURL:url];
    dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    drugGroup = [dic objectForKey:@"drugGroup"];
    NSMutableArray *arr = [drugGroup objectForKey:@"conceptGroup"];
    //conceptProperties = [conceptGroup objectForKey:@"conceptProperties"];
    //[conceptGroup removeObjectForKey:@"tty"];
    for (conceptProperties in arr) {
        arr2 = [conceptProperties objectForKey:@"conceptProperties"];
    }
    
    conceptProperties = [arr2 objectAtIndex:0];
    //arr2 = [conceptProperties objectForKey:@"conceptProperties"];
    //jsonarr2 = [arr2 objectForKey:@"rxcui"];
    //NSLog(@"%@", arr2);
    
    self.strid = [conceptProperties objectForKey:@"rxcui"];
    //NSLog(@"%@", self.strid);
   
    SingleDrugInteractionInfoTableViewController *dfd = [self.storyboard instantiateViewControllerWithIdentifier:@"singledrugint"];
    dfd.strid = self.strid;
        
        
       // UIViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@""];
        [self.navigationController pushViewController:dfd animated:YES];
    
    
    
}


@end
