
import Foundation

struct Settings : Codable {
	
	let location : Location?
	let latitude : String?
	let longitude : String?
	let timezone : String?
	let method : Int?
	let juristic : Int?
	let high_latitude : Int?
	let time_format : Int?

	enum CodingKeys: String, CodingKey {

		case location = "location"
		case latitude = "latitude"
		case longitude = "longitude"
		case timezone = "timezone"
		case method = "method"
		case juristic = "juristic"
		case high_latitude = "high_latitude"
		case time_format = "time_format"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)

		location = try values.decodeIfPresent(Location.self, forKey: .location)
		latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
		longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
		timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
		method = try values.decodeIfPresent(Int.self, forKey: .method)
		juristic = try values.decodeIfPresent(Int.self, forKey: .juristic)
		high_latitude = try values.decodeIfPresent(Int.self, forKey: .high_latitude)
		time_format = try values.decodeIfPresent(Int.self, forKey: .time_format)
	}
}
