//
//  CovidRepository.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 09.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

// будет ли внешний код решать откуда загрузить данные?

//protocol CovidInfoDataSource {
//    func fetch(completion: @escaping (Covid?, Error?) -> Void)
//}
//protocol CovidInfoStorage: CovidInfoDataSource {}
//protocol CovidInfoNetworkManager: CovidInfoDataSource {}
//class CovidRepository: CovidInfoDataSource {
//    let storage: CovidInfoDataSource
//    let manager: CovidInfoDataSource
//
//    func fetch(completion: @escaping (Covid?, Error?) -> Void) {
//        if internet {
//            manager.fetch(completion: completion)
//        } else {
//            storage.fetch(completion: completion)
//        }
//    }
//}

protocol LoadCovidInfo {
    func loadCovidFromNetwork(completion: @escaping (Covid?, Error?) -> Void)
    func loadCovidFromDB() -> Covid?
}

// зачем нужен?
class CovidRepository: LoadCovidInfo {
    
    private let networkManager: NetworkManagerCovid!
    private var result: Covid?
    // database
    
    init(networkManager: NetworkManagerCovid) {
        self.networkManager = networkManager
    }

    // вроде одинаковый интерфейс с NetworkManagerCovid
    // protocol LoadCovidInfo {}
    func loadCovidFromNetwork(completion: @escaping (Covid?, Error?) -> Void) {
        networkManager.getCovidStatus() { [weak self] result in
            switch result {
            case .success(let covid):
                completion(covid, nil)
                self?.save(result: covid)
            case.failure(let error):
                completion(nil, error)
            }
        }
    }

    private func save(result: Covid) {
        self.result = result
    }
    
    func loadCovidFromDB() -> Covid? {
        result
    }
}

// Кто должен хранить кэш?


// Уровень модуля

// Обработать действия пользователя
// Разные экраны
// Отсутствие интернета
// Обработка ошибок
// Анимации
// Передача данных между модулями (вернуть результат)
// Декомпозиция одного модуля на подмодули
// Маппинг из доменной модели во вью модель
// Бизнес логика (валидация)

// -DI (singleton) -factory


// Уровень приложения

// Навигация
// DI, список зависимостей
// Общий стейт
// Кэширование, БД
