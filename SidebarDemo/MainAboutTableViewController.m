//
//  MainAboutTableViewController.m
//  DrugFinder
//
//  Created by Satish on 3/29/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "MainAboutTableViewController.h"

@interface MainAboutTableViewController ()

@end
NSArray *sectionname2;
NSArray *sectionname2details;
@implementation MainAboutTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    sectionname2 = @[@"Drug Info",@"Doctor List",@"Interaction",@"Health Topics",@"Finder",@"LactMed",@"CCRIS",@"HSDB",@"ChemID",@"AIDS Meds",@"Dictionary"];
    sectionname2details = @[@"The DrugInfo search function contains Full information on drugs",
                            @"List of doctor by Address or Name or Specility",
                            @"The Interaction is a function for accessing drug-drug interactions. also you can Get the drug interactions for a specified drug. ",
                            @"Read about symptoms, causes, treatment and prevention for over 1000 diseases, illnesses, health conditions and wellness issues. MedlinePlus health topics are regularly reviewed, and links are updated daily.",
                            @"Find Neararest drug store",
                            @"The LactMed search function contains information on drugs and other chemicals to which breastfeeding mothers may be exposed. It includes information on the levels of such substances in breast milk and infant blood, and the possible adverse effects in the nursing infant. Suggested therapeutic alternatives to those drugs are provided, where appropriate. All data are derived from the scientific literature and fully referenced. A peer review panel reviews the data to assure scientific validity and currency.",
                            @"The CCRIS Search function contains chemical records with carcinogenicity, mutagenicity, tumor promotion, and tumor inhibition test results. It was developed by the National Cancer Institute (NCI). Data are derived from studies cited in primary journals, current awareness tools, NCI reports, and other sources. Test results have been reviewed by experts in carcinogenesis and mutagenesis. CCRIS provides historical information from the years 1985 - 2011. It is no longer updated.",
                            @"HSDB is a toxicology search function that focuses on the toxicology of potentially hazardous chemicals. It provides information on human exposure, industrial hygiene, emergency handling procedures, environmental fate, regulatory requirements, nanomaterials, and related areas.",
                            @"ChemIDplus is a Search function of over 400,000 chemicals (names, synonyms, and structures).",
                            @"This function use to find accessing drug information for HIV/AIDS.",
                            @"This up-to-date dictionary of medical terms and definitions is designed for health-care professionals or anyone who needs explanations of current medical vocabulary. More than 60,000 entries. Pronunciations provided for most entries. Covers the latest brand names and generic equivalents of common drugs."];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return sectionname2.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionname2 objectAtIndex:section];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:17]];
    NSString *string =[sectionname2 objectAtIndex:section];
    /* Section header is in 0th index... */
    [label setText:string];
    [view addSubview:label];
    [view setBackgroundColor:[UIColor whiteColor]]; //your background color...
    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;

        cell.textLabel.text = [sectionname2details objectAtIndex:indexPath.section];
    
    
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
