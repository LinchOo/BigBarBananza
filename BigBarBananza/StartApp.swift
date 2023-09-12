//
//  BigBarBamamza
//
//  Created by SilverHand on 12.07.2023.
//

import UIKit
import SwiftUI

var idUserNumber = ""

class StartApp: UIViewController, URLSessionDelegate {

    @IBOutlet weak var BackGroundControl: UIImageView!
    @IBOutlet weak var loadingProgressBar: UIProgressView!

//MARK: Variables
    var window: UIWindow?
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    let bundleIdentifier = Bundle.main.bundleIdentifier
    var pathIdentifier = ""
    var progressValue : Float = 0

//MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        //AppUtility.lockOrientation(.portrait)
        loadingProgressBar.layer.cornerRadius = 10
        loadingProgressBar.clipsToBounds = true
        loadingProgressBar.layer.sublayers![1].cornerRadius = 10
        loadingProgressBar.subviews[1].clipsToBounds = true
        loadingProgressBar.transform = loadingProgressBar.transform.scaledBy(x: 1, y: 8)

        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)

    }

//MARK: Start Request
    func startToRequest() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            if self.pathIdentifier == ""{
                self.sendToRequest()
            }
        }
    }
    
//MARK: Switch To Home View
    func switchToHomeView() {
        BackGroundControl.alpha = 1
        let homeViewController = UIHostingController(rootView: MainTab())
        homeViewController.modalPresentationStyle = .fullScreen
        self.window?.switchRootViewController(homeViewController,animated: true, duration: 0.3, options: .transitionCrossDissolve)
        self.window?.makeKeyAndVisible()
        
    }

//MARK: Switch YourWebConnector
    func prelendApps() {
        let preland = Helper()
        preland.sourceData = self.pathIdentifier    // Link to
        self.window?.switchRootViewController(preland,animated: true, duration: 0.3, options: .transitionCrossDissolve)
        self.window?.alpha = 0
        self.window?.makeKeyAndVisible()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            self.BackGroundControl.alpha = 0
            self.window?.alpha = 1
        }
    }

//MARK: - Send Request To Server
    func sendToRequest() {

//MARK: Link to server
        let url = URL(string: "https://bigbarbananza.store/starting")

        let dictionariData: [String: Any?] = ["facebook-deeplink" : appDelegate?.deepLinkParameterFB, "push-token" : appDelegate?.tokenPushNotification, "appsflyer" : appDelegate?.oldAndNotWorkingNames, "deep_link_sub2" : appDelegate?.subject2, "deepLinkStr": appDelegate?.oneLinkDeepLink, "timezone-geo": appDelegate?.geographicalNameTimeZone, "timezome-gmt" : appDelegate?.abbreviationTimeZone, "apps-flyer-id": appDelegate!.uniqueIdentifierAppsFlyer, "attribution-data" : appDelegate?.dataAttribution, "deep_link_sub1" : appDelegate?.subject1, "deep_link_sub3" : appDelegate?.subject3, "deep_link_sub4" : appDelegate?.subject4, "deep_link_sub5" : appDelegate?.subject5]

        print(dictionariData)

//REQUST url
        var request = URLRequest(url: url!)
//MARK: JSON packing
        let json = try? JSONSerialization.data(withJSONObject: dictionariData)
        request.httpBody = json
        request.httpMethod = "POST"
        request.addValue(appDelegate!.identifierAdvertising, forHTTPHeaderField: "GID")
        request.addValue(bundleIdentifier!, forHTTPHeaderField: "PackageName")
        request.addValue(appDelegate!.uniqueIdentifierAppsFlyer, forHTTPHeaderField: "ID")

//CONFIGURATING urlSession
        let configuration = URLSessionConfiguration.ephemeral
        configuration.waitsForConnectivity = false
        configuration.timeoutIntervalForResource = 60
        configuration.timeoutIntervalForRequest = 60

//URLSESSION create
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: OperationQueue.main)

//Data Task
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.switchToHomeView()
                }
                return
            }
//MARK: JSON Response
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                guard let result = responseJSON["result"] as? String else { return }
                self.pathIdentifier = result
                let user = responseJSON["userID"] as? Int
                guard let strUser = user else { return }
                idUserNumber = "\(strUser)"
                print(responseJSON)
            }
//MARK: HTTPURL Response
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    self.switchToHomeView()
                } else if response.statusCode == 302 {
                    if self.pathIdentifier != "" {
                        self.prelendApps()
                    }
                } else {

                }
            }
            return
        }
        task.resume()
    }
//MARK: URL Session func
    func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
        completionHandler(nil)
    }
//MARK: Overrite parameters
//Autorotate override
    override var shouldAutorotate: Bool {
        return true
    }
// Interface Orientations override
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    // Status Bar hidden
    override var prefersStatusBarHidden: Bool {
        return true
    }

    @objc func update(){
        progressValue += 0.01
        loadingProgressBar.progress = progressValue

        }
}

extension UIWindow {

    func switchRootViewController(_ viewController: UIViewController,
                                  animated: Bool = true,
                                  duration: TimeInterval = 0.5,
                                  options: AnimationOptions = .transitionFlipFromRight,
                                  completion: (() -> Void)? = nil) {
        guard animated else {
            rootViewController = viewController
            return
        }

        UIView.transition(with: self, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        }, completion: { _ in
            completion?()
        })
    }

}

struct AppUtility {

    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
    
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }

    // OPTIONAL Added method to adjust lock and rotate to the desired orientation
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
   
        self.lockOrientation(orientation)
    
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        UINavigationController.attemptRotationToDeviceOrientation()
    }

}
