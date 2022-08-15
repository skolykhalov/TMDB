

import Foundation

struct Genres : Codable {
	let id : Int?
	let name : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
	}

}
