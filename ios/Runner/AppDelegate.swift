import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

    private let channelName = "com.example.poc_native_communication/login"
    var flutterResult: FlutterResult?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller = window?.rootViewController as! FlutterViewController
        let methodChannel = FlutterMethodChannel(name: channelName, binaryMessenger: controller.binaryMessenger)

        methodChannel.setMethodCallHandler { (call, result) in
            if call.method == "showLogin" {
                self.flutterResult = result
                self.showNativeLogin()
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func showNativeLogin() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

        loginViewController.loginSuccessCallback = { [weak self] userData in
            guard let self = self else { return }
            self.flutterResult?(userData)
            self.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }

        window?.rootViewController?.present(loginViewController, animated: true, completion: nil)
    }
}
