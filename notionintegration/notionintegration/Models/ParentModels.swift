//
//  ParentModels.swift
//  notionintegration
//
//  Created by Maegan Wilson on 5/17/21.
//

import Foundation

struct Parent: Codable {
    public init(type: Parent.TypeValue) {
        self.type = type
    }
    
    public let type: TypeValue
    
    enum TypeValue {
        case title
        case richText
        case number
        case select
        case multiSelect
        case date
        case people
        case file
        case checkbox
        case url
        case email
        case phoneNumber
        case formula
        case relation
        case rollup
        case createdTime
        case createdBy
        case lastEditedTime
        case lastEditedBy
        
        case custom
    }
}
