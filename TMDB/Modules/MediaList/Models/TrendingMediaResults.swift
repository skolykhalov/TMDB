
import Foundation

struct TrendingMediaResults : Codable {
    let adult : Bool?
    let backdropPath : String?
    let genreIds : [Int]?
    let id : Int?
    let mediaType : String?
    let title : String?
    let name: String?
    let originalLanguage : String?
    let originalTitle : String?
    let overview : String?
    let popularity : Double?
    let posterPath : String?
    let releaseDate : String?
    let firstAirDate : String?
    let video : Bool?
    let voteAverage : Double?
    let voteCount : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id = "id"
        case mediaType = "media_type"
        case title = "title"
        case name = "name"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case firstAirDate = "first_air_date"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    func configureMediaTitle() -> String {
        guard let mediaTitle = (title ?? "").count > 0 ? title : name else { return Constants.DefaultValues.defaultString }
        return mediaTitle
    }
    
    func configureMediaData() -> String {
        
        guard let movieDate = (releaseDate ?? "").count > 0 ? releaseDate : firstAirDate else { return Constants.DefaultValues.defaultString}
        let mediaData = String(movieDate).prefix(4)

        return String(mediaData)
    }
    
    func configureMediaRate() -> String {
        var rating : String {
            return String(format: "%.1f", voteAverage ?? 0)
        }
        return rating
    }
    
}
