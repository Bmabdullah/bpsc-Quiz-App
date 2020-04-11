

import Foundation
struct Ayahs : Codable {
	let number : Int?
	let text : String?
	let numberInSurah : Int?
	let juz : Int?
	let manzil : Int?
	let page : Int?
	let ruku : Int?
	let hizbQuarter : Int?
	let sajda : Bool?

	enum CodingKeys: String, CodingKey {

		case number = "number"
		case text = "text"
		case numberInSurah = "numberInSurah"
		case juz = "juz"
		case manzil = "manzil"
		case page = "page"
		case ruku = "ruku"
		case hizbQuarter = "hizbQuarter"
		case sajda = "sajda"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		number = try values.decodeIfPresent(Int.self, forKey: .number)
		text = try values.decodeIfPresent(String.self, forKey: .text)
		numberInSurah = try values.decodeIfPresent(Int.self, forKey: .numberInSurah)
		juz = try values.decodeIfPresent(Int.self, forKey: .juz)
		manzil = try values.decodeIfPresent(Int.self, forKey: .manzil)
		page = try values.decodeIfPresent(Int.self, forKey: .page)
		ruku = try values.decodeIfPresent(Int.self, forKey: .ruku)
		hizbQuarter = try values.decodeIfPresent(Int.self, forKey: .hizbQuarter)
		sajda = try values.decodeIfPresent(Bool.self, forKey: .sajda)
	}

}
