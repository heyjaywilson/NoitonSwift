//
//  NotionModels.swift
//  notionintegration
//
//  Created by Maegan Wilson on 5/16/21.
//

import Foundation

struct NotionDB: Codable{
    let object = "database"
    var id: String
    let created: String
    var lastEdited: String
    var title: [RichTextObject]
    var properties: PropertyObject
    
    enum CodingKeys: String, CodingKey {
        case id
        case created = "created_time"
        case lastEdited = "last_edited_time"
        case title
        case properties
    }
}

struct RichTextObject: Codable {
    let plainText: String
    var href: String?
    var annotations: AnnotationObject
    var type: String
    
    enum CodingKeys: String, CodingKey {
        case plainText = "plain_text"
        case href
        case annotations
        case type
    }
}

struct PropertyObject: Codable {
    var id: String
    var type: String
}

struct AnnotationObject: Codable {
    var bold: Bool
    var italic: Bool
    var strikethrough: Bool
    var underline: Bool
    var code: Bool
    var color: String
}

let testDBRow = NotionDB(
    id: UUID().uuidString,
    created: Date().description,
    lastEdited: Date().description,
    title: [testTitle],
    properties: testPropertyObject)

let testTitle = RichTextObject(
    plainText: "hello",
    href: nil,
    annotations: testAnnotationObject,
    type: "text")

let testAnnotationObject = AnnotationObject(
    bold: true,
    italic: false,
    strikethrough: false,
    underline: false,
    code: false,
    color: "blue")

let testPropertyObject = PropertyObject(
    id: "fy:{",
    type: "rich_text")

let testProperties = [
    "Name" : [PropertyObject(id: "text", type: "title")],
    "Tags": [PropertyObject(id: "fy:{", type: "rich_text")]
]
