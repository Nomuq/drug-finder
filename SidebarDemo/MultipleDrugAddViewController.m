//
//  MultipleDrugAddViewController.m
//  DrugFinder
//
//  Created by Satish on 3/15/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "MultipleDrugAddViewController.h"
#import "DBManager.h"


@interface MultipleDrugAddViewController ()
@property (nonatomic, strong) DBManager *dbManager;
@end

@implementation MultipleDrugAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
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

- (IBAction)act_search_end:(id)sender {
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
    NSString *query = [NSString stringWithFormat:@"insert into list values('%@', '%@')", self.strid, self.str];
    
    // Execute the query.
    [self.dbManager executeQuery:query];
    
    // If the query was successfully executed then pop the view controller.
    if (self.dbManager.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        
        
        UIViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"multipledrugint"];
        [self.navigationController pushViewController:view animated:YES];
    }
    else{
        NSLog(@"Could not execute the query.");
    }
    
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
