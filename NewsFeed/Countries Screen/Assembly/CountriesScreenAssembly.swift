//
//  CountriesScreenAssembly.swift
//  NewsFeed
//
//  Created by 17672395 on 26/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//


import Foundation
import UIKit


/// Ассембли экрана с выбором стран
class CountriesScreenAssembly {

	/// Метод для сборки экрана выбора страны
	/// - Parameter navigationController: анвигационный контроллер, на котором будет показан данный экран
	static func makeCountriesScreen(_ navigationController: UINavigationController) -> UIViewController {
		let router = CountriesScreenRouter.init(navigationController)
		let countriesScreen = CountriesTableViewController.init(with: Countries.allCountries, router: router)
		
		return countriesScreen
	}
}
