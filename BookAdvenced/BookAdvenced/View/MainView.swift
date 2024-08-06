
import UIKit
import SnapKit

class MainView: UIViewController, UISearchBarDelegate {
    
    let bookItems = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchBar)
    }
    
    private let searchBar: UISearchBar = {
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: width - 28, height: 0))
        searchBar.placeholder = "원하시는책을 입력해주세요"
        return searchBar
    }()
    
    private lazy var recentlyCollectionView: UICollectionView = {
        let recentlyCollectionView = UICollectionView()
        return recentlyCollectionView
    }()
    
    private func searchBook() {
        self.view.endEditing(true)
    }
    
  
    
}

extension MainView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bookItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookPosterCell.id, for: indexPath) as? BookPosterCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension MainView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: collectionView.frame.height)
    }
}
