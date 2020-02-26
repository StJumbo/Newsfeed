//
//  NewsfeedPresenter.swift
//  NewsFeed
//
//  Created by 17672395 on 26/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//

import Foundation
import UIKit


/// Презентер экрана новостей
class NewsfeedPresenter: NSObject, NewsfeedPresenterProtocol {

	private var items: [Article] = []
	weak var view: NewsfeedViewController?


	// MARK: - NewsfeedPresenterProtocol Conform

	func prepareToShow(_ articles: [Article]) {
		self.items += articles
		DispatchQueue.main.async {
			self.view?.tableView.reloadData()
		}
	}

	func articleAt(indexPath: IndexPath) -> Article {
		return self.items[indexPath.row + 10]
	}


	// MARK: - NewsfeedPresenterProtocol Conform

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.items.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.reuseIdentifier, for: indexPath) as! ArticleTableViewCell

		let article = self.items[indexPath.row]
		cell.fillCell(with: article)
		
		if let imageUrl = URL(string: article.imageUrl ?? "") {
			cell.pictureView.loadPicture(from: imageUrl) { (image) in
				if let updateCell = tableView.cellForRow(at: indexPath) as? ArticleTableViewCell {
					updateCell.pictureView.image = image
				}
			}
		}

		return cell
	}


}
