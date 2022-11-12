//
//  Card.swift
//  Quizlet-ish
//
//  Created by Carolyn Liu on 11/10/22.
//

import Foundation
import FirebaseFirestoreSwift

struct Card: Identifiable, Codable {
    @DocumentID var id: String?
    var question: String
    var answer: String
    var successful: Bool = true
    var userId: String?
}
