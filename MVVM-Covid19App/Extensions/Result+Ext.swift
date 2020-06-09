//
//  Result+Ext.swift
//  MVVM-Covid19App
//
//  Created by Iury Popov on 09.06.2020.
//  Copyright © 2020 Iurii Popov. All rights reserved.
//

extension Result {
    var value: Success? {
        switch self  {
        case .success(let success):
            return success
        case .failure:
            return nil
        }
    }
}
