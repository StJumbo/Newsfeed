//
//  NewsfeedInteractorProtocol.swift
//  NewsFeed
//
//  Created by 17672395 on 25/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//

import Foundation
import UIKit


/// Протокол интерактора экрана новостей
protocol NewsfeedInteractorProtocol: UITableViewDelegate {

	/// Обработка события загрузки экрана
	func screenDidLoad()
}
