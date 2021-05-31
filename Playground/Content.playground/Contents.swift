import PlaygroundSupport
import Foundation
import GeoJSON
import PostgresKit

/// [x] load geojson from resource file
/// [ ] connect to postgres
/// [ ] write data to postgres
/// [ ] ask progress about intersections

var rawDocuments = [GeoJSONDocument]()

print("Reading GeoJSON from File in a very inefficient way")

//for value in 1...31 {
for value in 1...2 {
    let resourceName = "raw-file-\(value.description)"
    print(resourceName)
    guard let urlToDocument = Bundle.main.url(forResource: resourceName, withExtension: "geojson", subdirectory: "GeoJSON") else { break }
    
    do {
        let dataOfDocument = try Data(contentsOf: urlToDocument)
        let geoJSONDocument = try JSONDecoder().decode(GeoJSONDocument.self, from: dataOfDocument)

        // uncomment to look into documents contents
//        switch geoJSONDocument {
//        case .feature(let feature):
//            print(feature)
//        case .featureCollection(let featureCollection):
//            print(featureCollection)
//        }

        rawDocuments.append(geoJSONDocument)
        print("Count: \(rawDocuments.count)")
    } catch let error {
        print(error)
    }
}
