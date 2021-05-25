//
//  TypedCodingKey.swift
//  notionintegration
//
//  Created by Maegan Wilson on 5/18/21.
//

import Foundation

struct TypedAnyCodingKey<Key: CodingKey>: CodingKey, Equatable where Key: RawRepresentable, Key.RawValue == String {
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }
    
    init?(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }
    
    init(_ base: Key) {
        if let intValue = base.intValue {
            self.init(intValue: intValue)!
        } else {
            self.init(stringValue: base.stringValue)!
        }
    }
}

extension TypedAnyCodingKey: Hashable {
    var hashValue: Int {
        self.intValue?.hashValue ?? self.stringValue.hashValue
    }
}


struct AnyCodingKey: CodingKey, Equatable {
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }
    
    init?(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }
    
    init<Key>(_ base: Key) where Key : CodingKey {
        if let intValue = base.intValue {
            self.init(intValue: intValue)!
        } else {
            self.init(stringValue: base.stringValue)!
        }
    }
}

extension AnyCodingKey: Hashable {
    var hashValue: Int {
        self.intValue?.hashValue ?? self.stringValue.hashValue
    }
}
