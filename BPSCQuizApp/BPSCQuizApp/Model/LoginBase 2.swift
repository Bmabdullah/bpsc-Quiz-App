

import Foundation
struct LoginBase : Codable {
	let successResonse : SuccessResonse?
	let failedResponse : String?

	enum CodingKeys: String, CodingKey {

		case successResonse = "successResonse"
		case failedResponse = "failedResponse"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		successResonse = try values.decodeIfPresent(SuccessResonse.self, forKey: .successResonse)
		failedResponse = try values.decodeIfPresent(String.self, forKey: .failedResponse)
	}

}
