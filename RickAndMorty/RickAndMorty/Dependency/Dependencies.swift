//
//  Dependencies.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import Foundation

protocol IDependencies {
    var moduleContainer: IModuleContainer { get }
//    var userDefaultsRepository: IUserDefaultsRepository { get }
//    var networkService: IHTTPClient { get }
//    var analyticsReporterService: IAnalyticsReporterService { get }
}


final class Dependencies: IDependencies {
    lazy var moduleContainer: IModuleContainer = ModuleContainer(self)
//    lazy var userDefaultsRepository: IUserDefaultsRepository = UserDefaultsRepository(container: UserDefaults.standard)
//    lazy var networkService: IHTTPClient = HTTPClient()
//    lazy var analyticsReporterService: IAnalyticsReporterService = AnalyticsReporterService()
}
