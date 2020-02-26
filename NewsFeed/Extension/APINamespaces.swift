//
//  URL+APIHelper.swift
//  NewsFeed
//
//  Created by 17672395 on 25/02/2020.
//  Copyright © 2020 17672395. All rights reserved.
//


import Foundation


/// Enum для работы с API
enum API {
	/// Метод, который собирает ссылку для загрузки новой страницы новостей
	/// - Parameters:
	///   - country: страна, для которой нужны новости
	///   - page: номер страницы, которую нужно загрузить
	static func url(for country: Countries, page: Int) -> String {
		return "http://newsapi.org/v2/top-headlines?country=\(country)&page=\(page)&apiKey=d1a1b759d11b4cf6b970c78611374b5a"
	}
}

/// Enum с доступными странами в API
enum Countries: String {
	case ae = "ae"
	case ar = "ar"
	case at = "at"
	case au = "au"
	case be = "be"
	case bg = "bg"
	case br = "br"
	case ca = "ca"
	case ch = "ch"
	case cn = "cn"
	case co = "co"
	case cu = "cu"
	case cz = "cz"
	case de = "de"
	case eg = "eg"
	case fr = "fr"
	case gb = "gb"
	case gr = "gr"
	case hk = "hk"
	case hu = "hu"
	case id = "id"
	case ie = "ie"
	case il = "il"
	case `in` = "in"
	case it = "it"
	case jp = "jp"
	case kr = "kr"
	case lt = "lt"
	case lv = "lv"
	case ma = "ma"
	case mx = "mx"
	case my = "my"
	case ng = "ng"
	case nl = "nl"
	case no = "no"
	case nz = "nz"
	case ph = "ph"
	case pl = "pl"
	case pt = "pt"
	case ro = "ro"
	case rs = "rs"
	case ru = "ru"
	case sa = "sa"
	case se = "se"
	case sg = "sg"
	case si = "si"
	case sk = "sk"
	case th = "th"
	case tr = "tr"
	case tw = "tw"
	case ua = "ua"
	case us = "us"
	case ve = "ve"
	case za = "za"

	/// Флаг страны в виде emoji
	var flag: String {
		let base : UInt32 = 127397
		var flag = ""
		for char in self.rawValue.uppercased().unicodeScalars {
			flag.unicodeScalars.append(UnicodeScalar(base + char.value)!)
		}
		return flag
	}

	/// Все доступные страны
	static var allCountries: [Countries] {
		return [.ae, .ar, .at, .au, .be, .bg, .br, .ca, .ch, .cn, .co, .cu, .cz, .de, .eg,
				.fr, .gb, .gr, .hk, .hu, .id, .ie, .il, .it, .jp, .kr, .lt, .lv, .ma, .mx,
				.my, .ng, .nl, .no, .nz, .ph, .pl, .pt, .ro, .rs, .ru, .sa, .se, .sg, .si,
				.sk, .th, .tr, .tw, .ua, .us, .ve, .za]
	}

	/// Полное название страны
	var name: String {
		switch self {
		case .ar: return "Argentina"
		case .au: return "Australia"
		case .at: return "Austria"
		case .be: return "Belgium"
		case .br: return "Brazil"
		case .bg: return "Bulgaria"
		case .ca: return "Canada"
		case .cn: return "China"
		case .co: return "Colombia"
		case .cu: return "Cuba"
		case .cz: return "Czechia"
		case .eg: return "Egypt"
		case .fr: return "France"
		case .de: return "Germany"
		case .gr: return "Greece"
		case .hk: return "Hong Kong"
		case .hu: return "Hungary"
		case .in: return "India"
		case .id: return "Indonesia"
		case .ie: return "Ireland"
		case .il: return "Israel"
		case .it: return "Italy"
		case .jp: return "Japan"
		case .kr: return "Korea (Republic of)"
		case .lv: return "Latvia"
		case .lt: return "Lithuania"
		case .my: return "Malaysia"
		case .mx: return "Mexico"
		case .ma: return "Morocco"
		case .nl: return "Netherlands"
		case .nz: return "New Zealand"
		case .ng: return "Nigeria"
		case .no: return "Norway"
		case .ph: return "Philippines"
		case .pl: return "Poland"
		case .pt: return "Portugal"
		case .ro: return "Romania"
		case .ru: return "Russian Federation"
		case .sa: return "Saudi Arabia"
		case .rs: return "Serbia"
		case .sg: return "Singapore"
		case .sk: return "Slovakia"
		case .si: return "Slovenia"
		case .za: return "South Africa"
		case .se: return "Sweden"
		case .ch: return "Switzerland"
		case .tw: return "Taiwan, Province of China[a]"
		case .th: return "Thailand"
		case .tr: return "Turkey"
		case .ua: return "Ukraine"
		case .ae: return "United Arab Emirates"
		case .gb: return "United Kingdom of Great Britain and Northern Ireland"
		case .us: return "United States of America"
		case .ve: return "Venezuela (Bolivarian Republic of)"
		}
	}
}
