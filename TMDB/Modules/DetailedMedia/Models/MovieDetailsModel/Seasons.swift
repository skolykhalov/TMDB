
import Foundation
struct Seasons : Codable {
	let air_date : String?
	let episode_count : Int?
	let id : Int?
	let name : String?
	let overview : String?
	let poster_path : String?
	let season_number : Int?

	enum CodingKeys: String, CodingKey {

		case air_date = "air_date"
		case episode_count = "episode_count"
		case id = "id"
		case name = "name"
		case overview = "overview"
		case poster_path = "poster_path"
		case season_number = "season_number"
	}

}
