//
//  DrugInfoViewController.m
//  SidebarDemo
//
//  Created by Satish on 3/12/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "DrugInfoViewController.h"
#import "SWRevealViewController.h"
#import <Foundation/Foundation.h>
#import "DrugInfoDetailsViewController.h"
@interface DrugInfoViewController ()

@end

@implementation DrugInfoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.title = @"Drug Info";
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    [self.txt_search becomeFirstResponder];
    //    NSLog(@"%@", jsonarr);
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
        @try {
            NSData *data =[[NSData alloc]initWithContentsOfURL:url];
            dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        } @catch (NSException *exception) {
            NSLog(@"%@", exception);
        }
        
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

    
    DrugInfoDetailsViewController *dfd = [self.storyboard instantiateViewControllerWithIdentifier:@"druginfodetails"];
    dfd.strname = jsonarr[indexPath.row];
    
    
    [self.navigationController pushViewController:dfd animated:YES];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)act_search_end:(id)sender {
    [self.view endEditing:YES];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}
@end
