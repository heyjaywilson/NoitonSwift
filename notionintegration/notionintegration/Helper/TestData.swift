//
//  TestData.swift
//  notionintegration
//
//  Created by Maegan Wilson on 5/18/21.
//

import Foundation

struct TestData {
    let page = Page(object: "hello", id: "dasf", createdTime: Date(), lastEditedTime: Date(), parent: Parent(type: .title), archived: false, properties: [:])
}
