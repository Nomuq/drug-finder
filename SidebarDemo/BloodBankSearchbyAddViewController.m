//
//  BloodBankSearchbyAddViewController.m
//  DrugFinder
//
//  Created by Satish on 3/31/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "BloodBankSearchbyAddViewController.h"
#import "DBManager.h"
@interface BloodBankSearchbyAddViewController ()
@property (nonatomic, strong) DBManager *dbManager;

@property (nonatomic, strong) NSArray *arrqueryresult;
@end

@implementation BloodBankSearchbyAddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"bloodbank.db"];
    // Do any additional setup after loading the view.
   
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

- (IBAction)act_state:(id)sender {
    [self.state_uiview setHidden:NO];
    //[self.view addSubview:self.state_uiview];
   
    NSString *query =[NSString stringWithFormat:@"select (state) from bloodbank"] ;
    
    // Get the results.
    
    NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:arrayWithDuplicates];
    self.arrqueryresult = [orderedSet array];
       // NSLog(@"%@", self.arrqueryresult);
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Action Sheet" message:@"Using the alert controller" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        // Cancel button tappped.
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    [self presentViewController:actionSheet animated:YES completion:nil];
    

    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrqueryresult.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // Dequeue the cell.
    
    if (tableView == self.statetableview) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        
        
        NSInteger indexOfState = [self.dbManager.arrColumnNames indexOfObject:@"state"];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOfState]];
        
        return cell;
    }
    else if (tableView == self.citytableview)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        
        
        NSInteger indexOfState = [self.dbManager.arrColumnNames indexOfObject:@"city"];
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOfState]];
        
        return cell;
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //resultdic = arr2[indexPath.row];
    if (tableView == self.statetableview) {
    NSInteger indexOfState = [self.dbManager.arrColumnNames indexOfObject:@"state"];
    
   
   self.lbl_state.text = [[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOfState];
    
   [self.state_uiview setHidden:YES];
    }
    else if (tableView == self.citytableview)
    {
        NSInteger indexOfState = [self.dbManager.arrColumnNames indexOfObject:@"city"];
        
        
        self.lbl_city.text = [[self.arrqueryresult objectAtIndex:indexPath.row] objectAtIndex:indexOfState];
        
        [self.citytableview setHidden:YES];
    }
    
}


- (IBAction)act_city:(id)sender {
    [self.city_uiview setHidden:NO];
    //[self.view addSubview:self.state_uiview];
    
    NSString *query =[NSString stringWithFormat:@"select (city) from bloodbank where state='%@'",self.lbl_state] ;
    
    // Get the results.
    
    NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:arrayWithDuplicates];
    self.arrqueryresult = [orderedSet array];
    // NSLog(@"%@", self.arrqueryresult);
    [self.citytableview reloadData];
}
@end
