//
//  CountriesSceenRouterProtocol.swift
//  NewsFeed
//
//  Created by 17672395 on 26/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//

import Foundation


/// Протокол роутера экрана выбора страны
protocol CountriesScreenRouterProtocol {

	/// Метод открытия экрана новостей для выбранной страны
	/// - Parameter country: страна, для которой надо показать новости
	func openNewsfeedScreen(for country: Countries)
}
