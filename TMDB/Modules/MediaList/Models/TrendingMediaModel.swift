
import Foundation

struct TrendingMediaModel : Codable {
	let page : Int?
	let results : [TrendingMediaResults]?
	let totalPages : Int?
	let totalResults : Int?

	enum CodingKeys: String, CodingKey {

		case page = "page"
		case results = "results"
		case totalPages = "total_pages"
		case totalResults = "total_results"
	}



}
