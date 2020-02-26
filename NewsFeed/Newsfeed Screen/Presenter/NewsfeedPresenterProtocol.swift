//
//  NewsfeedPresenterProtocol.swift
//  NewsFeed
//
//  Created by 17672395 on 26/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//


import Foundation
import UIKit


/// Протокол презентера экрана новостей
protocol NewsfeedPresenterProtocol: UITableViewDataSource {

	/// Метод для подготовки к показу новой части статей
	/// - Parameter articles: новые статьи
	func prepareToShow(_ articles: [Article])

	/// Метод для получения статьи по индекс пасу
	/// - Parameter indexPath: индекс пас нужной статьи
	func articleAt(indexPath: IndexPath) -> Article
}
