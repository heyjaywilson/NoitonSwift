//
//  PageModels.swift
//  notionintegration
//
//  Created by Maegan Wilson on 5/16/21.
//

import Foundation

struct NotionPage: Codable {
    var object = "page"
    var id: String
    var created_time: String
    var last_edited_time: String
    var archived: Bool
    var properties: PropertyObject
}

struct NotionDBPage: Codable {
    var parent: NotionDBParent
    var properties: [String: PropertyObject]
}

struct NotionDBParent: Codable {
    let database_id: String
}

struct NotionPParent: Codable {
//    var type = "page_id"
    let page_id: String
}

struct NotionWParent: Codable {
    var type = "workspace"
}

let testPage = NotionDBPage(
    parent: NotionDBParent(database_id: databaseID),
    properties: testProperties
)
