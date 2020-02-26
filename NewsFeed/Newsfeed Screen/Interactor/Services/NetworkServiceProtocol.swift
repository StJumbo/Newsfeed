//
//  NetworkServiceProtocol.swift
//  NewsFeed
//
//  Created by 17672395 on 26/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//

import Foundation


/// Протокол сетевого сервиса новостей
protocol NetworkServiceProtocol {

	/// Метод для загрузки порции новостей для определенной страны
	/// - Parameters:
	///   - country: страна, для которой надо загрущить новости
	///   - page: страница, которую надо загрузить
	///   - completion: замыкание для обработки полученных данных
	func getNews(for country: Countries, on page: Int, completion: @escaping ([Article]?) -> ())
}
