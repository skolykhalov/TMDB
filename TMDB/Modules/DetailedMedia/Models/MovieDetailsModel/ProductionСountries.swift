
import Foundation
struct ProductionСountries : Codable {
	let iso_3166_1 : String?
	let name : String?

	enum CodingKeys: String, CodingKey {

		case iso_3166_1 = "iso_3166_1"
		case name = "name"
	}


}
