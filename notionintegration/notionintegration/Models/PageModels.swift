//
//  PageModels.swift
//  notionintegration
//
//  Created by Maegan Wilson on 5/16/21.
//

import Foundation

public struct Page: Decodable, Identifiable {
    public let object: String
    public let id: String
    public let createdTime: Date
    public let lastEditedTime: Date
    public let parent: Parent
    public let archived: Bool
    public let properties: [String : String]
}
