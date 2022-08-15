
import Foundation
struct Last_episode_to_air : Codable {
	let air_date : String?
	let episode_number : Int?
	let id : Int?
	let name : String?
	let overview : String?
	let production_code : String?
	let runtime : Int?
	let season_number : Int?
	let show_id : Int?
	let still_path : String?
	let vote_average : Double?
	let vote_count : Int?

	enum CodingKeys: String, CodingKey {

		case air_date = "air_date"
		case episode_number = "episode_number"
		case id = "id"
		case name = "name"
		case overview = "overview"
		case production_code = "production_code"
		case runtime = "runtime"
		case season_number = "season_number"
		case show_id = "show_id"
		case still_path = "still_path"
		case vote_average = "vote_average"
		case vote_count = "vote_count"
	}

}
