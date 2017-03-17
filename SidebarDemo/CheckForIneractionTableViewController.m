//
//  CheckForIneractionTableViewController.m
//  DrugFinder
//
//  Created by Satish on 3/15/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "CheckForIneractionTableViewController.h"

@interface CheckForIneractionTableViewController ()

@end

@implementation CheckForIneractionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSString *str = [[NSString alloc]init];
    //NSLog(@"%@", _arrid);
    if (self.arrid.count == 2) {
        
       
        str =[NSString stringWithFormat:@"https://rxnav.nlm.nih.gov/REST/interaction/list.json?rxcuis=%@+%@",[self.arrid objectAtIndex:0],[self.arrid objectAtIndex:1]];
    }
    else if (self.arrid.count == 3)
    {
        str =[NSString stringWithFormat:@"https://rxnav.nlm.nih.gov/REST/interaction/list.json?rxcuis=%@+%@+%@",[self.arrid objectAtIndex:0],[self.arrid objectAtIndex:1],[self.arrid objectAtIndex:2]];
    }
    else if (self.arrid.count == 4)
    {
         str =[NSString stringWithFormat:@"https://rxnav.nlm.nih.gov/REST/interaction/list.json?rxcuis=%@+%@+%@+%@",[self.arrid objectAtIndex:0],[self.arrid objectAtIndex:1],[self.arrid objectAtIndex:2],[self.arrid objectAtIndex:3]];
    }
    else if (self.arrid.count == 5)
    {
         str =[NSString stringWithFormat:@"https://rxnav.nlm.nih.gov/REST/interaction/list.json?rxcuis=%@+%@+%@+%@+%@",[self.arrid objectAtIndex:0],[self.arrid objectAtIndex:1],[self.arrid objectAtIndex:2],[self.arrid objectAtIndex:3],[self.arrid objectAtIndex:4]];
    }
    else if (self.arrid.count == 6)
    {
         str =[NSString stringWithFormat:@"https://rxnav.nlm.nih.gov/REST/interaction/list.json?rxcuis=%@+%@+%@+%@+%@+%@",[self.arrid objectAtIndex:0],[self.arrid objectAtIndex:1],[self.arrid objectAtIndex:2],[self.arrid objectAtIndex:3],[self.arrid objectAtIndex:4],[self.arrid objectAtIndex:5]];
    }
        else if (self.arrid.count == 7)
        {
             str =[NSString stringWithFormat:@"https://rxnav.nlm.nih.gov/REST/interaction/list.json?rxcuis=%@+%@+%@+%@+%@+%@+%@",[self.arrid objectAtIndex:0],[self.arrid objectAtIndex:1],[self.arrid objectAtIndex:2],[self.arrid objectAtIndex:3],[self.arrid objectAtIndex:4],[self.arrid objectAtIndex:5],[self.arrid objectAtIndex:6]];
        }
            else if (self.arrid.count == 8)
            {
                 str =[NSString stringWithFormat:@"https://rxnav.nlm.nih.gov/REST/interaction/list.json?rxcuis=%@+%@+%@+%@+%@+%@+%@+%@",[self.arrid objectAtIndex:0],[self.arrid objectAtIndex:1],[self.arrid objectAtIndex:2],[self.arrid objectAtIndex:3],[self.arrid objectAtIndex:4],[self.arrid objectAtIndex:5],[self.arrid objectAtIndex:6],[self.arrid objectAtIndex:7]];
            }
                else if (self.arrid.count == 9)
                {
                     str =[NSString stringWithFormat:@"https://rxnav.nlm.nih.gov/REST/interaction/list.json?rxcuis=%@+%@+%@+%@+%@+%@+%@+%@+%@",[self.arrid objectAtIndex:0],[self.arrid objectAtIndex:1],[self.arrid objectAtIndex:2],[self.arrid objectAtIndex:3],[self.arrid objectAtIndex:4],[self.arrid objectAtIndex:5],[self.arrid objectAtIndex:6],[self.arrid objectAtIndex:7],[self.arrid objectAtIndex:8]];
                }
                    else if (self.arrid.count == 10)
                    {
                         str =[NSString stringWithFormat:@"https://rxnav.nlm.nih.gov/REST/interaction/list.json?rxcuis=%@+%@+%@+%@+%@+%@+%@+%@+%@+%@",[self.arrid objectAtIndex:0],[self.arrid objectAtIndex:1],[self.arrid objectAtIndex:2],[self.arrid objectAtIndex:3],[self.arrid objectAtIndex:4],[self.arrid objectAtIndex:5],[self.arrid objectAtIndex:6],[self.arrid objectAtIndex:7],[self.arrid objectAtIndex:8],[self.arrid objectAtIndex:9]];


}
    //NSString *str =[NSString stringWithFormat:@"https://rxnav.nlm.nih.gov/REST/interaction/list.json?rxcuis=207106+152923+656659"];
    NSURL *url = [[NSURL alloc]initWithString:str];
    NSData *data =[[NSData alloc]initWithContentsOfURL:url];
    dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *array = [dic valueForKey:@"fullInteractionTypeGroup"];
    fullInteractionType = [[NSMutableArray alloc]init];
    for (NSDictionary *dict in array) {
        
        //fullInteractionType = [dict objectForKey:@"fullInteractionType"];
         NSDictionary *str = [dict objectForKey:@"fullInteractionType"];
        //NSLog(@"%@", str);
        [fullInteractionType addObject:str];
        
    }
   
    
    
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
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return description.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@  ->  %@",nameeven[indexPath.row],nameodd[indexPath.row]];
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
