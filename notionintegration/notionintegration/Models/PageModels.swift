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
    let object = "page"
    var id: String
    var created_time: String
    var last_edited_time: String
    var archived: Bool
    var properties: [String: PropertyObject]
    var parent: NotionDBParent
}

struct NotionDBParent: Codable {
    let type = "database_id"
    let database_id: String
}

struct NotionPParent: Codable {
    let type = "page_id"
    let page_id: String
}

struct NotionWParent: Codable {
    let type = "workspace"
}

let testPage = NotionDBPage(
    id: UUID().uuidString,
    created_time: "2020-03-17T19:10:04.968Z",
    last_edited_time: "2020-03-17T19:10:04.968Z",
    archived: false,
    properties: testProperties,
    parent: NotionDBParent(database_id: databaseID))
