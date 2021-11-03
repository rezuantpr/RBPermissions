//
//  File.swift
//  
//
//  Created by Rezuan Bidzhiev on 15.07.2021.
//

import Foundation
import RxSwift

public extension Reactive where Base: Permission {
  var request: Observable<PermissionStatus> {
    Observable<PermissionStatus>.create { observer in
      base.request {
        observer.onNext(base.status)
        observer.onCompleted()
      }
      return Disposables.create()
    }
  }
}
