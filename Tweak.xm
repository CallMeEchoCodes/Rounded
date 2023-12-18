#import "Tweak.h"

%hook _UIRootWindow
- (void)layoutSubviews {
	self.clipsToBounds = YES;
	self._continuousCornerRadius = screenCornerRadius;
}
%end

%hook CCUIContentModuleContentContainerView
- (void)layoutSubviews {
	self.clipsToBounds = YES;
	self._continuousCornerRadius = ccCornerRadius;
}
%end

// Preferences
static void loadPreferences() {
	NSUserDefaults *preferences = [[NSUserDefaults alloc] initWithSuiteName:@"dev.callmeecho.rounded.preferences"];
	if (!preferences) { return; }

	screenCornerRadius = [[preferences objectForKey:@"screenCornerRadius"] integerValue];
	ccCornerRadius = [[preferences objectForKey:@"ccCornerRadius"] integerValue];
}

%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPreferences, CFSTR("dev.callmeecho.rounded.preferences/reload"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	loadPreferences();
}
