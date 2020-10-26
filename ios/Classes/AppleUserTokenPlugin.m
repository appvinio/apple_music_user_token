#import "AppleUserTokenPlugin.h"
#if __has_include(<apple_user_token/apple_user_token-Swift.h>)
#import <apple_user_token/apple_user_token-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "apple_user_token-Swift.h"
#endif

@implementation AppleUserTokenPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAppleUserTokenPlugin registerWithRegistrar:registrar];
}
@end
