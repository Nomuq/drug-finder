//
//  DoctorFullinfoViewController.h
//  DrugFinder
//
//  Created by Satish on 3/14/17.
//  Copyright © 2017 AppCoda. All rights reserved.
//

#import "ViewController.h"

@interface DoctorFullinfoViewController : ViewController

@property (nonatomic) NSString *ProfileID;
@property (nonatomic) NSString *FirstName;
@property (nonatomic) NSString *LastName;
@property (nonatomic) NSString *AddLine1;
@property (nonatomic) NSString *AddLine2;
@property (nonatomic) NSString *City;
@property (nonatomic) NSString *State;
@property (nonatomic) NSString *Zipcode;
@property (nonatomic) NSString *Country;
@property (nonatomic) NSString *Type;
@property (nonatomic) NSString *Specility;


@property (weak, nonatomic) IBOutlet UILabel *pid;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *ptype;
@property (weak, nonatomic) IBOutlet UITextView *pspecility;
@property (weak, nonatomic) IBOutlet UILabel *aline1;
@property (weak, nonatomic) IBOutlet UILabel *aline2;
@property (weak, nonatomic) IBOutlet UILabel *addcity;
@property (weak, nonatomic) IBOutlet UILabel *addstate;
@property (weak, nonatomic) IBOutlet UILabel *addzipcode;
@property (weak, nonatomic) IBOutlet UILabel *addcounty;

@end
