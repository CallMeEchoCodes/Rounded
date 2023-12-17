#import "Tweak.h"

%hook _UIRootWindow
- (void)layoutSubviews {
	self.clipsToBounds = YES;
	self._continuousCornerRadius = screenCornerRadius;
}
%end

// Preferences
static void loadPreferences() {
	NSUserDefaults *preferences = [[NSUserDefaults alloc] initWithSuiteName:@"dev.callmeecho.rounded.preferences"];
	if (!preferences) { return; }

	screenCornerRadius = [[preferences objectForKey:@"screenCornerRadius"] integerValue];
}

%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPreferences, CFSTR("dev.callmeecho.rounded.preferences/reload"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	loadPreferences();
}
