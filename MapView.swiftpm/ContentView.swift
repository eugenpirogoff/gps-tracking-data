import SwiftUI
import MapKit
import CoreGPX

struct ContentView: View {
    let trackLoader = DataLoader()

    var body: some View {
        VStack {
            Image(systemName: "map")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("MapView")
        }.onAppear(perform: onAppear)
    }

    func onAppear() {
        trackLoader.status()
    }
}

struct DataLoader {

    var filenames: [String] = []
    var parsedData: [GPXRoot]? = nil
    var selectedData: GPXRoot? = nil

    init() {
        print("DataLoader ... is loading")

        // generate filenames
        for i in 1...31 {
            filenames.append("raw-file-\(i)")
        }

        // create urls for filenames
        let fileURLS = filenames.compactMap { name in
            Bundle.main.url(forResource: name, withExtension: "gpx")
        }

        // parse urls to data
        parsedData = fileURLS.compactMap { url in
            if let parser = GPXParser(withURL: url) {
                return parser.parsedData()
            } else {
                return nil
            }
        }

        if let parsedData = parsedData {
            selectedData = parsedData[safe: 0]
        }
    }

    func status() {
        print("Filenames : \(filenames.count)")
//
//        for filename in filenames {
//            print("Name: \(filename)")
//        }

        print("Parsed Data : \(parsedData?.count ?? 0 )")

//        if let parsedData = parsedData {
//            for data in parsedData {
//                print(data.debugDescription)
//            }
//        }
    }

}

