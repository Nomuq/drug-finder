//
//  CheckForIneractionTableViewController.h
//  DrugFinder
//
//  Created by Satish on 3/15/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckForIneractionTableViewController : UITableViewController
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
@property (nonatomic) NSArray *arrid;
@end
