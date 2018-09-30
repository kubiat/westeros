//
//  Episode.swift
//  Westeros
//
//  Created by Joaquín Gracia López on 28/9/18.
//  Copyright © 2018 Web Cor. All rights reserved.
//


import Foundation

final class Episode {
    
    // Mark: - Properties
    let name: String
    let releaseDate: Date
    private var _dateFormated = DateFormatter()
    weak var season: Season?
    let digest: String
    
    // Mark: - Initialization    
    init(name: String, releaseDate: Date, digest: String, season: Season?) {
        self.name = name
        self.releaseDate = releaseDate
        self.season = season
        self.digest = digest
        self._dateFormated.dateFormat="yyyy-MM-dd"
        self.season?.add(episode: self)
    }
    
}
extension Episode{
    var releaseDateString: String {
        return self._dateFormated.string(from: releaseDate)
    }
}


extension Episode {
    var fullName: String {
        return "\(season!.name) - \(name)"
    }
}

extension Episode {
    var proxyForEquality: String {
        return "\(releaseDateString) \(season!.name) - \(name)"
    }
    
    // To order and compare them we will use the value of type date
    var proxyForComparison: Date {
        return releaseDate
    }
}

extension Episode: CustomStringConvertible {
    var description: String {
        return "\(name) \(releaseDateString)"
    }
}

extension Episode: Equatable {
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}
extension Episode: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}
extension Episode: Comparable {
    static func < (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
}
