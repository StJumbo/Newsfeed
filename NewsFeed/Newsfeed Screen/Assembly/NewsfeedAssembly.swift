//
//  NewsfeedAssembly.swift
//  NewsFeed
//
//  Created by 17672395 on 26/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//


import Foundation
import UIKit


/// Ассембли экрана новостной ленты
class NewsfeedScreenAssembly {

	/// Метод для создания экрана новостной ленты
	/// - Parameter country: страна, по которой нужно показать новости
	static func makeNewsFeed(for country: Countries) -> UIViewController {
		let networkService = NewsfeedNetworkService()
		let presenter = NewsfeedPresenter()
		let interactor = NewsfeedInteractor.init(networkService: networkService, presenter: presenter)
		let screen = NewsfeedViewController.init(for: country, interactor: interactor, presenter: presenter)
		interactor.view = screen
		presenter.view = screen
		return screen
	}
}
