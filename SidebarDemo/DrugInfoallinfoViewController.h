//
//  DrugInfoallinfoViewController.h
//  SidebarDemo
//
//  Created by Satish on 3/13/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "ViewController.h"

@interface DrugInfoallinfoViewController : ViewController
{
    NSDictionary *dic2;
}

@property (nonatomic) NSString *rxcui;

@property (weak, nonatomic) IBOutlet UITextView *brandname;

@property (weak, nonatomic) IBOutlet UITextView *displayname;

@property (weak, nonatomic) IBOutlet UITextView *synonym;

@property (weak, nonatomic) IBOutlet UITextView *fullname;

@property (weak, nonatomic) IBOutlet UITextView *fullgenericname;

@property (weak, nonatomic) IBOutlet UITextView *route;

@property (weak, nonatomic) IBOutlet UITextView *dosefrom;

@property (weak, nonatomic) IBOutlet UITextView *suppress;

@property (weak, nonatomic) IBOutlet UITextView *strength;


@end
