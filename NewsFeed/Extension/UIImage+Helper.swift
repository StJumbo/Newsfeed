//
//  UIImage+Helper.swift
//  NewsFeed
//
//  Created by 17672395 on 26/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//

import UIKit

extension UIImageView {
	/// Метод для загрузки картинки
	/// - Parameters:
	///   - url: ссылка на картинку
	///   - completion: замыкание обработки результата
	func loadPicture(from url: URL, completion:@escaping (UIImage)->()) {
		DispatchQueue.global(qos: .default).async {
			if let data = try? Data(contentsOf: url) {
				if let image = UIImage(data: data) {
					DispatchQueue.main.async {
						completion(image)
					}
				} else {
					DispatchQueue.main.async {
						self.image = nil
					}
				}
			}
		}
	}
}
