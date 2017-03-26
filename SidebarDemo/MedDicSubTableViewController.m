//
//  MedDicSubTableViewController.m
//  DrugFinder
//
//  Created by Satish on 3/26/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "MedDicSubTableViewController.h"


@interface MedDicSubTableViewController ()
@property (nonatomic, strong) NSXMLParser *xmlParser;

@property (nonatomic, strong) NSMutableArray *arrNeighboursData;

@property (nonatomic, strong) NSMutableDictionary *dictTempDataStorage;

@property (nonatomic, strong) NSMutableString *foundValue;
@property (nonatomic, strong) NSMutableArray *tempfile;
@property (nonatomic, strong) NSString *currentElement;
@property (nonatomic, strong) NSArray *arrqueryresult;
@property (nonatomic, strong) NSMutableArray *finalarr;
@property (nonatomic, strong) NSMutableArray *arrtitle;
@property (nonatomic, strong) NSMutableArray *arrdesc;
@property (nonatomic, strong) NSMutableArray *arrqsound;
@property (nonatomic, strong) NSString *flag;
@property (nonatomic, strong) NSMutableDictionary *final;
@end

@implementation MedDicSubTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str =[NSString stringWithFormat:@"https://www.dictionaryapi.com/api/references/medical/v2/xml/%@?key=e77e4ed7-2ad4-4cf0-a583-c6f94641eab8",self.title];
    NSURL *url = [[NSURL alloc]initWithString:str];
    NSData *data =[[NSData alloc]initWithContentsOfURL:url];
    //NSLog(@"%@", data);
    if (data != nil) {
        self.xmlParser = [[NSXMLParser alloc] initWithData:data];
        self.xmlParser.delegate = self;
        self.final = [[NSMutableDictionary alloc]init];
        self.finalarr = [[NSMutableArray alloc]init];
        self.arrtitle = [[NSMutableArray alloc]init];
        self.arrdesc = [[NSMutableArray alloc]init];
        self.arrqsound = [[NSMutableArray alloc]init];
        // Start parsing.
        [self.xmlParser parse];
        
        
        
        //NSLog(@"%@", self.final);
       // [_tableview reloadData];
    }
    else
    {
        self.final = nil;
        //[_tableview reloadData];
    }
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrtitle.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.arrtitle[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *str2 = [[NSString alloc]init];
    
    NSString *str1 = self.arrtitle[indexPath.row];
    if (indexPath.row < self.arrdesc.count) {
        str2  = self.arrdesc[indexPath.row];
    }
    
    //NSLog(@"%@", str1);
    
    
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:str1
                                                                   message:str2
                                
                                                            preferredStyle:UIAlertControllerStyleAlert];
    //UIAlertAction* play = [UIAlertAction actionWithTitle:@"Play" style:UIAlertActionStyleDefault
//                                                 handler:^(UIAlertAction * action) {
                                                     //NSString *firstLetter = [self.arrqsound[indexPath.row] substringFromIndex:1];
//                                                     NSString *str11 =[NSString stringWithFormat:@"http://media.merriam-webster.com/soundc11/%@/%@",firstLetter,self.arrqsound[indexPath.row]];
//                                                     NSURL *url2 = [[NSURL alloc]initWithString:@"https://media.merriam-webster.com/soundc11/h/heart001.wav"];
////                                                     AVPlayerItem *item = [[AVPlayerItem alloc]initWithURL:url];
////                                                     AVAudioPlayer *player = [[AVPlayer alloc]initWithPlayerItem:item];
////                                                     [player play];
//                                                      AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url2 error:nil];
//                                                     [audioPlayer prepareToPlay];
//                                                     [audioPlayer play];
                                                     
//                                                 }];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                          }];
    //[alert addAction:play];
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
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    // If the current element name is equal to "geoname" then initialize the temporary dictionary.
    if ([elementName isEqualToString:@"entry_list"]) {
        self.dictTempDataStorage = [[NSMutableDictionary alloc] init];
    }
    
    // Keep the current element.
    self.currentElement = elementName;
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if ([elementName isEqualToString:@"entry_list"]) {
        // If the closing element equals to "geoname" then the all the data of a neighbour country has been parsed and the dictionary should be added to the neighbours data array.
        [self.arrNeighboursData addObject:[[NSDictionary alloc] initWithDictionary:self.dictTempDataStorage]];
    }
    
    // Clear the mutable string.
    [self.foundValue setString:@""];
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    // Store the found characters if only we're interested in the current element.
    //NSLog(@"%@", self.currentElement);
    
    if ([self.currentElement isEqual:@"ew"]) {
        self.flag = @"true";
        //NSLog(@"%@", string);
        NSString * newReplacedString1 = [string stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        NSString * newReplacedString = [newReplacedString1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        if (![newReplacedString isEqual:@""]) {
            [self.arrtitle addObject:newReplacedString];
        }
        
        // [self.arrtitle addObject:string];
        
        
        
    }
    if ([self.currentElement isEqual:@"dt"]) {
        self.flag = @"true";
        //NSLog(@"%@", string);
        NSString * newReplacedString1 = [string stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        NSString * newReplacedString = [newReplacedString1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        //NSLog(@"%@", newReplacedString);
        if (![newReplacedString isEqual:@""]) {
            [self.arrdesc addObject:newReplacedString];
        }
        //   [self.arrdesc addObject:string];
        
        
    }
    
    if ([self.currentElement isEqual:@"wav"]) {
        self.flag = @"true";
        //NSLog(@"%@", string);
        NSString * newReplacedString1 = [string stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        NSString * newReplacedString = [newReplacedString1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        if (![newReplacedString isEqual:@""]) {
            [self.arrqsound addObject:newReplacedString];
        }
        //[self.arrqsound addObject:string];
        
        
    }
    
    
}


@end
