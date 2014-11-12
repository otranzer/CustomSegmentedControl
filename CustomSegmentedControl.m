//
//  CustomSegmentedControl.m
//  Splitit
//
//  Created by miLibris on 13/03/14.
//  Copyright (c) 2014 Olivier Tranzer. All rights reserved.
//

#import "CustomSegmentedControl.h"

@interface CustomSegmentedControl()

@property (nonatomic, strong) NSMutableArray *tabs;

@end

@implementation CustomSegmentedControl

#pragma mark - Alloc/Init

- (id)initWithTabTitles:(NSArray *)tabTitles andDefaultImages:(NSArray *)defaultImages andSelectedImages:(NSArray *)selectedImages andDefaultTextColor:(UIColor *)defaultTextColor andSelectedTextColor:(UIColor *)selectedTextColor andCustomFont:(UIFont *)customFont
{
    self = [super init];
    if (self) {
        // Initialization code
       [self initViewsWithTabTitles:tabTitles andDefaultImages:defaultImages andSelectedImages:selectedImages andDefaultTextColor:defaultTextColor andSelectedTextColor:selectedTextColor andCustomFont:customFont];
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame andTabTitles:(NSArray *)tabTitles andDefaultImages:(NSArray *)defaultImages andSelectedImages:(NSArray *)selectedImages andDefaultTextColor:(UIColor *)defaultTextColor andSelectedTextColor:(UIColor *)selectedTextColor andCustomFont:(UIFont *)customFont
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initViewsWithTabTitles:tabTitles andDefaultImages:defaultImages andSelectedImages:selectedImages andDefaultTextColor:defaultTextColor andSelectedTextColor:selectedTextColor andCustomFont:customFont];
    }
    return self;
}

- (void)initViewsWithTabTitles:(NSArray *)tabTitles andDefaultImages:(NSArray *)defaultImages andSelectedImages:(NSArray *)selectedImages andDefaultTextColor:(UIColor *)defaultTextColor andSelectedTextColor:(UIColor *)selectedTextColor andCustomFont:(UIFont *)customFont
{
    NSUInteger n = [tabTitles count];
    if ([defaultImages count] != n || [selectedImages count] != n) {
        NSLog(@"Arguments not correct");
        return;
    }
    
    self.tabs = [NSMutableArray array];
    
    for (int i = 0 ; i < n ; i++) {
        
        // Get data
        NSString *title = [tabTitles objectAtIndex:i];
        NSString *defaultImage = [defaultImages objectAtIndex:i];
        NSString *selectedImage = [selectedImages objectAtIndex:i];
        
        // Init tab
        CustomSegmentedControlTab *tab = [[CustomSegmentedControlTab alloc] initWithTitle:title andDefaultImageName:defaultImage andSelectedImageName:selectedImage andDefaultTextColor:defaultTextColor andSelectedTextColor:selectedTextColor andCustomFont:customFont];
        
        // Add to local array
        [self.tabs addObject:tab];
        
        [self addSubview:tab];
        
        // Set delegate
        tab.delegate = self;
        
        // Set tag
        tab.tag = i;
        
        // Select first tab
        if (i == 0) {
            [tab setSelected:YES];
        }
        
    }
}

#pragma mark - Layout
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    // Set tab frames
    NSUInteger n = [self.tabs count];
    for (int i = 0 ; i < n ; i++) {
        CGFloat x = i * (self.bounds.size.width / n);
        CGFloat y = 0;
        CGFloat width = (self.bounds.size.width / n);
        CGFloat height = self.bounds.size.height;
        CGRect tabFrame = CGRectMake(x, y, width, height);
        CustomSegmentedControlTab *tab = [self.tabs objectAtIndex:i];
        tab.frame = tabFrame;
    }
    
}

#pragma mark - Tab delegate

- (void)didClick:(CustomSegmentedControlTab *)tab
{
    // Notify delegate
    if (self.delegate && [self.delegate respondsToSelector:@selector(segmentedControl:clickedTabAtIndex:)]) {
        [self.delegate segmentedControl:self clickedTabAtIndex:tab.tag];
    }
    
    // Change UI
    for (CustomSegmentedControlTab *currentTab in self.tabs) {
        // Set selected if it is the selected tab
        [currentTab setSelected:(tab.tag == currentTab.tag)];
    }
}

- (void)setSelectedSegmentIndex:(NSInteger)index
{
    for (CustomSegmentedControlTab *tab in self.tabs) {
        // Set selected if it is the selected tab
        [tab setSelected:(tab.tag == index)];
    }
}

@end
