//
//  Singleton.swift
//  SynchronizationDemo
//
//  Created by Angelos Staboulis on 14/1/25.
//

import Foundation
import Synchronization
final class Singleton: Sendable {
    
    static let shared: Singleton = .init()
    
    func storeData(_ data: Int, forKey key: Int) {
        cache.withLock{
            $0[key] = data
        }
    }

       func fetchData(forKey key: Int) -> Int? {
           cache.withLock{
                return $0[key]
           }
       }
    
    private let cache =  Mutex([Int:Int]())
    
    private init() {}
    
}
