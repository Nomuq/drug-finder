//
//  MainViewController.h
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIButton *DrugInfo;

@property (weak, nonatomic) IBOutlet UIButton *DoctorList;

@property (weak, nonatomic) IBOutlet UIButton *Interaction;

@property (weak, nonatomic) IBOutlet UIButton *HealthTopics;
@property (weak, nonatomic) IBOutlet UIButton *Finder;

@property (weak, nonatomic) IBOutlet UIButton *LactMed;


@property (weak, nonatomic) IBOutlet UIButton *CCRIS;

@property (weak, nonatomic) IBOutlet UIButton *HSDB;
@property (weak, nonatomic) IBOutlet UIButton *ChemID;
@property (weak, nonatomic) IBOutlet UIButton *AIDSMeds;
@property (weak, nonatomic) IBOutlet UIButton *Dict;
@property (weak, nonatomic) IBOutlet UIButton *About;

- (IBAction)DrugInfo:(id)sender;



@end
