#import <UIKit/UIKit.h>

static NSInteger screenCornerRadius = 0;
static NSInteger ccCornerRadius = 0;


@interface _UIRootWindow : UIView
@property (setter=_setContinuousCornerRadius:, nonatomic) double _continuousCornerRadius;
@end

@interface CCUIContentModuleContentContainerView : UIView
@property (setter=_setContinuousCornerRadius:, nonatomic) double _continuousCornerRadius;
@end
