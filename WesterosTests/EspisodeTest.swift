//
//  EspisodeTest.swift
//  WesterosTests
//
//  Created by Joaquín Gracia López on 28/9/18.
//  Copyright © 2018 Web Cor. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTests: XCTestCase {
    
    var season1: Season!
    var episode1x1: Episode!
    var episode1x2: Episode!
    var dateFormatetter: DateFormatter!
    
    override func setUp() {
        dateFormatetter = DateFormatter()
        dateFormatetter.dateFormat = "yyyy-MM-dd"
        season1 = Season(name: "Temporada 1", releaseDate: dateFormatetter.date(from: "2011-04-17")!)
        episode1x1 = Episode(name: "1x1 Winter Is Coming", releaseDate: dateFormatetter.date(from: "2011-04-17")!,digest:"El rey Robert Baratheon de Poniente viaja al Norte para ofrecerle a su viejo amigo Eddard Ned Stark, Guardián del Norte y Señor de Invernalia, el puesto de Mano del Rey. La esposa de Ned, Catelyn, recibe una carta de su hermana Lysa que implica a miembros de la familia Lannister, la familia de la reina Cersei, en el asesinato de su marido Jon Arryn, la anterior Mano del Rey. Bran, uno de los hijos de Ned y Catelyn, escala un muro y descubre a la reina Cersei y a su hermano Jaime teniendo relaciones sexuales, Jaime empuja al pequeño Bran esperando que la caída lo mate y así evitar ser delatado por el niño. Mientras tanto, al otro lado del mar Angosto, el príncipe exiliado Viserys Targaryen forja una alianza para recuperar el Trono de Hierro: dará a su hermana Daenerys en matrimonio al salvaje dothraki Khal Drogo a cambio de su ejército. El caballero exiliado Jorah Mormont se unirá a ellos para proteger a Daenerys. ", season: season1)
       episode1x2 = Episode(name: "1x2 The Kingsroad", releaseDate: dateFormatetter.date(from: "2011-04-24")!, digest:"Tras aceptar su nuevo rol como Mano del Rey, Ned parte hacia Desembarco del Rey con sus hijas Sansa y Arya, mientras que el hijo mayor, Robb, se queda al frente de los asuntos de su padre en la ciudad. Jon Nieve, el hijo bastardo de Ned, se dirige al Muro para unirse a la Guardia de la Noche. Tyrion Lannister, el hermano menor de la Reina, decide no ir con el resto de la familia real al sur y acompaña a Jon en su viaje al Muro. Viserys sigue esperando su momento de ganar el Trono de Hierro y Daenerys centra su atención en aprender cómo gustarle a su nuevo esposo, Drogo. ",season: season1)
        
    }
    func testEpisodeExistence() {
        XCTAssertNotNil(episode1x1)
    }
    func testEpisodeCustomStringConvertible() {
        XCTAssertNotNil(episode1x1.description)
   
    }
    
    func testSeasonEquatable() {
        // 1. Identidad
        XCTAssertEqual(episode1x1 , episode1x1 )
        // 2. Igualdad
        let episodeTest = Episode(name: "1x1 Winter Is Coming", releaseDate: dateFormatetter.date(from: "2011-04-17")!,digest:"El rey Robert Baratheon de Poniente viaja al Norte para ofrecerle a su viejo amigo Eddard Ned Stark, Guardián del Norte y Señor de Invernalia, el puesto de Mano del Rey. La esposa de Ned, Catelyn, recibe una carta de su hermana Lysa que implica a miembros de la familia Lannister, la familia de la reina Cersei, en el asesinato de su marido Jon Arryn, la anterior Mano del Rey. Bran, uno de los hijos de Ned y Catelyn, escala un muro y descubre a la reina Cersei y a su hermano Jaime teniendo relaciones sexuales, Jaime empuja al pequeño Bran esperando que la caída lo mate y así evitar ser delatado por el niño. Mientras tanto, al otro lado del mar Angosto, el príncipe exiliado Viserys Targaryen forja una alianza para recuperar el Trono de Hierro: dará a su hermana Daenerys en matrimonio al salvaje dothraki Khal Drogo a cambio de su ejército. El caballero exiliado Jorah Mormont se unirá a ellos para proteger a Daenerys. ", season: season1)
        XCTAssertEqual(episodeTest, episode1x1)
        // 3. Desigualdad
        XCTAssertNotEqual(episode1x1, episode1x2)
        
    }
    
    func testEpisodeHashable() {
        XCTAssertNotNil(episode1x1.hashValue)
        XCTAssertNotNil(episode1x2.hashValue)
    }
    func testSeasonComparable() {
        XCTAssertLessThan(episode1x1, episode1x2)
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
}
