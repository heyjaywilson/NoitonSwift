//
//  ParentModel.swift
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
    enum CodingKey: String, Swift.CodingKey {
        case type
    }
    
    enum ParentKeys: String, Decodable {
        case databaseID = "database_id"
        case pageID = "page_id"
        case workspace
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TypedAnyCodingKey<CodingKey>.self)
        let type = try container.decode(ParentKeys.self, forKey: .init(.type))
        switch type {
        case .databaseID:
            let value = try container.decode(String.self, forKey: .init(stringValue: type.rawValue)!)
            self.type = .databaseID(value)
        case .pageID:
            let value = try container.decode(String.self, forKey: .init(stringValue: type.rawValue)!)
            self.type = .pageID(value)
        default:
            self.type = .workspace
        }
    }
    
    public enum TypeValue {
        case databaseID(String)
        case pageID(String)
        case workspace
    }
}

extension Parent {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: TypedAnyCodingKey<CodingKey>.self)
        switch type {
        case let .databaseID(id):
            try container.encode(ParentKeys.databaseID.rawValue, forKey: .init(.type))
            try container.encode(id, forKey: .init(stringValue: ParentKeys.databaseID.rawValue)!)
        case let .pageID(id):
            try container.encode(ParentKeys.pageID.rawValue, forKey: .init(.type))
            try container.encode(id, forKey: .init(stringValue: ParentKeys.pageID.rawValue)!)
        default:
            try container.encode(ParentKeys.workspace.rawValue, forKey: .init(.type))
        }
    }
}
