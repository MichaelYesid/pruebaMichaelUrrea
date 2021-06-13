//
//  Acron.swift
//  pruebaMichaelUrrea
//
//  Created by Michaelu on 13/06/21.
//

import Foundation

// MARK: - AcronElement
struct AcronElement: Codable {
    let sf: String
    let lfs: [LF]
}

// MARK: - LF
struct LF: Codable {
    let lf: String
    let freq, since: Int
    let vars: [LF]?
}
