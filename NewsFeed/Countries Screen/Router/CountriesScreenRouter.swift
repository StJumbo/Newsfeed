//
//  CountriesScreenRouter.swift
//  NewsFeed
//
//  Created by 17672395 on 26/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//


import Foundation
import UIKit


/// Роутер экрана выбора страны
class CountriesScreenRouter: CountriesScreenRouterProtocol {

	private weak var navigationController: UINavigationController?

	/// Инит роутера
	/// - Parameter navigationController: навигационный контроллер, на котором будет работать весь экран
	init(_ navigationController: UINavigationController) {
		self.navigationController = navigationController
	}


	// MARK: - CountriesScreenRouterProtocol Conform
	
	func openNewsfeedScreen(for country: Countries) {
		let newsfeedScreen = NewsfeedScreenAssembly.makeNewsFeed(for: country)
		self.navigationController?.pushViewController(newsfeedScreen, animated: true)
	}
}
