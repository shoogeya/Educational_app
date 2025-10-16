import UIKit
import Flutter
import FirebaseCore
import Firebase
import AVFoundation
@main
@objc class AppDelegate: FlutterAppDelegate, MessagingDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      NotificationCenter.default.addObserver(self, selector: #selector(handleScreenshot), name: UIApplication.userDidTakeScreenshotNotification, object: nil)
      FirebaseApp.configure()
      Messaging.messaging().delegate = self;
      //application.registerForRemoteNotifications();
         GeneratedPluginRegistrant.register(with: self)
         Messaging.messaging().isAutoInitEnabled = true;
      UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
          if let error = error {
              // Handle the error here.
          }
          
          // After permission is granted, register for remote notifications
          DispatchQueue.main.async {
              UIApplication.shared.registerForRemoteNotifications()
          }
      }
         //self.registerForFirebaseNotification(application: application);
//
//      let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//      UNUserNotificationCenter.current().requestAuthorization(
//        options: authOptions,
//        completionHandler: { _, _ in }
//      )

//      application.registerForRemoteNotifications()
//      Messaging.messaging().delegate = self
//      Messaging.messaging().token { token, error in
//        if let error = error {
//          print("Error fetching FCM registration token: \(error)")
//        } else if let token = token {
//          print("FCM registration token: \(token)")
//            print("Remote FCM registration token: \(token)")
//        }
//      }
      if let window = window {
      makeSecure(window: window)
      }
      if #available(iOS 10.0, *) {
          UNUserNotificationCenter.current().delegate = self
         }
        
      application.registerForRemoteNotifications()

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("FCM Token: \(String(describing: fcmToken))")
        
        // Check if the APNs token is available
        if let apnsToken = messaging.apnsToken {
            print("APNs Token: \(apnsToken.map { String(format: "%02.2hhx", $0) }.joined())")
        } else {
            print("APNs token is not set yet.")
        }
    }

    func registerForFirebaseNotification(application : UIApplication){
       //    Messaging.messaging().delegate     = self;
           if #available(iOS 10.0, *) {
               //UNUserNotificationCenter.current().delegate = self ;
               UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
                   if granted {
                       DispatchQueue.main.async {
                           UIApplication.shared.registerForRemoteNotifications()
                       }
                   } else {
                       print("Permission denied: \(String(describing: error?.localizedDescription))")
                   }
               }

//               let authOpt : UNAuthorizationOptions = [.alert, .badge, .sound];
//               UNUserNotificationCenter.current().requestAuthorization(options: authOpt, completionHandler: {_, _ in})
               UNUserNotificationCenter.current().delegate = self ;
           }else{
               let settings : UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
               application.registerUserNotificationSettings(settings);
           }
          
       }
    override func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register: \(error)")
    }

    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
        
        // Fetch the FCM token after setting the APNs token
        Messaging.messaging().token { token, error in
            if let error = error {
                print("Error fetching FCM registration token: \(error)")
            } else if let token = token {
                print("FCM registration token: \(token)")
            }
        }
    }


    @objc func handleScreenshot() {
           // Handle the screenshot event
           // For example, blur sensitive content or notify the user
           print("Screenshot detected!")

       }
    func makeSecure(window: UIWindow) {
        let field = UITextField()

        let view = UIView(frame: CGRect(x: 0, y: 0, width: field.frame.self.width, height: field.frame.self.height))

        let image = UIImageView(image: UIImage(named: "whiteImage"))
        image.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

        field.isSecureTextEntry = true

        window.addSubview(field)
        view.addSubview(image)

        window.layer.superlayer?.addSublayer(field.layer)
        field.layer.sublayers?.last!.addSublayer(window.layer)

        field.leftView = view
        field.leftViewMode = .always
        muteAppSounds()
    }
  

    func muteAppSounds() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .default, options: [.mixWithOthers])
            try audioSession.setActive(true)
        } catch {
            print("Failed to set audio session category: \(error)")
        }
    }

}
