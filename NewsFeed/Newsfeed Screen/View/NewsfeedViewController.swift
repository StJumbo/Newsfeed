//
//  NewsfeedViewController.swift
//  NewsFeed
//
//  Created by 17672395 on 25/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//


import UIKit
import Foundation


/// Экран новостной ленты
class NewsfeedViewController: UITableViewController {

	let country: Countries
	private let interactor: NewsfeedInteractorProtocol
	private let presenter: NewsfeedPresenterProtocol

	/// Инит экрана новостной ленты
	/// - Parameter country: страна, для которой надо показать новостную ленту
	init(for country: Countries, interactor: NewsfeedInteractorProtocol, presenter: NewsfeedPresenterProtocol) {
		self.country = country
		self.interactor = interactor
		self.presenter = presenter

		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.navigationController?.navigationBar.prefersLargeTitles = false
		self.title = "News in \(self.country.flag)"

		self.tableView.delegate = self.interactor
		self.tableView.dataSource = self.presenter
		self.tableView.rowHeight = UITableView.automaticDimension
		self.tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.reuseIdentifier)
		self.interactor.screenDidLoad()
	}
}
