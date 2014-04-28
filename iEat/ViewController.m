//
//  ViewController.m
//  iEat
//
//  Created by German Zuniga on 4/27/14.
//  Copyright (c) 2014 German Zuniga. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, strong) NSMutableArray * list;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.textLabel.text = @"";
    self.textField.hidden = YES;
    self.textField.delegate = self;
    
    // Make a list of restaurants if the view loads
    self.list = [NSMutableArray arrayWithObjects:@"McDonald's",@"Whataburger",@"Jack In the Box",@"Chick-fil-a",@"Wendy's",@"IHOP",@"Khan's Grill",@"Longhorn Steakhouse",@"Olive Garden", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender
{
    // Action if button is pressed
    NSUInteger randomNumber = arc4random() % self.list.count;
    self.textLabel.text = self.list[randomNumber];
}

- (IBAction)addButtonPressed:(id)sender {
    // Action button reveals text field to input custom entries
    self.textField.hidden = NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // Adds input to our list, hides/clears textField & keyboard, neat-o
    [self.list addObject:self.textField.text];
    self.textField.hidden = YES;
    self.textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}
@end
