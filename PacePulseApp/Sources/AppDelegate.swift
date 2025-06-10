import UIKit

@main // 또는 @UIApplicationMain (Objective-C 프로젝트에서 브릿징 헤더를 통해 사용 시)
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 앱 실행 시 초기 설정 (Scene 생성 전)
        print("AppDelegate: didFinishLaunchingWithOptions")
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // 새로운 Scene session이 생성될 때 호출됩니다.
        // 이 메서드를 사용하여 새 Scene을 생성할 때 사용할 설정을 선택합니다.
        // "Default Configuration"은 Info.plist의 Scene Manifest 설정과 일치해야 합니다.
        print("AppDelegate: configurationForConnecting")
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // 사용자가 Scene session을 버렸을 때 호출됩니다.
        // (예: 앱 스위처에서 멀티 윈도우 중 하나를 닫았을 때)
        // 버려진 Scene에만 해당되는 자원들을 해제합니다.
        print("AppDelegate: didDiscardSceneSessions")
    }
}
