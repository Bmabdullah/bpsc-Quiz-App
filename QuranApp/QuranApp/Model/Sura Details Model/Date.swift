
import Foundation
struct Date : Codable {
	let readable : String?
	let timestamp : String?
	let hijri : Hijri?
	let gregorian : Gregorian?

	enum CodingKeys: String, CodingKey {

		case readable = "readable"
		case timestamp = "timestamp"
		case hijri = "hijri"
		case gregorian = "gregorian"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		readable = try values.decodeIfPresent(String.self, forKey: .readable)
		timestamp = try values.decodeIfPresent(String.self, forKey: .timestamp)
		hijri = try values.decodeIfPresent(Hijri.self, forKey: .hijri)
		gregorian = try values.decodeIfPresent(Gregorian.self, forKey: .gregorian)
	}

}
