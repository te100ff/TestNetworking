//
//  Enums.swift
//  TestNetworking
//
//  Created by Stanislav Testov on 01.05.2021.
//

import Foundation

enum MenuItems: String, CaseIterable {
    case aboutBook = "About book"
    case jonSnow = "Jon Snow"
    case daenerys = "Daenerys Targaryen"
    case urlErrorAlert = "URL Error Alert"
    case decodeErrorAlert = "Decode Error Alert"
}

enum URLList: String {
    case bookImage = "https://images.askmen.com/1080x540/2016/08/01-094345-hbo_launches_game_of_thrones_election_voting.jpg"
    case jonSnow = "https://anapioficeandfire.com/api/characters/583"
    case daenerys = "https://anapioficeandfire.com/api/characters/1303"
    case urlErrorAlert = "bla bla bla"
    case decodeErrorAlert = "https://images-na.ssl-images-amazon.com/images/M/MV5BMTk5MTYwNDc0OF5BMl5BanBnXkFtZTcwOTg2NDg1Nw@@._V1._SX100_SY140_.jpg"
}
