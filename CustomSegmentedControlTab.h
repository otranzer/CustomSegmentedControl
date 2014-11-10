//
//  CustomSegmentedControlTab.h
//
//  Copyright (c) 2014 Olivier Tranzer. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomSegementedControlTabDelegate;

@interface CustomSegmentedControlTab : UIView

/**
 *  Delegate of the tab
 */
@property (nonatomic) id<CustomSegementedControlTabDelegate> delegate;


/**
 *  Init method
 *
 *  @param frame               The frame of the view
 *  @param title               The title of the tab
 *  @param defaultImageName    The name of the default background image
 *  @param selectedImageName   The name of the selected background image
 *  @param defaultTextColor    Text color when the tab is not selected
 *  @param selectedTextColor   Text color when the tab is selected
 *  @param customFont          Font of the tab title text
 *
 */
- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title andDefaultImageName:(NSString *)defaultImageName andSelectedImageName:(NSString *)selectedImageName andDefaultTextColor:(UIColor *)defaultTextColor andSelectedTextColor:(UIColor *)selectedTextColor andCustomFont:(UIFont *)customFont;

/**
 *  Select/Unselect tab
 *
 *  @param selected           YES to select, NO to unselect
 *
 */
- (void)setSelected:(BOOL)selected;

@end

/**
 *  Delegate of the tab
 */
@protocol CustomSegementedControlTabDelegate <NSObject>

@optional

/**
 *  Called when the user click on this tab
 * @param tab The clicked tab
 *
 */
- (void)didClick:(CustomSegmentedControlTab *)tab;

@end
