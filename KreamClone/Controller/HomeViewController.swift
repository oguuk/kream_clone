//
//  HomeViewController.swift
//  KreamClone
//
//  Created by 오국원 on 2022/05/20.
//

import UIKit

enum Section: Int {
    case Banner = 0
    case Hashtage = 1
    case JustDropped = 2
    case JustDroppedPhoto = 3
}

private let collectionViewTableViewCellIdentifier = "CollectionViewTableViewCell"

class HomeViewController: UIViewController {
    
    //MARK: -Properties
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: collectionViewTableViewCellIdentifier)
        return table
    }()
    
    let sectionTitles:[String] = ["","","Just Dropped\n발매 상품","","Most Popular\n인기 상품","Style Picks!","Brand Focus\n모두가 좋아하는 브랜드","","New In\n신규 등록 상품","","Matching Twilly & Bag\n센스있는 매치로 기분 전환","","Bottega Veneta Collection\n올해도 계속되는 인기!","","Logo On My Mind\n로고 포인트로 여름 코디 준비","","Rolex New Arrivals\n신규 등록 롤렉스 둘러보기","오늘의 인기유저","","New Lowest Asks\n새로운 즉시 구매가","New Highest Bids\n새로운 즉시 판매가","","Upcoming Release\n발매 예정","","","New In : Perfume\n향으로 완성하는 데일리 무드"]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIconfigure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    //MARK: -Helpers
    
    func UIconfigure() {
        view.backgroundColor = .systemBackground

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell")?.withTintColor(.black,renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(alarmButtonClick))

        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        let headerView = HomeHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
    }
    
    //MARK: -Selectors
    @objc
    func alarmButtonClick() {
        
    }

}


extension HomeViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: collectionViewTableViewCellIdentifier, for: indexPath) as? CollectionViewTableViewCell else {return UITableViewCell()}
        
        switch indexPath.section {
        case Section.Banner.rawValue:
            cell.configure(with: banner)
        case Section.Hashtage.rawValue:
            cell.configure(with: hashtag)
        case Section.JustDropped.rawValue:
            cell.configure(with: banner)
        case Section.JustDroppedPhoto.rawValue:
            cell.configure(with: banner)
        default:
            cell.configure(with: banner)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18,weight: .semibold)
        header.textLabel?.frame = CGRect(x: 0, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .black
        header.textLabel?.text = header.textLabel?.text?.uppercased()
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
