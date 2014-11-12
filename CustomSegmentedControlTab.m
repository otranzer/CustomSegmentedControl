//
//  CustomSegmentedControlTab.m
//  Splitit
//
//  Created by miLibris on 13/03/14.
//  Copyright (c) 2014 Olivier Tranzer. All rights reserved.
//

#import "CustomSegmentedControlTab.h"

@interface CustomSegmentedControlTab ()

// Views
@property (nonatomic, strong) UIImageView *defaultImageView;
@property (nonatomic, strong) UIImageView *selectedImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIColor *defaultTextColor;
@property (nonatomic, strong) UIColor *selectedTextColor;

// State
@property (nonatomic) BOOL isSelected;

@end


@implementation CustomSegmentedControlTab

#pragma mark - Alloc/Init
- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title andDefaultImageName:(NSString *)defaultImageName andSelectedImageName:(NSString *)selectedImageName andDefaultTextColor:(UIColor *)defaultTextColor andSelectedTextColor:(UIColor *)selectedTextColor andCustomFont:(UIFont *)customFont
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // Text colors
        self.defaultTextColor = defaultTextColor;
        self.selectedTextColor = selectedTextColor;
        
        // Create views
        self.defaultImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.selectedImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.frame = self.bounds;
        
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
}

- (void)setSelected:(BOOL)selected
{
    if (selected == self.isSelected) {
        // Already in the good state
        return;
    }
    if (selected) {
        [self insertSubview:self.selectedImageView aboveSubview:self.defaultImageView];
         [self.titleLabel setTextColor:self.selectedTextColor];
    }
    else {
        [self.selectedImageView removeFromSuperview];
         [self.titleLabel setTextColor:self.defaultTextColor];
    }
    // Record current state
    self.isSelected = selected;
}

- (void)didClick
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClick:)]) {
        [self.delegate didClick:self];
    }
}

@end
