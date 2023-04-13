//
//  ApiService.swift
//  Lesson_One
//
//  Created by Oluwayomi M on 2023-03-31.
//

import Foundation

class APIService: ObservableObject {
    @Published var countries = [CountryData]()
    @Published var canLoadMore = true

    private var currentOffset = 0
    private let limit = 10

    func fetchCountries(offset: Int = 0) {
        guard canLoadMore else { return }
        
        let headers = [
            "X-RapidAPI-Key": "f09f16f79bmshfb2a583021b3373p1842f6jsn9388e95c8ba8",
            "X-RapidAPI-Host": "wft-geo-db.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://wft-geo-db.p.rapidapi.com/v1/geo/countries?offset=\(offset)&limit=\(limit)")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            }

            if let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                do {
                    let decodedData = try JSONDecoder().decode(CountryResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.countries.append(contentsOf: decodedData.data)
                        self.canLoadMore = !decodedData.data.isEmpty
                        self.currentOffset = offset + self.limit
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        })

        dataTask.resume()
    }
}
