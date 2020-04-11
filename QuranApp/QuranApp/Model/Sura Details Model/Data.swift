
import Foundation
struct Data : Codable {
	let number : Int?
	let name : String?
	let englishName : String?
	let englishNameTranslation : String?
	let revelationType : String?
	let numberOfAyahs : Int?
	let ayahs : [Ayahs]?
	//let edition : Edition?

	enum CodingKeys: String, CodingKey {

		case number = "number"
		case name = "name"
		case englishName = "englishName"
		case englishNameTranslation = "englishNameTranslation"
		case revelationType = "revelationType"
		case numberOfAyahs = "numberOfAyahs"
		case ayahs = "ayahs"
		//case edition = "edition"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		number = try values.decodeIfPresent(Int.self, forKey: .number)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		englishName = try values.decodeIfPresent(String.self, forKey: .englishName)
		englishNameTranslation = try values.decodeIfPresent(String.self, forKey: .englishNameTranslation)
		revelationType = try values.decodeIfPresent(String.self, forKey: .revelationType)
		numberOfAyahs = try values.decodeIfPresent(Int.self, forKey: .numberOfAyahs)
		ayahs = try values.decodeIfPresent([Ayahs].self, forKey: .ayahs)
		//edition = try values.decodeIfPresent(Edition.self, forKey: .edition)
	}

}
