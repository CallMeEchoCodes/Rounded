#import <UIKit/UIKit.h>

@interface _UIRootWindow : UIView
@property (setter=_setContinuousCornerRadius:, nonatomic) double _continuousCornerRadius;
@end

%hook _UIRootWindow
	- (void)layoutSubviews {
		self.clipsToBounds = YES;
		self._continuousCornerRadius = 16;
		return;
	}
%end