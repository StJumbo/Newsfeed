//
//  NewsEntity.swift
//  NewsFeed
//
//  Created by 17672395 on 26/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//


import Foundation


/// Модель ответа сервера
class Request: Codable {
	let articles: [Article]

	enum CodingKeys: CodingKey {
		case articles
	}
}

/// Модель статьи
class Article: Codable {
	let author: String?
	let title: String?
	let description: String?
	let url: String?
	let imageUrl: String?

	enum CodingKeys: String, CodingKey {
		case author = "author"
		case title = "title"
		case description = "description"
		case url = "url"
		case imageUrl = "urlToImage"
	}
}

