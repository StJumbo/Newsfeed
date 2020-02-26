//
//  NewsFeedLoader.swift
//  NewsFeed
//
//  Created by 17672395 on 25/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//

import Foundation

class NewsfeedNetworkService: NetworkServiceProtocol {


	// MARK: - NewsfeedNetworkServiceProtocol Conform

	func getNews(for country: Countries, on page: Int, completion: @escaping ([Article]?) -> ()) {
		let url = URL(string: API.url(for: country, page: page))!

		let session = URLSession.shared
		DispatchQueue.global().async {
			session.dataTask(with: url) { (data, responce, error) in
				guard let data = data else {
					print(error?.localizedDescription ?? "Can't make data from response")
					completion(nil)
					return
				}

				guard let request = try? JSONDecoder().decode(Request.self, from: data) else {
					print(error?.localizedDescription ?? "Can't parse data")
					completion(nil)
					return
				}

				completion(request.articles)
			}.resume()
		}
	}
}

