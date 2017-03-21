//
//  SingleDrugInteractionInfoTableViewController.h
//  DrugFinder
//
//  Created by Satish on 3/17/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleDrugInteractionInfoTableViewController : UITableViewController
{
    NSMutableArray *jsonarr;
    NSDictionary *dic;
    NSDictionary *suggestionGroup;
    NSDictionary *suggestionList;
    NSDictionary *suggestion;
    NSMutableDictionary *fullInteractionTypeGroup;
    NSMutableArray *fullInteractionType;
    //NSMutableDictionary *fullInteractionType;
    NSMutableDictionary *typdic;
    NSMutableArray *interactionPair;
    NSMutableArray*description;
    NSMutableArray *severity;
    NSMutableArray *interactionConcept;
    NSMutableArray *minConceptItem;
    NSMutableArray *name;
    NSMutableArray *nameeven;
    NSMutableArray *nameodd;
}
@property (nonatomic) NSString *strid;
@end
