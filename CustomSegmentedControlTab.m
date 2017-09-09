//
//  CustomSegmentedControlTab.m
//  Splitit
//
//  Created by miLibris on 13/03/14.
//  Copyright (c) 2014 Olivier Tranzer. All rights reserved.
//

#import "CustomSegmentedControlTab.h"

@interface CustomSegmentedControlTab ()

// Colors
@property (nonatomic, strong) UIColor *defaultBackgroundColor;
@property (nonatomic, strong) UIColor *selectedBackgroundColor;
@property (nonatomic, strong) UIColor *underlineColor;

// Views
@property (nonatomic, strong) UIImageView *defaultImageView;
@property (nonatomic, strong) UIImageView *selectedImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIColor *defaultTextColor;
@property (nonatomic, strong) UIColor *selectedTextColor;
@property (nonatomic, strong) UIView *underlineView;

// State
@property (nonatomic) BOOL isSelected;

@end


@implementation CustomSegmentedControlTab

#pragma mark - Alloc/Init
- (id)initWithTitle:(NSString *)title andDefaultImageName:(NSString *)defaultImageName andSelectedImageName:(NSString *)selectedImageName andDefaultTextColor:(UIColor *)defaultTextColor andSelectedTextColor:(UIColor *)selectedTextColor andCustomFont:(UIFont *)customFont
{
    self = [super init];
    if (self) {
        // Initialization code
        
        // Text colors
        self.defaultTextColor = defaultTextColor;
        self.selectedTextColor = selectedTextColor;
        
        // Create views
        self.defaultImageView = [[UIImageView alloc] init];
        self.selectedImageView = [[UIImageView alloc] init];
        self.titleLabel = [[UILabel alloc] init];
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.underlineView = [UIView new];
        self.underlineView.hidden = YES;
        
        // Set backgroud colors
        self.defaultBackgroundColor = [UIColor clearColor];
        self.selectedBackgroundColor = [UIColor clearColor];
        self.underlineView.backgroundColor = (self.underlineColor) ? self.underlineColor : [UIColor clearColor];
        
        // Set image sources
        [self.defaultImageView setImage:[UIImage imageNamed:defaultImageName]];
        [self.selectedImageView setImage:[UIImage imageNamed:selectedImageName]];
        
        // Set title
        [self.titleLabel setText:title];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.titleLabel setTextColor:self.defaultTextColor];
        if (customFont) [self.titleLabel setFont:customFont];
        
        // Button
        [self.button addTarget:self action:@selector(didClick) forControlEvents:UIControlEventTouchUpInside];
        
        // Add subviews
        [self addSubview:self.defaultImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.underlineView];
        [self addSubview:self.button];
        
        // Init state
        self.isSelected = NO;
    }
    return self;
}

- (id)initWithTitle:(NSString *)title andDefaultBackgroundColor:(UIColor *)defaultBackgroundColor andSelectedBackgroundColor:(UIColor *)selectedBackgroundColor andDefaultTextColor:(UIColor *)defaultTextColor andSelectedTextColor:(UIColor *)selectedTextColor andCustomFont:(UIFont *)customFont
{
    self = [super init];
    if (self) {
        // Initialization code
        
        // Text colors
        self.defaultTextColor = defaultTextColor;
        self.selectedTextColor = selectedTextColor;
        
        // Create views
        self.defaultImageView = [[UIImageView alloc] init];
        self.selectedImageView = [[UIImageView alloc] init];
        self.titleLabel = [[UILabel alloc] init];
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.underlineView = [UIView new];
        self.underlineView.hidden = YES;

        // Set backgroud colors
        self.defaultBackgroundColor = defaultBackgroundColor;
        self.selectedBackgroundColor = selectedBackgroundColor;
        self.backgroundColor = self.defaultBackgroundColor;
        
        // Set title
        [self.titleLabel setText:title];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.titleLabel setTextColor:self.defaultTextColor];
        if (customFont) [self.titleLabel setFont:customFont];
        
        // Button
        [self.button addTarget:self action:@selector(didClick) forControlEvents:UIControlEventTouchUpInside];
        
        // Add subviews
        [self addSubview:self.defaultImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.underlineView];
        [self addSubview:self.button];
        
        // Init state
        self.isSelected = NO;
    }
    return self;
}

#pragma mark - Layout
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    // Default image
    self.defaultImageView.frame = self.bounds;
    
    // Selected image
    self.selectedImageView.frame = self.bounds;
    
    // Title
    self.titleLabel.frame = self.bounds;
    
    // Button
    self.button.frame = self.bounds;
    
    // Underline
    self.underlineView.frame = CGRectMake(0.25 * CGRectGetWidth(self.bounds),
                                          0.85 * CGRectGetHeight(self.bounds),
                                          0.5 * CGRectGetWidth(self.bounds),
                                          0.15 * CGRectGetHeight(self.bounds));
}

- (void)setSelected:(BOOL)selected
{
    if (selected == self.isSelected) {
        // Already in the good state
        return;
    }
    if (selected) {
        // Background
        self.backgroundColor = self.selectedBackgroundColor;
        
        // Image
        [self insertSubview:self.selectedImageView aboveSubview:self.defaultImageView];
         [self.titleLabel setTextColor:self.selectedTextColor];
    }
    else {
        // Background
        self.backgroundColor = self.defaultBackgroundColor;
        
        // Image
        [self.selectedImageView removeFromSuperview];
         [self.titleLabel setTextColor:self.defaultTextColor];
    }
    self.underlineView.hidden = !selected;
    // Record current state
    self.isSelected = selected;
}

- (void)setSelectedUnderlineColor:(UIColor *)color {
    self.underlineColor = color;
    if (self.underlineView) self.underlineView.backgroundColor = self.underlineColor;
}

- (void)didClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClick:)]) {
        [self.delegate didClick:self];
    }
}

@end
