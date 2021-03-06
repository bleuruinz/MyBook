//
//  Book.swift
//  MyBook
//
//  Created by ktds 13 on 2017. 8. 17..
//  Copyright © 2017년 CJ Olivenetworks. All rights reserved.
//

import Foundation
import UIKit

class Book {
    var title:String
    var writer:String?
    var publisher:String?
    var coverImage:UIImage?
    var price:Int?
    var description:String?
    var url:String?
    
    init(title:String,
         writer:String?,
         publisher:String?,
         coverImage:UIImage?,
         price:Int?,
         description:String?,
         url:String?) {
        
        self.title = title
        self.writer = writer
        self.publisher = publisher
        self.coverImage = coverImage
        self.price = price
        self.description = description
        self.url = url
        
    }
    
    convenience init(title:String, writer:String) {
        
        self.init(title:title, writer:writer, publisher:nil, coverImage:nil, price:nil, description:nil, url:nil)
//        self.title = title
//        self.writer = writer
//        self.publisher = nil
//        self.coverImage = nil
//        self.price = nil
//        self.description = nil
//        self.url = nil
    }
    
    init(title:String, writer:String, publisher:String) {
        self.title = title
        self.writer = writer
        self.publisher = publisher
        self.coverImage = nil
        self.price = nil
        self.description = nil
        self.url = nil
    }
    
}
