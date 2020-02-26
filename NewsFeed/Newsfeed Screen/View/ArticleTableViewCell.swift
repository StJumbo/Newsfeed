//
//  ArticleTableViewCell.swift
//  NewsFeed
//
//  Created by 17672395 on 26/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//

import UIKit


/// Ячейка статьи
class ArticleTableViewCell: UITableViewCell {
	static let reuseIdentifier = "ArticleTableViewCell"
	private let defaultSpace: CGFloat = 8.0

	func fillCell(with article: Article) {
		self.titleLabel.text = article.title
		if let author = article.author {
			self.authorLabel.text = "by \(author)"
		}
		self.descriptionLabel.text = article.description
	}


	// MARK: - Views

	internal var pictureView : UIImageView = {
		var picView = UIImageView()
		picView.translatesAutoresizingMaskIntoConstraints = false
		picView.contentMode = .scaleAspectFit
		return picView
	}()

	internal var titleLabel : UILabel = {
		var text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.numberOfLines = 0
		text.font = UIFont.boldSystemFont(ofSize: 18.0)
		return text
	}()

	internal var authorLabel : UILabel = {
		var text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.font = UIFont.systemFont(ofSize: 10.0)
		return text
	}()

	internal var descriptionLabel : UILabel = {
		var text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.numberOfLines = 0
		return text
	}()


	// MARK: - Init

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		self.setupUI()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	// MARK: - Setup UI & Constraints

	private func setupUI() {
		self.addSubview(pictureView)
		self.addSubview(titleLabel)
		self.addSubview(authorLabel)
		self.addSubview(descriptionLabel)
		self.setConstraints()
	}


	private func setConstraints() {
		let height = self.bounds.size.width * 0.75

		pictureView.topAnchor.constraint(equalTo: self.topAnchor, constant: defaultSpace).isActive = true
		pictureView.heightAnchor.constraint(equalToConstant: height).isActive = true
		pictureView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
		pictureView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true

		titleLabel.topAnchor.constraint(equalTo: pictureView.bottomAnchor, constant: defaultSpace).isActive = true
		titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: defaultSpace).isActive = true
		titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -defaultSpace).isActive = true

		authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: defaultSpace).isActive = true
		authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
		authorLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true

		descriptionLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: defaultSpace).isActive = true
		descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
		descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
		descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -defaultSpace).isActive = true
	}


	//MARK: - Cell Reuse

	override func prepareForReuse() {
		pictureView.image = nil
	}
}
