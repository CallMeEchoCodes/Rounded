#import <UIKit/UIKit.h>

static NSInteger screenCornerRadius = 0;

@interface _UIRootWindow : UIView
@property (setter=_setContinuousCornerRadius:, nonatomic) double _continuousCornerRadius;
@end
