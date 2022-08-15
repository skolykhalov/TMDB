
import Foundation
struct SpokenLanguages : Codable {
	let englishName : String?
	let iso_639_1 : String?
	let name : String?

	enum CodingKeys: String, CodingKey {

		case englishName = "english_name"
		case iso_639_1 = "iso_639_1"
		case name = "name"
	}

}
