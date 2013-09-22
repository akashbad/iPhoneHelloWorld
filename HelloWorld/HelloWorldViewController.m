//
//  HelloWorldViewController.m
//  HelloWorld
//
//  Created by Akash Badshah on 8/14/13.
//  Copyright (c) 2013 Akash Badshah. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController ()
@property (weak, nonatomic) IBOutlet UILabel *player1;
@property (weak, nonatomic) IBOutlet UILabel *player2;
@property (weak, nonatomic) IBOutlet UILabel *whoChooses;

- (IBAction)selectRock:(id)sender;
- (IBAction)selectPaper:(id)sender;
- (IBAction)selectScissor:(id)sender;
- (IBAction)reset:(id)sender;

- (void)selectOption:(NSString*)option;
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

- (IBAction)selectRock:(id)sender {
    [self selectOption:@"rock"];
}

- (IBAction)selectPaper:(id)sender {
    [self selectOption:@"paper"];
}

- (IBAction)selectScissor:(id)sender {
    [self selectOption:@"scissors"];
}

- (IBAction)reset:(id)sender {
    self.firstChoice = nil;
    self.secondChoice = nil;
    self.whoChooses.text = @"First Player Choose";
    self.player1.text = @"";
    self.player2.text = @"";
    
}

- (void)selectOption:(NSString*)option {
    if(!self.firstChoice){
        self.firstChoice = option;
        self.whoChooses.text = @"Second Player Choose";
        self.player1.text = option;
    }
    else if (!self.secondChoice){
        self.secondChoice = option;
        self.player2.text = option;
        if([self rpsBeats]){
            self.whoChooses.text = @"Player 1 Wins!";
        }
        else {
            self.whoChooses.text = @"Player 2 Wins!";
        }
    }
}

-(BOOL)rpsBeats{
    if (([self.firstChoice isEqualToString:@"rock"] && [self.secondChoice isEqualToString:@"scissors"]) ||
        ([self.firstChoice isEqualToString:@"scissors"] && [self.secondChoice isEqualToString:@"paper"]) ||
        ([self.firstChoice isEqualToString:@"paper"] && [self.secondChoice isEqualToString:@"rock"])) {
        return YES;
    }
    return NO;
}

@end
