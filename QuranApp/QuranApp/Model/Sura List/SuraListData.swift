

import Foundation
struct SuraListData : Codable {
	let number : Int?
	let name : String?
	let englishName : String?
	let englishNameTranslation : String?
	let numberOfAyahs : Int?
	let revelationType : String?

	enum CodingKeys: String, CodingKey {

		case number = "number"
		case name = "name"
		case englishName = "englishName"
		case englishNameTranslation = "englishNameTranslation"
		case numberOfAyahs = "numberOfAyahs"
		case revelationType = "revelationType"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		number = try values.decodeIfPresent(Int.self, forKey: .number)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		englishName = try values.decodeIfPresent(String.self, forKey: .englishName)
		englishNameTranslation = try values.decodeIfPresent(String.self, forKey: .englishNameTranslation)
		numberOfAyahs = try values.decodeIfPresent(Int.self, forKey: .numberOfAyahs)
		revelationType = try values.decodeIfPresent(String.self, forKey: .revelationType)
	}

}
