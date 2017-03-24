//
//  DrugInfoallinfoViewController.m
//  SidebarDemo
//
//  Created by Satish on 3/13/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "DrugInfoallinfoViewController.h"

@interface DrugInfoallinfoViewController ()

@end

@implementation DrugInfoallinfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", _rxcui);
    NSString *str =[NSString stringWithFormat:@"https://rxnav.nlm.nih.gov/REST/RxTerms/rxcui/%@/allinfo.json",self.rxcui];
    NSURL *url = [[NSURL alloc]initWithString:str];
    NSData *data =[[NSData alloc]initWithContentsOfURL:url];
    dic2 = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSLog(@"%@", dic2);
    NSDictionary *dic = [dic2 objectForKey:@"rxtermsProperties"];
    self.title = @"Info";
    
    _brandname.text =  [dic objectForKey:@"displayName"];
    _displayname.text =  [dic objectForKey:@"displayName"];
    _synonym.text =  [dic objectForKey:@"synonym"];
    _fullname.text =  [dic objectForKey:@"fullName"];
    
    _fullgenericname.text =  [dic objectForKey:@"fullGenericName"];
    
    _strength.text = [dic objectForKey:@"strength"];
    
    _route.text = [dic objectForKey:@"route"];
    _dosefrom.text = [dic objectForKey:@"rxnormDoseForm"];
    _suppress.text = [dic objectForKey:@"suppress"];
    
    
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
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
