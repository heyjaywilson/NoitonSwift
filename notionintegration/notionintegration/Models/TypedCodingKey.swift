//
//  TypedCodingKey.swift
//  notionintegration
//
//  Created by Maegan Wilson on 5/18/21.
//

import Foundation

struct TypedAnyCodingKey<Key: CodingKey>: CodingKey, Equatable where Key: RawRepresentable, Key.RawValue == String {
    <#fields#>
}
