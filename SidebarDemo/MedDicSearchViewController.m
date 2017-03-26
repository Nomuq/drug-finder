//
//  MedDicSearchViewController.m
//  DrugFinder
//
//  Created by Satish on 3/26/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "MedDicSearchViewController.h"
#import "SWRevealViewController.h"
#import <Foundation/Foundation.h>
@interface MedDicSearchViewController ()
@property (nonatomic, strong) NSXMLParser *xmlParser;

@property (nonatomic, strong) NSMutableArray *arrNeighboursData;

@property (nonatomic, strong) NSMutableDictionary *dictTempDataStorage;

@property (nonatomic, strong) NSMutableString *foundValue;
@property (nonatomic, strong) NSMutableArray *tempfile;
@property (nonatomic, strong) NSString *currentElement;
@property (nonatomic, strong) NSArray *arrqueryresult;
@property (nonatomic, strong) NSMutableArray *arrtitle;
@property (nonatomic, strong) NSMutableArray *arrdesc;
@property (nonatomic, strong) NSMutableArray *arrqsound;
@property (nonatomic, strong) NSString *flag;

@property (nonatomic, strong) NSMutableDictionary *final;


@end

@implementation MedDicSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.uiview_info.hidden = YES;
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
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
    if([self.txt_search.text length] > 3)
    {
        
        
        NSString *str =[NSString stringWithFormat:@"https://www.dictionaryapi.com/api/references/medical/v2/xml/%@?key=e77e4ed7-2ad4-4cf0-a583-c6f94641eab8",self.txt_search.text];
        NSURL *url = [[NSURL alloc]initWithString:str];
        NSData *data =[[NSData alloc]initWithContentsOfURL:url];
        //NSLog(@"%@", data);
        if (data != nil) {
            self.xmlParser = [[NSXMLParser alloc] initWithData:data];
            self.xmlParser.delegate = self;
            
            self.tempfile = [[NSMutableArray alloc]init];
                    self.arrtitle = [[NSMutableArray alloc]init];
                    self.arrdesc = [[NSMutableArray alloc]init];
                    self.arrqsound = [[NSMutableArray alloc]init];
            // Start parsing.
            [self.xmlParser parse];
            
            
            
            NSArray *arrayWithDuplicates = [[NSArray alloc] initWithArray:self.tempfile];
            NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:arrayWithDuplicates];
            self.arrqueryresult = [orderedSet array];
            //NSLog(@"%@", self.arrqueryresult);
             [_tableview reloadData];
        }
        
        [_tableview reloadData];
        
    }
    else
    {
        self.arrqueryresult = nil;
        [_tableview reloadData];
    }
}

- (IBAction)act_search_end:(id)sender {
    [self.view endEditing:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.arrqueryresult.count;
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
     if (![self.arrqueryresult[indexPath.row] isEqual:@"\n\t"] || ![self.arrqueryresult[indexPath.row] isEqual:@"\n"] ) {
        cell.textLabel.text = self.arrqueryresult[indexPath.row];
   
     }
    
    
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
}
    
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
//- (IBAction)act_search_end:(id)sender {
//    [self.view endEditing:YES];
//}
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
    if ([self.currentElement isEqual:@"suggestion"]) {
        self.flag = @"false";
        //NSLog(@"%@", string);
        NSString * newReplacedString1 = [string stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        NSString * newReplacedString = [newReplacedString1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        if (![newReplacedString isEqual:@""]) {
            [self.tempfile addObject:newReplacedString];
        }
        
        
        
    }
    
    if ([self.currentElement isEqual:@"ew"]) {
        self.flag = @"true";
        //NSLog(@"%@", string);
        
            self.tempfile = [[NSMutableArray alloc]init];
            [self.tempfile addObject:self.txt_search.text];
        
        
        
        
    }
    }

@end
