//
//  CountriesTableViewCell.swift
//  NewsFeed
//
//  Created by 17672395 on 26/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//


import UIKit


class CountriesTableViewCell: UITableViewCell {
	static let reuseIdentifier = "CountriesTableViewCell"
	internal let defaultSpace: CGFloat = 8.0

	func fillCell(with country: Countries) {
		self.flagLabel.text = country.flag
		self.titleLabel.text = country.name
	}


	// MARK: - Views

	internal var titleLabel : UILabel = {
		var text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.numberOfLines = 2
		return text
	}()

	internal var flagLabel : UILabel = {
		var flag = UILabel()
		flag.translatesAutoresizingMaskIntoConstraints = false
		return flag
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

	func setupUI() {
		self.addSubview(flagLabel)
		self.addSubview(titleLabel)
		self.setConstraints()
	}

	func setConstraints() {
		flagLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: defaultSpace).isActive = true
		flagLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: defaultSpace).isActive = true
		flagLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)

		titleLabel.topAnchor.constraint(equalTo: flagLabel.topAnchor).isActive = true
		titleLabel.leftAnchor.constraint(equalTo: flagLabel.rightAnchor, constant: defaultSpace).isActive = true
		titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -defaultSpace).isActive = true
		titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -defaultSpace).isActive = true
	}
}
