//
//  NewsfeedInteractor.swift
//  NewsFeed
//
//  Created by 17672395 on 25/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//


import UIKit
import SafariServices


class NewsfeedInteractor: NSObject, NewsfeedInteractorProtocol, UITableViewDelegate {

	weak var view: NewsfeedViewController?

	private let networkService: NetworkServiceProtocol
	private let presenter: NewsfeedPresenterProtocol
	private var page: Int
	private var offset: Int


	init(networkService: NetworkServiceProtocol, presenter: NewsfeedPresenterProtocol) {
		self.networkService = networkService
		self.presenter = presenter
		self.page = 0
		self.offset = 0

		super.init()
	}


	// MARK: - Private Methods

	private func getAnotherNewsPage() {
		guard let view = self.view else { return }
		self.networkService.getNews(for: view.country, on: self.page) { (newsfeed) in
			guard let newsfeed = newsfeed else { return }
			self.presenter.prepareToShow(newsfeed)
		}
	}


	// MARK: - NewsfeedInteractorProtocol Conform

	func screenDidLoad() {
		self.getAnotherNewsPage()
	}


	// MARK: - UITableViewDelegate Conform

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let selectedArticle = self.presenter.articleAt(indexPath: indexPath)
		guard let urlString = selectedArticle.url else { return }
		if let url = URL(string: urlString) {
			let config = SFSafariViewController.Configuration()
			config.entersReaderIfAvailable = true
			let safari = SFSafariViewController(url: url, configuration: config)
			self.view?.present(safari, animated: true, completion: nil)
		}
		tableView.deselectRow(at: indexPath, animated: true)
	}

	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		if indexPath.row == self.offset + 10 {
			self.offset += 20
			self.page += 1
			self.getAnotherNewsPage()
		}
	}


}
