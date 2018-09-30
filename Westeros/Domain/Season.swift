//
//  Season.swift
//  Westeros
//
//  Created by Joaquín Gracia López on 28/9/18.
//  Copyright © 2018 Web Cor. All rights reserved.
//


import Foundation

typealias Episodes = Set<Episode>

final class Season {
    let name: String
    let releaseDate: Date
 
    private var _episodes: Episodes
    private var _dateFormated = DateFormatter()
    
    var sortedEpisodes: [Episode]{
        return _episodes.sorted()
    }
    
    init(name: String, releaseDate: Date) {
        self.name = name
        self.releaseDate = releaseDate
        self._episodes = Episodes()
        self._dateFormated.dateFormat="yyyy-MM-dd"
    }
}

extension Season{
    var releaseDateString: String {
        return self._dateFormated.string(from: releaseDate)
    }
}

// Episode counter
extension Season {
    var count: Int {
        return _episodes.count
    }
    
    func add(episode: Episode) {
        guard self == episode.season else {
            return
        }
        
        _episodes.insert(episode)
    }
    
    func add(episodes: Episode...) {
        episodes.forEach { add(episode: $0) }
    }
    
}

extension Season {
    var proxyForEquality: String {
        return "\(releaseDateString)\(name)"
    }

    // To order and compare them we will use the value of type date
    var proxyForComparison: Date {
        return releaseDate
    }
}


extension Season: CustomStringConvertible {
    var description: String {
        return "\(name) \(releaseDateString)"
    }
}
extension Season: Equatable {
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Season: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension Season: Comparable {
    static func < (lhs: Season, rhs: Season) -> Bool {
        // Date order
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
