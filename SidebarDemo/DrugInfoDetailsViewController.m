//
//  DrugInfoDetailsViewController.m
//  SidebarDemo
//
//  Created by Satish on 3/12/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "DrugInfoDetailsViewController.h"
#import "DrugInfoallinfoViewController.h"

@interface DrugInfoDetailsViewController ()

@end

@implementation DrugInfoDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.strname;
    // Do any additional setup after loading the view.
    // https://rxnav.nlm.nih.gov/REST/drugs?name=cymbalta

    NSString *str =[NSString stringWithFormat:@"https://rxnav.nlm.nih.gov/REST/drugs.json?name=%@",self.strname];
    NSURL *url = [[NSURL alloc]initWithString:str];
    @try {
        NSData *data =[[NSData alloc]initWithContentsOfURL:url];
        dic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
   
    
    
    drugGroup = [dic objectForKey:@"drugGroup"];
    NSMutableArray *arr = [drugGroup objectForKey:@"conceptGroup"];
    //conceptProperties = [conceptGroup objectForKey:@"conceptProperties"];
    //[conceptGroup removeObjectForKey:@"tty"];
    //conceptProperties = [arr objectAtIndex:1];
    //arr2 = [conceptProperties objectForKey:@"conceptProperties"];
    
    for (conceptProperties in arr) {
        arr2 = [conceptProperties objectForKey:@"conceptProperties"];
    }
//
//    arr2 = [arr23 objectAtIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return arr2.count;
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
    resultdic = arr2[indexPath.row];
    //NSLog(@"%@", resultdic);
    cell.textLabel.text = [resultdic objectForKey:@"name"];
    
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    resultdic = arr2[indexPath.row];
    DrugInfoallinfoViewController *dfd = [self.storyboard instantiateViewControllerWithIdentifier:@"alldruginfo"];
    dfd.rxcui = [resultdic objectForKey:@"rxcui"];
    
    [self.navigationController pushViewController:dfd animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
