## Custom segmented control

I created this small iOS library when facing the problem of unflexibility of the native segmented control. I wanted to change the background, font styles and colors of both seletced and unseleted tabs.

## How to install

Simply clone the project:

    git clone https://github.com/otranzer/CustomSegmentedControl

And then add files to your xcode project.

## How to use

#### Create the segmented control view

    CustomSegmentedControl *segmentedControl = [[CustomSegmentedControl alloc] initWithFrame:frame andTabTitles:@[NSLocalizedString(@"Tab 1", nil), NSLocalizedString(@"Tab 2", nil)] andDefaultImages:@[@"btn_tab_notpress", @"btn_tab_notpress"] andSelectedImages:@[@"btn_tab_pressed", @"btn_tab_pressed"] andDefaultTextColor:[UIColor whiteColor] andSelectedTextColor:[UIColor blackColor] andCustomFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15]];
    segmentedControl.delegate = self;
    [self.view addSubview:segmentedControl];

#### Implement the delegate

Declare the delegate in your *.h file:

    @interface MyViewController<CustomSegmentedControlDelegate>

And implement it in your *.m file:

    - (void)segmentedControl:(CustomSegmentedControl *)segmentedControl clickedTabAtIndex:(NSInteger)buttonIndex
    {
        switch (buttonIndex) {
            case 0:
            {
                // Set visible segment
                self.firstView.hidden = NO;
                self.secondView.hidden = YES;
                break;
            }
            case 1:
            {
                // Set visible segment
                self.firstView.hidden = YES;
                self.secondView.hidden = NO;
                break;
            }
            default:
                break;
        }
    }

