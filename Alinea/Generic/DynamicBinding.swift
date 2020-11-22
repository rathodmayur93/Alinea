//
//  DynamicBinding.swift
//  Alinea
//
//  Created by ds-mayur on 17/11/2020.
//

class DynamicBinding<T> {
    
    typealias Listener = (T) -> ()
    var listener : Listener?
    
    var value : T {
        didSet{
            listener?(value)
        }
    }
    
    func bind(listener : @escaping Listener){
        self.listener = listener
        self.listener?(self.value)
    }
    
    init(_ value : T) {
        self.value = value
    }
}
