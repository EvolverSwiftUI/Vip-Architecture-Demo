//
//  UserPresenter.swift
//  VipArchitectureDemo
//
//  Created by Sivaramaiah NAKKA on 18/07/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

// interactor to presentor
protocol UserPresentationLogic {
    func showUsers(with response: User.Fetch.Response)
    func showError(_ error: Error)
    func showLoader()
    func hideLoader()
}

class UserPresenter {
    weak var viewController: UserDisplayLogic?
}


extension UserPresenter: UserPresentationLogic {
    func showUsers(with response: User.Fetch.Response) {
        let viewModel = User.Fetch.ViewModel(users: response.users)
        viewController?.reloadTableViewData(with: viewModel)
    }
    
    func showError(_ error: Error) {
        viewController?.showError(error)
    }
    
    func showLoader() {
        viewController?.showLoader()
    }
    
    func hideLoader() {
        viewController?.hideLoader()
    }
}
