//
//  TypeAliases.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 31/03/2022.
//

import Foundation

typealias RequestCompletion<T> = (Result<T, Error>) -> Void
