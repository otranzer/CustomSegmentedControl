//
//  CustomSegmentedControl.h
//
//  Copyright (c) 2014 Olivier Tranzer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomSegmentedControlTab.h"

@protocol CustomSegmentedControlDelegate;

@interface CustomSegmentedControl : UIView<CustomSegementedControlTabDelegate>

@property(nonatomic,assign) id<CustomSegmentedControlDelegate> delegate;

/**
 *  Init method
 *
 *  @param tabTitles           Array of the titles of the tabs
 *  @param defaultImages       Background image name when the tab is not selected (the file needs to be added to your project first)
 *  @param selectedImages      Background image name when the tab is selected (the file needs to be added to your project first)
 *  @param defaultTextColor    Text color when the tab is not selected
 *  @param selectedTextColor   Text color when the tab is selected
 *  @param customFont          Font of the tab title text
 *
 */
- (id)initWithTabTitles:(NSArray *)tabTitles andDefaultImages:(NSArray *)defaultImages andSelectedImages:(NSArray *)selectedImages andDefaultTextColor:(UIColor *)defaultTextColor andSelectedTextColor:(UIColor *)selectedTextColor andCustomFont:(UIFont *)customFont;

/**
 *  Init method with frame
 *
 *  @param frame               The frame of the view
 *  @param tabTitles           Array of the titles of the tabs
 *  @param defaultImages       Background image name when the tab is not selected (the file needs to be added to your project first)
 *  @param selectedImages      Background image name when the tab is selected (the file needs to be added to your project first)
 *  @param defaultTextColor    Text color when the tab is not selected
 *  @param selectedTextColor   Text color when the tab is selected
 *  @param customFont          Font of the tab title text
 *
 */
- (id)initWithFrame:(CGRect)frame andTabTitles:(NSArray *)tabTitles andDefaultImages:(NSArray *)defaultImages andSelectedImages:(NSArray *)selectedImages andDefaultTextColor:(UIColor *)defaultTextColor andSelectedTextColor:(UIColor *)selectedTextColor andCustomFont:(UIFont *)customFont;

/**
 *  Select a specific tab
 *
 *  @param index               The index of the tab to select
 *
 */
- (void)setSelectedSegmentIndex:(NSInteger)index;

@end

@protocol CustomSegmentedControlDelegate <NSObject>


/**
 *  Called when a button is clicked. The view will be automatically
 *  dismissed after this call returns
 *
 *  @param segmentedControl    The segmentedControl object informing the delegate
 *  @param buttonIndex         Index clicked
 *
 */

- (void)segmentedControl:(CustomSegmentedControl *)segmentedControl clickedTabAtIndex:(NSInteger)buttonIndex;

@end
