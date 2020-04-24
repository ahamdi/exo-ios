// Copyright (C) 2003-2015 eXo Platform SAS.
//
// This is free software; you can redistribute it and/or modify it
// under the terms of the GNU Lesser General Public License as
// published by the Free Software Foundation; either version 3 of
// the License, or (at your option) any later version.
//
// This software is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
// Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public
// License along with this software; if not, write to the Free
// Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
// 02110-1301 USA, or see the FSF site: http://www.fsf.org.

import UIKit

class AppEnv: NSObject {

    // MARK: Properties

    // MARK: Shared Instance
    static let sharedInstance: AppEnv = AppEnv()

    // MARK: Inits
    override private init() {

        // Super init
        super.init()
    }

    static func loadFromPlist(key: String, plist: NSDictionary) -> String {
        guard let string = plist.object(forKey: key) as? String else {fatalError("Missing key \(key)")}
        return string
    }

    func baseServerURL() -> String {
        guard let baseURL = Bundle.main.object(forInfoDictionaryKey:"APP_BASE_URL") as? String else {
            fatalError("The environnement variable is not defined, please update plist for key APP_BASE_URL")
        }
        return baseURL
    }

    static func logInfo() {
        debugPrint("==============================")
        debugPrint("Environment INFOS")
        debugPrint("baseUrl = \(sharedInstance.baseServerURL())")
        debugPrint("==============================")
    }
}
