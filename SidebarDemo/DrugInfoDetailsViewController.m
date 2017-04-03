//
//  DrugInfoDetailsViewController.m
//  SidebarDemo
//
//  Created by Satish on 3/12/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "DrugInfoDetailsViewController.h"
#import "DrugInfoAllTableViewController.h"
@interface DrugInfoDetailsViewController ()

@end

@implementation DrugInfoDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.strname;
    // Do any additional setup after loading the view.
    // https://rxnav.nlm.nih.gov/REST/drugs?name=cymbalta
    
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
    [self.tableview reloadData];

    
//
//    arr2 = [arr23 objectAtIndex:0];
}
-(void)loaddata {
     [loadingView setHidden:NO];
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
     [loadingView setHidden:YES];
    if (dic == nil) {
        [self loaddata];
    }
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
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = [resultdic objectForKey:@"name"];
    
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    resultdic = arr2[indexPath.row];
    DrugInfoAllTableViewController *dfd = [self.storyboard instantiateViewControllerWithIdentifier:@"alldruginfotable"];
    dfd.rxcui = [resultdic objectForKey:@"rxcui"];
    dfd.popname = self.strname;
    [self.navigationController pushViewController:dfd animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
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
