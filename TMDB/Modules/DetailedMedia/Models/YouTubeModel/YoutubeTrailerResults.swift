

import Foundation

struct YoutubeTrailerResults : Codable {
	let iso_639_1 : String?
	let iso_3166_1 : String?
	let name : String?
	let key : String?
	let site : String?
	let size : Int?
	let type : String?
	let official : Bool?
	let publishedAt : String?
	let id : String?

	enum CodingKeys: String, CodingKey {

		case iso_639_1 = "iso_639_1"
		case iso_3166_1 = "iso_3166_1"
		case name = "name"
		case key = "key"
		case site = "site"
		case size = "size"
		case type = "type"
		case official = "official"
		case publishedAt = "published_at"
		case id = "id"
	}

}
