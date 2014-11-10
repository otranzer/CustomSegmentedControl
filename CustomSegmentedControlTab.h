//
//  CustomSegmentedControlTab.h
//  Splitit
//
//  Created by miLibris on 13/03/14.
//  Copyright (c) 2014 Olivier Tranzer. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomSegementedControlTabDelegate;

@interface CustomSegmentedControlTab : UIView

@property (nonatomic) id<CustomSegementedControlTabDelegate> delegate;

- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title andDefaultImageName:(NSString *)defaultImageName andSelectedImageName:(NSString *)selectedImageName andDefaultTextColor:(UIColor *)defaultTextColor andSelectedTextColor:(UIColor *)selectedTextColor andCustomFont:(UIFont *)customFont;

- (void)setSelected:(BOOL)selected;

@end

@protocol CustomSegementedControlTabDelegate <NSObject>

@optional

- (void)didClick:(CustomSegmentedControlTab *)tab;

@end
