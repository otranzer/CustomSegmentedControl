//
//  CustomSegmentedControl.h
//  Splitit
//
//  Created by miLibris on 13/03/14.
//  Copyright (c) 2014 Olivier Tranzer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomSegmentedControlTab.h"

@protocol CustomSegmentedControlDelegate;

@interface CustomSegmentedControl : UIView<CustomSegementedControlTabDelegate>

@property(nonatomic,assign) id<CustomSegmentedControlDelegate> delegate;

- (id)initWithFrame:(CGRect)frame andTabTitles:(NSArray *)tabTitles andDefaultImages:(NSArray *)defaultImages andSelectedImages:(NSArray *)selectedImages andDefaultTextColor:(UIColor *)defaultTextColor andSelectedTextColor:(UIColor *)selectedTextColor andCustomFont:(UIFont *)customFont;

- (void)setSelectedSegmentIndex:(NSInteger)index;

@end

@protocol CustomSegmentedControlDelegate <NSObject>

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)segmentedControl:(CustomSegmentedControl *)segmentedControl clickedTabAtIndex:(NSInteger)buttonIndex;

@end
