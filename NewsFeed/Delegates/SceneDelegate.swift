//
//  SceneDelegate.swift
//  NewsFeed
//
//  Created by 17672395 on 25/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//


import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

		guard let windowScene = (scene as? UIWindowScene) else { return }

		let window = UIWindow(frame: windowScene.coordinateSpace.bounds)
		window.windowScene = windowScene

		let navigationController = UINavigationController()
		let countriesScreen = CountriesScreenAssembly.makeCountriesScreen(navigationController)
		navigationController.pushViewController(countriesScreen, animated: false)
		window.rootViewController = navigationController

		self.window = window
		self.window?.makeKeyAndVisible()
	}

	func sceneDidDisconnect(_ scene: UIScene) {

	}

	func sceneDidBecomeActive(_ scene: UIScene) {

	}

	func sceneWillResignActive(_ scene: UIScene) {

	}

	func sceneWillEnterForeground(_ scene: UIScene) {

	}

	func sceneDidEnterBackground(_ scene: UIScene) {
		
		(UIApplication.shared.delegate as? AppDelegate)?.saveContext()
	}


}

