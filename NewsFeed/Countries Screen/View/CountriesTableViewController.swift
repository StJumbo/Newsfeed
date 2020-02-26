//
//  CountriesTableViewController.swift
//  NewsFeed
//
//  Created by 17672395 on 25/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//

import UIKit

class CountriesTableViewController: UITableViewController {

	private let items: [Countries]
	private let router: CountriesScreenRouterProtocol

	init(with items: [Countries], router: CountriesScreenRouterProtocol) {
		self.items = items
		self.router = router
		
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.navigationController?.navigationBar.prefersLargeTitles = true
		self.title = "Choose country"

		self.tableView.dataSource = self
		self.tableView.delegate = self
		self.tableView.register(CountriesTableViewCell.self, forCellReuseIdentifier: CountriesTableViewCell.reuseIdentifier)
	}


	// MARK: - Table view data source

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.items.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: CountriesTableViewCell.reuseIdentifier, for: indexPath) as! CountriesTableViewCell
		cell.fillCell(with: self.items[indexPath.row])
		
		return cell
	}


	// MARK: - TableView Delegate

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.router.openNewsfeedScreen(for: self.items[indexPath.row])
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
