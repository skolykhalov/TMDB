

import Foundation

struct YoutubeTrailerModel : Codable {
	let id : Int?
	let results : [YoutubeTrailerResults]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case results = "results"
	}

}
