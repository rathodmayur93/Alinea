//
//  ViewModelProtocol.swift
//  Alinea
//
//  Created by ds-mayur on 18/11/2020.
//

protocol ViewModelProtocol {
    var items : [Any] { get }
    func getSectionTitle(_ section : Int) -> String
    func numberOfItems(_ section : Int) -> Int
    func modelAt(_ section : Int, _ index: Int) -> Any
}
