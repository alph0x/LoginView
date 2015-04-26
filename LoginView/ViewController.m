//
//  ViewController.m
//  LoginView
//
//  Created by Alfredo E. Pérez L. on 4/26/15.
//  Copyright (c) 2015 Alfredo E. Pérez L. All rights reserved.
//

#import "ViewController.h"

/*
 *Static Definitions
 */

#define DEFAULT_STATE 50
#define LOGIN_STATE 151
#define SIGNIN_STATE 253
#define ANIMATION_LENGHT .25

#define MAIN_BUTTON_TITLE_DEFAULT_STATE @"Log In"
#define MAIN_BUTTON_TITLE_LOGIN_STATE @"✓"
#define MAIN_BUTTON_TITLE_SIGNIN_STATE @"Create Account"

#define MAIN_BUTTON_DEFAULT_COLOR [UIColor colorWithRed:0.376 green:0.612 blue:0.294 alpha:1]
#define MAIN_BUTTON_SIGNIN_COLOR [UIColor lightGrayColor]

#define SECONDARY_BUTTON_TITLE_DEFAULT_STATE @"Sign Up"
#define SECONDARY_BUTTON_TITLE_LOGIN_STATE @"Forgot password?"
#define SECONDARY_BUTTON_TITLE_SIGNIN_STATE @"Use info from Facebook"

#define SECONDARY_BUTTON_DEFAULT_COLOR [UIColor clearColor]
#define SECONDARY_BUTTON_SIGNIN_COLOR [UIColor colorWithRed:0.098 green:0.31 blue:0.522 alpha:1]

@interface ViewController () {
    
    /*
     *Main Buttons
     */
    IBOutlet UIButton *backButton;
    IBOutlet UIButton *secondaryButton;
    IBOutlet UIButton *mainButton;
    
    /*
     *Constraints
     */
    IBOutlet NSLayoutConstraint *viewHeightConstraint;
    IBOutlet NSLayoutConstraint *viewWidthConstraint;
    IBOutlet NSLayoutConstraint *alphaContainerHeightConstraint;
    IBOutlet NSLayoutConstraint *titleYPositionConstraint;
    
    /*
     *Login Fields
     */
    IBOutlet UITextField *logEmailTextField;
    IBOutlet UITextField *logPasswordTextField;
    
    
    /*
     *Containers
     */
    IBOutlet UIView *loginContainer;
    IBOutlet UIView *signinContainer;
    
    /*
     *Variables
     */
    BOOL isLoginState;
    BOOL isSigninState;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [viewHeightConstraint setConstant:self.view.frame.size.height];
    [viewWidthConstraint setConstant:self.view.frame.size.width];
    [self defaultState];
}

-(void)defaultState {
    [alphaContainerHeightConstraint setConstant:DEFAULT_STATE];
    [UIView animateWithDuration:ANIMATION_LENGHT animations:^{
        
        [self.view layoutIfNeeded];
    }];
    [backButton setHidden:YES];
    [loginContainer setHidden:YES];
    [signinContainer setHidden:YES];
    [mainButton setBackgroundColor:MAIN_BUTTON_DEFAULT_COLOR];
    [secondaryButton setBackgroundColor:SECONDARY_BUTTON_DEFAULT_COLOR];
    [mainButton setTitle:MAIN_BUTTON_TITLE_DEFAULT_STATE forState:UIControlStateNormal];
    [secondaryButton setTitle:SECONDARY_BUTTON_TITLE_DEFAULT_STATE forState:UIControlStateNormal];
    
}

-(void)loginState {
    [alphaContainerHeightConstraint setConstant:LOGIN_STATE];
    [UIView animateWithDuration:ANIMATION_LENGHT animations:^{
        
        [self.view layoutIfNeeded];
    }];
    [backButton setHidden:NO];
    [loginContainer setHidden:NO];
    [mainButton setTitle:MAIN_BUTTON_TITLE_LOGIN_STATE forState:UIControlStateNormal];
    [secondaryButton setTitle:SECONDARY_BUTTON_TITLE_LOGIN_STATE forState:UIControlStateNormal];
    
}

-(void)signupState {
    [alphaContainerHeightConstraint setConstant:SIGNIN_STATE];
    [UIView animateWithDuration:ANIMATION_LENGHT animations:^{
        
        [self.view layoutIfNeeded];
    }];
    [backButton setHidden:NO];
    [signinContainer setHidden:NO];
    [mainButton setBackgroundColor:MAIN_BUTTON_SIGNIN_COLOR];
    [secondaryButton setBackgroundColor:SECONDARY_BUTTON_SIGNIN_COLOR];
    [mainButton setTitle:MAIN_BUTTON_TITLE_SIGNIN_STATE forState:UIControlStateNormal];
    [secondaryButton setTitle:SECONDARY_BUTTON_TITLE_SIGNIN_STATE forState:UIControlStateNormal];
    
}

- (IBAction)backButtonTapped:(id)sender {
    [self defaultState];
    isLoginState = NO;
    isSigninState = NO;
}

- (IBAction)secondaryButtonTapped:(id)sender {
    if (!isLoginState && !isSigninState) {
        isSigninState = YES;
        [self signupState];
    }
    
}

- (IBAction)primaryButtonTapped:(id)sender {
    if (!isLoginState && !isSigninState) {
        isLoginState = YES;
        [self loginState];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
