//
//  ModuleFactory.swift.swift
//  Combine-VIPER
//
//  Created by Cameron Porter on 13/12/21.
//

import Foundation
import UIKit

class ModuleFactory<M,I,P,V> where I: ModelInteractorInterface, V: View<P>,
I.Model == M, P.Interactor == I {
  
  func createModule(for frame: CGRect) -> V {
    let model = M()
    let interactor = I(model: model)
    let presenter = P(interactor: interactor)
    let view = V(frame: frame, presenter: presenter)
    
    let array: [VIPERInterface] = [model, interactor, presenter, view]
    array.forEach { $0.moduleDidCreate() }
    
    return view
  }
}

class ProviderModuleFactory<R,PR,M,I,P,V> where R: RepositoryInterface,
I: ModelProviderInteractorInterface, V: View<P>, PR.Repository == R, I.Model == M,
I.Provider == PR, P.Interactor == I {
  
  func createModule(for frame: CGRect) -> V {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let repository = R(persistence: appDelegate.persistence)
    let provider = PR(repository: repository)
    let model = M()
    let interactor = I(model: model, provider: provider)
    let presenter = P(interactor: interactor)
    let view = V(frame: frame, presenter: presenter)
    
    let array: [VIPERInterface] = [model, interactor, presenter, view]
    array.forEach { $0.moduleDidCreate() }
    
    return view
  }
}
