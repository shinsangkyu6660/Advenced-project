//
//  MainViewModel.swift
//  BookAdvenced
//
//  Created by 신상규 on 8/6/24.
//

import UIKit
import RxSwift

class MainViewModel: UIViewController {
    
    private let apiUrl = "https://dapi.kakao.com/v3/search/book"
    private let apiKey = "KakaoAK 8c5e1831e09cbacdb8f8b6480f8f0ffa"
    private let disposeBag = DisposeBag()
    
    let bookSubject = PublishSubject<[Book]>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func searchBook(query: String) {
        guard var urlComponents = URLComponents(string: apiUrl) else {
            bookSubject.onError(NetworkError.invalidUrl)
            return
        }
        urlComponents.queryItems = [URLQueryItem(name: "query", value: query)]
        
        guard let url = urlComponents.url else {
            bookSubject.onError(NetworkError.invalidUrl)
            return
        }
        
        let headers = ["Authorization": "KakaoAK \(apiKey)"]
        
        NetworkManager.shared.fetch(url: url, headers: headers)
            .subscribe(onSuccess: { [weak self] (bookItems: BookItems) in
                self?.bookSubject.onNext(bookItems.results)
                let thumbnails = bookItems.results.compactMap { $0.thumbnail }
            }, onFailure: { [weak self] error in
                self?.bookSubject.onError(error)
            }).disposed(by: disposeBag)
    }
    
}
