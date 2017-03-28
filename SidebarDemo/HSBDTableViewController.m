//
//  HSBDTableViewController.m
//  DrugFinder
//
//  Created by Satish on 3/28/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "HSBDTableViewController.h"
#import <Foundation/Foundation.h>

@interface HSBDTableViewController ()

@end
NSArray *sectionname;
NSArray *section0;
NSArray *section1;
NSArray *section2;
NSArray *section3;
NSArray *section4;
NSArray *section5;
NSArray *section6;
NSArray *section0db;
NSArray *section1db;
NSArray *section2db;
NSArray *section3db;
NSArray *section4db;
NSArray *section5db;
NSArray *section6db;
@implementation HSBDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.title2;
    
    sectionname = @[@"Substance Identification",@"Manufacturing/Use Information",@"Chemical and Physical Properties",@"Safety and Handling",@"Toxicity/Biomedical Effects",@"Pharmacology",@"Environmental Fate/Exposure Potential"];
                    
                    
                    section0 = @[@"Name of Substance",@"CAS Registry Number",@"Synonyms",@"Molecular Formula",@"Associated Chemicals"];
                    
                    section0db = @[@"name",@"rn",@"sy",@"mf",@"asch"];
                    
                    
                    section1= @[@"Methods of Manufacturing",@"Impurities",@"Formulations/Preparations",@"Manufacturers",@"Major Uses"];
                    
                    section1db= @[@"mmfg",@"imp",@"form",@"mfs",@"use"];
                    
                    
                    section2= @[@"Color/Form",@"Odor",@"Taste",@"Boiling Point",@"Melting Point",@"Molecular Weight",@"Corrosivity",@"Critical Temperature and Pressure",@"Density/Specific Gravity",@"Dissociation Constants",@"Heat of Combustion",@"Heat of Vaporization",@"Octanol/Water Partition Coefficient",@"pH",@"Solubilities",@"Spectral Properties",@"Surface Tension",@"Vapor Density",@"Vapor Pressure",@"Relative Evaporation Rate",@"Viscosity",@"Other Chemical/Physical Properties"];
                    
                    section2db= @[@"cofo",@"odor",@"tast",@"bp",@"mp",@"mw",@"corr",@"ctp",@"den",@"dsc",@"htc",@"htv",@"owpc",@"ph",@"sol",@"spec",@"surf",@"vapd",@"vap",@"evap",@"visc",@"ocpp"];
                    
                    
                    
                    
                    section3= @[@"Hazards Summary",@"DOT Emergency Guidelines",@"Fire Potential",@"NFPA Hazard Classification",@"Flammable Limits",@"Flash Point",@"Autoignition Temperature",@"Fire Fighting Procedures",@"Toxic Combustion Products",@"Other Fire Fighting Hazards",@"Explosive Limits and Potential",@"Reactivities and Incompatibilities",@"Decomposition",@"Polymerization",@"Other Hazardous Reactions",@"Odor Threshold",@"Skin, Eye, and Respiratory Irritations",@"Protective Equipment and Clothing",@"Other Preventative Measures",@"Stability/Shelf Life",@"Shipment Methods and Regulations",@"Storage Conditions",@"Cleanup Methods",@"Disposal Methods",@"Radiation Limits and Potential"];
                    
                    section3db= @[@"hazs",@"dot",@"fpot",@"nfpa",@"flmt",@"flpt",@"auto",@"firp",@"toxc",@"ofhz",@"expl",@"reac",@"dcmp",@"poly",@"ohaz",@"odrt",@"seri",@"equm",@"oprm",@"ssl",@"ship",@"strg",@"clup",@"disp",@"radl"];
                    
                    
                    
                    section4= @[@"Toxicity Summary",@"Antidote and Emergency Treatment",@"Medical Surveillance",@"Human Toxicity Excerpts",@"Non-Human Toxicity Excerpts",@"Human Toxicity Values",@"Non-Human Toxicity Values",@"Ecotoxicity Values",@"National Toxicology Program Reports",@"TSCA Test Submissions",@"Populations at Special Risk",@"Absorption, Distribution and Excretion",@"Metabolism/Metabolites",@"Biological Half-Life",@"Mechanism of Action",@"Interactions"];
                    
                    section4db= @[@"toxs",@"antr",@"meds",@"htox",@"ntox",@"htxv",@"ntxv",@"etxv",@"ntp",@"tcat",@"popl",@"ade",@"metb",@"bhl",@"actn",@"intc"];
                    
                    
                    
                    section5= @[@"Bionecessity",@"Theraputic Uses",@"Drug Warning",@"Drug Idiosyncracies",@"Drug Tolerance"];
                    
                    section5db= @[@"bion",@"ther",@"warn",@"idio",@"tolr"];
                    
                    
                    
                    section6= @[@"Environmental Fate/Exposure Summary",@"Natural Occurring Sources",@"Artificial Sources",@"Environmental Fate",@"Biodegredation",@"Abiotic Degredation",@"Bioconcentration",@"Soil Adsorption/Mobility",@"Volatilization from Water/Soil",@"Water Concentrations",@"Effluents Concentrations",@"Sediment/Soil Concentrations",@"Atmospheric Concentrations",@"Food Survey Values",@"Plant Concentrations",@"Fish/Seafood Concentrations",@"Animal Concentrations",@"Milk Concentrations",@"Other Environmental Concentrations",@"Probable Routes of Human Exposure",@"Average Daily Intake",@"Body Burdens"];
                    
                    section6db= @[@"envs",@"nats",@"arts",@"fate",@"biod",@"abio",@"bioc",@"koc",@"vws",@"watc",@"effl",@"seds",@"atmc",@"food",@"plnt",@"fish",@"anml",@"milk",@"oevc",@"rtex",@"avdi",@"body"];
    
    
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
    NSString *str =[NSString stringWithFormat:@"https://hsdb.restlet.net/v1/hsdbs/?media=json&id=%@",self.id2];
    NSDictionary *headers = @{ @"host": @"hsdb.restlet.net",
                               @"accept": @"application/json",
                               @"content-type": @"application/json"};
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:str]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    [request setAllHTTPHeaderFields:headers];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    } else {
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        NSLog(@"%@", httpResponse);
                                                        
                                                        self.dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                                                        //NSLog(@"%@", self.dict);
                                                        [self.tableView reloadData];
                                                        [loadingView setHidden:YES];
                                                    }
                                                }];
    [dataTask resume];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return sectionname.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionname objectAtIndex:section];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:17]];
    NSString *string =[sectionname objectAtIndex:section];
    /* Section header is in 0th index... */
    [label setText:string];
    [view addSubview:label];
   [view setBackgroundColor:[UIColor colorWithRed:196/255.0 green:255/255.0 blue:248/255.0 alpha:1.0]]; //your background color...
    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger seccount = 0;
    if (section == 0) {
        seccount = section0.count;
        
    }
    if (section == 1) {
        seccount = section1.count;
    }
    
    if (section == 2) {
        seccount = section2.count;
    }
    if (section == 3) {
        seccount = section3.count;
    }
    if (section == 4) {
        seccount = section4.count;
    }
    if (section == 5) {
        seccount = section5.count;
    }
    if (section == 6) {
        seccount = section6.count;
    }
    
    return seccount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        //cell.textLabel.text = [sec0 objectAtIndex:indexPath.row];
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        NSString *str11 = [section0db objectAtIndex:indexPath.row];
        NSString *str33 = [[NSString alloc]init];
        for (NSDictionary *dic in self.dict) {
            str33 = [dic objectForKey:str11];
        }
        if ([str33 isEqual:@"$null$"]) {
            str33 = @"nil";
        }
        
        NSString *str22 = [[NSString alloc]initWithFormat:@"%@ : \n%@",[section0 objectAtIndex:indexPath.row],str33];
        cell.textLabel.text = str22;
    }
    if (indexPath.section == 1) {
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        NSString *str11 = [section1db objectAtIndex:indexPath.row];
        NSString *str33 = [[NSString alloc]init];
        for (NSDictionary *dic in self.dict) {
            str33 = [dic objectForKey:str11];
        }
        if ([str33 isEqual:@"$null$"]) {
            str33 = @"nil";
        }
        NSString *str22 = [[NSString alloc]initWithFormat:@"%@ : \n%@",[section1 objectAtIndex:indexPath.row],str33];
        cell.textLabel.text = str22;
    }
    
    if (indexPath.section == 2) {
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        NSString *str11 = [section2db objectAtIndex:indexPath.row];
        NSString *str33 = [[NSString alloc]init];
        for (NSDictionary *dic in self.dict) {
            str33 = [dic objectForKey:str11];
        }
        if ([str33 isEqual:@"$null$"]) {
            str33 = @"nil";
        }
        NSString *str22 = [[NSString alloc]initWithFormat:@"%@ : \n%@",[section2 objectAtIndex:indexPath.row],str33];
        cell.textLabel.text = str22;
    }
    if (indexPath.section == 3) {
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        NSString *str11 = [section3db objectAtIndex:indexPath.row];
        NSString *str33 = [[NSString alloc]init];
        for (NSDictionary *dic in self.dict) {
            str33 = [dic objectForKey:str11];
        }
        if ([str33 isEqual:@"$null$"]) {
            str33 = @"nil";
        }
        NSString *str22 = [[NSString alloc]initWithFormat:@"%@ : \n%@",[section3 objectAtIndex:indexPath.row],str33];
        cell.textLabel.text = str22;
    }
    if (indexPath.section == 4) {
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        NSString *str11 = [section4db objectAtIndex:indexPath.row];
        NSString *str33 = [[NSString alloc]init];
        for (NSDictionary *dic in self.dict) {
            str33 = [dic objectForKey:str11];
        }
        if ([str33 isEqual:@"$null$"]) {
            str33 = @"nil";
        }
        NSString *str22 = [[NSString alloc]initWithFormat:@"%@ : \n%@",[section4 objectAtIndex:indexPath.row],str33];
        cell.textLabel.text = str22;
    }
    if (indexPath.section == 5) {
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        NSString *str11 = [section5db objectAtIndex:indexPath.row];
        NSString *str33 = [[NSString alloc]init];
        for (NSDictionary *dic in self.dict) {
            str33 = [dic objectForKey:str11];
        }
        if ([str33 isEqual:@"$null$"]) {
            str33 = @"nil";
        }
        NSString *str22 = [[NSString alloc]initWithFormat:@"%@ : \n%@",[section5 objectAtIndex:indexPath.row],str33];
        cell.textLabel.text = str22;
    }
    if (indexPath.section == 6) {
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        NSString *str11 = [section6db objectAtIndex:indexPath.row];
        NSString *str33 = [[NSString alloc]init];
        for (NSDictionary *dic in self.dict) {
            str33 = [dic objectForKey:str11];
        }
        if ([str33 isEqual:@"$null$"]) {
            str33 = @"nil";
        }
        NSString *str22 = [[NSString alloc]initWithFormat:@"%@ : \n%@",[section6 objectAtIndex:indexPath.row],str33];
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
