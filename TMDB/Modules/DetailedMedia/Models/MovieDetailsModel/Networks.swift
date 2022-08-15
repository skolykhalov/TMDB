
import Foundation
struct Networks : Codable {
	let id : Int?
	let name : String?
	let logo_path : String?
	let origin_country : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case logo_path = "logo_path"
		case origin_country = "origin_country"
	}

}
