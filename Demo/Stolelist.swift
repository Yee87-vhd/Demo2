
import Foundation

struct Stole: Codable {
    let result: WelcomeResult
}

// MARK: - WelcomeResult
struct WelcomeResult: Codable {
    let limit, offset, count: Int
    let sort: String
    let results: [ResultElement]
}

// MARK: - ResultElement
struct ResultElement: Codable {
    let 行政區: String?
    let 里別, 緯度, 局編: String
    let 地點, 經度, 車號, 路線: String
    let 離開時間, 分隊: String
    let id: Int
    let 車次, 抵達時間: String

    enum CodingKeys: String, CodingKey {
        case 行政區 = "\u{feff}行政區"
        case 里別, 緯度, 局編, 地點, 經度, 車號, 路線, 離開時間, 分隊
        case id = "_id"
        case 車次, 抵達時間
    }
}
