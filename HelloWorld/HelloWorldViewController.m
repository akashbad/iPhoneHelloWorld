//
//  HelloWorldViewController.m
//  HelloWorld
//
//  Created by Akash Badshah on 8/14/13.
//  Copyright (c) 2013 Akash Badshah. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)changeGreeting:(id)sender;

@end

@implementation HelloWorldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeGreeting:(id)sender {
    self.userName = self.textField.text;
    
    NSString *nameString = [self.userName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if([nameString length] == 0){
        nameString = @"World";
    }
    
    NSString *greeting = [[NSString alloc] initWithFormat:@"Hello, %@!", nameString];
    
    self.label.text = greeting;
}

- (BOOL) textFieldShouldReturn:(UITextField *)theTextField {
    if(theTextField == self.textField){
        [theTextField resignFirstResponder];
    }
    
    return YES;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if([self.textField isFirstResponder] && [touch view] != self.textField ){
        [self.textField resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}
@end
