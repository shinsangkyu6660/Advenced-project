//
//  BookItem.swift
//  BookAdvenced
//
//  Created by 신상규 on 8/1/24.
//

import Foundation

struct BookItems: Codable {
    let results: [Book]
}

struct Book: Codable {
    let query: String?
    let title: String?
    let thumbnail: String?
}
