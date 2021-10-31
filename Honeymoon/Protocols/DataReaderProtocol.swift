//
//  Honeymoon
//
//  Created by  Cristiano on 20/10/21.
//

import Foundation


class DataReader: ObservableObject {
    @Published var savedPreferences: [String: [String : Bool]] = [:]
    
    func prepare() {
        assertionFailure("Missing override: Please override this method in the subclass")
    }
}

