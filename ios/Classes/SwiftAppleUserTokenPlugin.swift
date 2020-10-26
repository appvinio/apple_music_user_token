import Flutter
import UIKit
import StoreKit

public class SwiftAppleUserTokenPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "apple_user_token", binaryMessenger: registrar.messenger())
        let instance = SwiftAppleUserTokenPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let developerToken = call.arguments as! String
        
        if #available(iOS 11, *) {
            SKCloudServiceController.requestAuthorization { (status: SKCloudServiceAuthorizationStatus) in
                if (status == SKCloudServiceAuthorizationStatus.authorized) {
                    let controller = SKCloudServiceController()
                    controller.requestUserToken(forDeveloperToken: developerToken) { userToken, error in
                        if (error != nil) {
                            print(error)
                            result(FlutterError(code: "ERROR", message: error?.localizedDescription, details: nil))
                        }
                        if (userToken != nil) {
                            result(userToken)
                        }
                    }
                } else {
                    result(FlutterError(code: "ERROR", message: "Access to Apple Music is required get User data", details: nil))
                }
            }
        }
    }
}
