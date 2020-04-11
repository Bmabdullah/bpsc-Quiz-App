
import Foundation

struct BaseModel : Codable {
	
    let results : ResultModel?
    let settings : Settings?

	enum CodingKeys: String, CodingKey {
        
		case results = "results"
        case settings = "settings"
	}

	init(from decoder: Decoder) throws {
		
        let values = try decoder.container(keyedBy: CodingKeys.self)
		results = try values.decodeIfPresent(ResultModel.self, forKey: .results)
        settings = try values.decodeIfPresent(Settings.self, forKey: .settings)
	}

}
