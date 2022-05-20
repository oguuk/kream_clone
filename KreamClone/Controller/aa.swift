//
//  HomeController.swift
//  KreamClone
//
//  Created by 오국원 on 2022/05/16.
//

import UIKit

private let collectionCellIdentifire = "cell"

class HomeController: UIViewController {
    //MARK: - Properties
    private let scrollview:UIScrollView = {
       let view = UIScrollView()
        view.backgroundColor = .red
        view.contentSize = CGSize(width: view.frame.width, height: 2000)
        return view
    }()
    
    private let bannerView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        
        layout.scrollDirection = .horizontal
        layout.sectionInset = .zero
       
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        
        return cv
    }()
    
    private let button:UIButton = {
        let button = UIButton()
        button.setTitle("Hello", for: .normal)
       return button
    }()
    
    let items = ["1","2","3","4"]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - Helpers
    func configure() {
        bannerView.register(CollectionCell.self, forCellWithReuseIdentifier: collectionCellIdentifire)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell")?.withTintColor(.black), style: .plain, target: self, action: nil)
        
        view.addSubview(scrollview)
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        scrollview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollview.addSubview(bannerView)
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bannerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bannerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        bannerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 200).isActive = true

        
                
    }

}

extension HomeController:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifire, for: indexPath) as! CollectionCell
        cell.item = items[indexPath.row]
        return cell
    }
    
    
}
