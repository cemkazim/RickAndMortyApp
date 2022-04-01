//
//  CharacterListModel.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 01/04/2022.
//

import Foundation

struct CharacterListModel: Decodable {
    let info: CharacterInfo?
    let results: [CharacterResult]?
}

struct CharacterInfo: Decodable {
    let count, pages: Int?
    let next: String?
}

struct CharacterResult: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

struct Location: Decodable {
    let name: String?
    let url: String?
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
