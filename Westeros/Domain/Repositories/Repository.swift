//
//  Repository.swift
//  Westeros
//
//  Created by Joaquín Gracia López on 12/9/18.
//  Copyright © 2018 Web Cor. All rights reserved.
//


import UIKit


final class Repository {
    static let local = LocalFactory()
}

protocol HouseFactory {
    typealias FilterHouse = (House) -> Bool
    var houses: [House] { get }
    func house(named: String) -> House?
    func houses(filteredBy filter: FilterHouse) -> [House]
}


protocol SeasonFactory {
    typealias FilterSeason = (Season) -> Bool
    var seasons: [Season] { get }
    func season(named: String) -> Season?
    func seasons(filteredBy filter: FilterSeason) -> [Season]
}


final class  LocalFactory: HouseFactory {
    
    var houses: [House] {
        // Houses creation here
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing.png")!, description: "Lobo Huargo")
        let lannisterSigil = Sigil(image: UIImage(named: "lannister.jpg")!, description: "Leon Rampante")
        let targaryenSigil = Sigil(image: UIImage(named: "targaryenSmall.jpg")!, description: "Dragon tricefalo")
        
        let starkUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let lannisterUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        let targaryenUrl = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: starkUrl)
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: lannisterUrl)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y Sangre", url: targaryenUrl)
        
        // Characters creation
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El matarreyes", house: lannisterHouse)
        let dani = Person(name: "Daenerys", alias: "Madre de dragones", house: targaryenHouse)
        
        //Add characters to houses
        starkHouse.add(persons: arya, robb)
        lannisterHouse.add(persons: tyrion, jaime, cersei)
        targaryenHouse.add(person: dani)
        
        return [starkHouse, lannisterHouse, targaryenHouse].sorted()
    }
    
    func house(named name: String) -> House? {
        return houses.first { $0.name.uppercased() == name.uppercased() }
    }
    
    func houses(filteredBy: FilterHouse) -> [House] {
        return houses.filter(filteredBy)
    }
}


extension LocalFactory: SeasonFactory {
    var seasons: [Season] {
        let dateFormatetter = DateFormatter()
        dateFormatetter.dateFormat = "yyyy-MM-dd"
        
        // Seasons
        let season1 = Season(name: "Temporada 1", releaseDate: dateFormatetter.date(from: "2011-04-17")!)
        let season2 = Season(name: "Temporada 2", releaseDate: dateFormatetter.date(from: "2012-04-01")!)
        let season3 = Season(name: "Temporada 3", releaseDate: dateFormatetter.date(from: "2013-03-31")!)
        let season4 = Season(name: "Temporada 3", releaseDate: dateFormatetter.date(from: "2013-03-31")!)
        let season5 = Season(name: "Temporada 3", releaseDate: dateFormatetter.date(from: "2013-03-31")!)
        let season6 = Season(name: "Temporada 3", releaseDate: dateFormatetter.date(from: "2013-03-31")!)
        let season7 = Season(name: "Temporada 3", releaseDate: dateFormatetter.date(from: "2013-03-31")!)
        
        // Episodes
        let e1x1 = Episode(name: "1x1 Winter Is Coming", releaseDate: dateFormatetter.date(from: "2011-04-17")!, season: season1)
        let e1x2 = Episode(name: "1x2 The Kingsroad", releaseDate: dateFormatetter.date(from: "2011-04-24")!, season: season1)
        season1.add(episodes: e1x1,e1x2)
        
        let e2x1 = Episode(name: "2x1 The North Remembers", releaseDate: dateFormatetter.date(from: "2012-04-01")!, season: season2)
        let e2x2 = Episode(name: "2x2 The Night Lands", releaseDate: dateFormatetter.date(from: "2012-04-08")!, season: season2)
        season2.add(episodes: e2x1,e2x2)
        
        let e3x1 = Episode(name: "3x1 Valar Dohaeris", releaseDate: dateFormatetter.date(from: "2013-03-31")!, season: season3)
        let e3x2 = Episode(name: "3x2 Dark Wings, Dark Words", releaseDate: dateFormatetter.date(from: "2013-04-07")!, season: season3)
        season3.add(episodes: e3x1,e3x2)
        
        let e4x1 = Episode(name: "4x1 Two Swords", releaseDate: dateFormatetter.date(from: "2014-04-06")!, season: season4)
        let e4x2 = Episode(name: "4x2 The Lion and the Rose", releaseDate: dateFormatetter.date(from: "2014-04-13")!, season: season4)
        season4.add(episodes: e4x1,e4x2)
        
        let e5x1 = Episode(name: "5x1 The Wars to Come", releaseDate: dateFormatetter.date(from: "2015-04-12")!, season: season5)
        let e5x2 = Episode(name: "5x2 The House of Black and White", releaseDate: dateFormatetter.date(from: "2015-04-19")!, season: season5)
        season5.add(episodes: e5x1,e5x2)
        
        let e6x1 = Episode(name: "6x1 The Red Woman", releaseDate: dateFormatetter.date(from: "2016-04-24")!, season: season6)
        let e6x2 = Episode(name: "6x2 Home", releaseDate: dateFormatetter.date(from: "2016-05-01")!, season: season6)
        season6.add(episodes: e6x1,e6x2)
        
        let e7x1 = Episode(name: "7x1 Dragonstone", releaseDate: dateFormatetter.date(from: "2017-07-16")!, season: season7)
        let e7x2 = Episode(name: "7x2 Stormborn", releaseDate: dateFormatetter.date(from: "2017-07-23")!, season: season7)
        season7.add(episodes: e7x1,e7x2)
        
        return [season1, season2, season3,season4,season5,season6,season7].sorted()
    }
    
    func season(named name: String) -> Season? {
       return seasons.first { $0.name.uppercased() == name.uppercased() }
    }
    
    func seasons(filteredBy: FilterSeason) -> [Season] {
         return seasons.filter(filteredBy)
    }
    
}
