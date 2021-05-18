//
//  ParentModels.swift
//  notionintegration
//
//  Created by Maegan Wilson on 5/17/21.
//

import Foundation

public struct Parent: Codable {
    public init(type: Parent.TypeValue) {
        self.type = type
    }
    
    public let type: TypeValue
}

extension Parent {
    enum ParentKeys: String, Decodable {
        case databaseID = "database_id"
        case pageID = "page_id"
        case workspace
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TypedAny)
    }
    
    public enum TypeValue {
        case databaseID(String)
        case pageID(String)
        case workspace
    }
//    public enum TypeValue {
//        case title
//        case richText
//        case number
//        case select
//        case multiSelect
//        case date
//        case people
//        case file
//        case checkbox
//        case url
//        case email
//        case phoneNumber
//        case formula
//        case relation
//        case rollup
//        case createdTime
//        case createdBy
//        case lastEditedTime
//        case lastEditedBy
//
//        case custom
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case title = "title"
//        case richText = "rich_text"
//        case number = "number"
//        case select = "select"
//        case multiSelect = "multi_select"
//        case date = "date"
//        case people = "people"
//        case files = "files"
//        case checkbox = "checkbox"
//        case url = "url"
//        case email = "email"
//        case phoneNumber = "phone_number"
//        case formula = "formula"
//        case relation = "relation"
//        case rollup = "rollup"
//        case createdTime = "created_time"
//        case createdBy = "created_by"
//        case lastEditedTime = "last_edited_time"
//        case lastEditedBy = "last_edited_by"
//        case custom
//    }
}
