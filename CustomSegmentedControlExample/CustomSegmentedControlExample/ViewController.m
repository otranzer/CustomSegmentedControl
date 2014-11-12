//
//  ViewController.m
//  CustomSegmentedControlExample
//
//  Created by Olivier on 12/11/14.
//  Copyright (c) 2014 Olivier. All rights reserved.
//

#import "ViewController.h"
#import "FirstTabViewController.h"
#import "SecondTabViewController.h"

/**
 Height of the segmented control
 */
static const CGFloat kSegmentHeight = 40;

@interface ViewController ()

@property (nonatomic, strong) CustomSegmentedControl *segmentedControl;
@property (nonatomic, strong) FirstTabViewController *firstTabViewController;
@property (nonatomic, strong) SecondTabViewController *secondTabViewController;

@end

@implementation ViewController

#pragma mark - Alloc/Init

- (id)init
{
    self = [super init];
    if (self) {
        // Init the two tabs
        self.firstTabViewController = [[FirstTabViewController alloc] init];
        self.secondTabViewController = [[SecondTabViewController alloc] init];
    }
    return self;
}

#pragma mark - Views Load/Unload

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    // Init custom segmented tab
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    CGRect frame = CGRectMake(0, 0, width, kSegmentHeight);
    self.segmentedControl = [[CustomSegmentedControl alloc] initWithFrame:frame andTabTitles:@[NSLocalizedString(@"Tab 1", nil), NSLocalizedString(@"Tab 2", nil)] andDefaultImages:@[@"btn_tab_notpress", @"btn_tab_notpress"] andSelectedImages:@[@"btn_tab_pressed", @"btn_tab_pressed"] andDefaultTextColor:[UIColor whiteColor] andSelectedTextColor:[UIColor blackColor] andCustomFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15]];
    self.segmentedControl.delegate = self;
    self.segmentedControl.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.segmentedControl];
    
    // Add the two tabs views
    [self.view addSubview:self.firstTabViewController.view];
    [self.view addSubview:self.secondTabViewController.view];
    self.firstTabViewController.view.hidden = NO;
    self.secondTabViewController.view.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Views Layout

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    // Init frame
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = kSegmentHeight;
    CGRect frame = CGRectMake(x, y, width, height);
    
    // Segmented control
    self.segmentedControl.frame = frame;
    
    // First tab view
    y += kSegmentHeight;
    height = self.view.bounds.size.height - kSegmentHeight;
    frame = CGRectMake(x, y, width, height);
    self.firstTabViewController.view.frame = frame;
    
    // First tab view
    self.secondTabViewController.view.frame = frame;
}

#pragma mark - Custom segmented control delegate

- (void)segmentedControl:(CustomSegmentedControl *)segmentedControl clickedTabAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            // Set visible segment
            self.firstTabViewController.view.hidden = NO;
            self.secondTabViewController.view.hidden = YES;
            break;
        }
        case 1:
        {
            // Set visible segment
            self.firstTabViewController.view.hidden = YES;
            self.secondTabViewController.view.hidden = NO;
            break;
        }
        default:
            break;
    }
}

@end
