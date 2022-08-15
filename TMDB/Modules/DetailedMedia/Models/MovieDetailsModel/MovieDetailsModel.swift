
import Foundation

struct MovieDetailsModel : Codable {

	let adult : Bool?
	let backdropPath : String?
    let runtime : Int?
	let episodeRunTime : [Int]?
    let releaseDate : String?
    let title : String?
	let firstAirDate : String?
	let genres : [Genres]?
	let homepage : String?
	let id : Int?
	let inProduction : Bool?
	let languages : [String]?
	let lastAirDate : String?
	let lastEpisodeToAir : Last_episode_to_air?
	let name : String?
	let networks : [Networks]?
	let numberOfEpisodes : Int?
	let numberOfSeasons : Int?
	let originCountry : [String]?
	let originalLanguage : String?
	let originalName : String?
	let overview : String?
	let popularity : Double?
	let posterPath : String?
	let productionCompanies : [ProductionСompanies]?
	let productionCountries : [ProductionСountries]?
	let seasons : [Seasons]?
	let spokenLanguages : [SpokenLanguages]?
	let status : String?
	let tagline : String?
	let type : String?
	let voteAverage : Double?
	let voteCount : Int?

	enum CodingKeys: String, CodingKey {

		case adult = "adult"
		case backdropPath = "backdrop_path"
        case runtime = "runtime"
		case episodeRunTime = "episode_run_time"
        case releaseDate = "release_date"
		case firstAirDate = "first_air_date"
		case genres = "genres"
		case homepage = "homepage"
		case id = "id"
		case inProduction = "in_production"
		case languages = "languages"
		case lastAirDate = "last_air_date"
		case lastEpisodeToAir = "last_episode_to_air"
        case title = "title"
		case name = "name"
		case networks = "networks"
		case numberOfEpisodes = "number_of_episodes"
		case numberOfSeasons = "number_of_seasons"
		case originCountry = "origin_country"
		case originalLanguage = "original_language"
		case originalName = "original_name"
		case overview = "overview"
		case popularity = "popularity"
		case posterPath = "poster_path"
		case productionCompanies = "production_companies"
		case productionCountries = "production_countries"
		case seasons = "seasons"
		case spokenLanguages = "spoken_languages"
		case status = "status"
		case tagline = "tagline"
		case type = "type"
		case voteAverage = "vote_average"
		case voteCount = "vote_count"
	}

    
    //MARK: - ParametrsLogic
    
    func configureMediaTitle() -> String {
        guard let mediaTitle = (title ?? "").count > 0 ? title : name else { return Constants.DefaultValues.defaultString }
        return mediaTitle
    }
    
    func configureMediaRate() -> String {
        var rating : String {
            return String(format: "%.1f", voteAverage ?? 0)
        }
        return rating
    }
    
    func configureMediaData() -> String {
        
        guard let movieDate = (releaseDate ?? "").count > 0 ? releaseDate : firstAirDate else { return Constants.DefaultValues.defaultString}
        let mediaData = String(movieDate).prefix(4)

        return String(mediaData)
    }
    
    func configureMediaRuntime() -> String {
        
        var mediaRuntime = ""
        
        if let movieRuntime = runtime {
            mediaRuntime = "\(movieRuntime) min"
        }
        
        if let tvRuntime = episodeRunTime {
            mediaRuntime = "\(tvRuntime.first ?? lastEpisodeToAir?.runtime ?? 0) min"
        }
        return mediaRuntime
    }
    
    func configureMediaGenre() -> [String] {
        
        var genreNames: [String] = []
        
        if let genreName = genres {
            for genreId in genreName {
                genreNames.append(genreId.name ?? "no genre")
            }
        }
        
       return genreNames
    }
    
    func configureMediaCountry() -> [String] {
        
        var mediaCountry: [String] = []
        
        if let countryNames = productionCountries {
            for country in countryNames {
                mediaCountry.append(country.name ?? Constants.DefaultValues.defaultString)
            }
        }
        return mediaCountry
    }
    
    func configureMediaCompanies() -> [String] {
        
        var mediaCompanies: [String] = []
        
        if let companies = productionCompanies {
            for company in companies {
                mediaCompanies.append(company.name ?? Constants.DefaultValues.defaultString)
            }
        }
        return mediaCompanies
    }
    
    func configureMediaLanguages() -> [String] {
        
        var mediaLanguages: [String] = []
        
        if let languages = spokenLanguages {
            for language in languages {
                mediaLanguages.append(language.englishName ?? Constants.DefaultValues.defaultString)
            }
        }
        return mediaLanguages
    }
}
