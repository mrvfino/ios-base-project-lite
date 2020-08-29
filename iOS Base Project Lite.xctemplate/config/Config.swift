//  ___FILEHEADER___

import Foundation

struct Config: Decodable {

    static let shared: Config = {
        let infoPlist = Bundle.main.infoDictionary!
        let jsonData = try! JSONSerialization.data(withJSONObject: infoPlist, options: .prettyPrinted)
        return try! JSONDecoder().decode(Config.self, from: jsonData)
    }()

    var baseURL: URL
    var namespace: String
    
    enum CodingKeys: String, CodingKey {
        case baseURL = "API_BASE_URL"
        case namespace = "APP_NAMESPACE"
    }

}

extension Config {

    func showInfo() {
        let linesToPrint = [
            "APPINFO:",
            "Base URL: \(baseURL.absoluteString)",
            "Namespace: \(namespace)"
        ]
        let longestLineLength = (linesToPrint.map { return $0.count }).max() ?? 0

        let topBorder = String(repeating: "*", count: longestLineLength + 4)
        let bottomBorder = topBorder
        print(topBorder)
        linesToPrint.forEach { printWithPadding($0, longestLineCount: longestLineLength) }
        print(bottomBorder)
    }

    private func printWithPadding(_ line: String, longestLineCount: Int) {
        print("* \(line)\(String(repeating: " ", count: longestLineCount - line.count)) *")
    }

}
