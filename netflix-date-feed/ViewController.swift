//
//  ViewController.swift
//  netflix-date-feed
//
//  Created by B0279485 on 17/04/23.
//

import UIKit

class DateHeader: UITableViewHeaderFooterView {
    
    lazy var dateLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    //MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = .clear
        
        self.addSubview(dateLbl)
        dateLbl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4).isActive = true
        dateLbl.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class FeedCell: UITableViewCell {
    
    //MARK: - Views
    lazy var imgView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        self.addSubview(imgView)
        imgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32).isActive = true
        imgView.topAnchor.constraint(equalTo: self.topAnchor, constant: -24).isActive = true
        imgView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        imgView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Variables & Datasource
    var data: [[String: UIImage]] = [
        ["18": UIImage(named: "landscape-1")!],
        ["19": UIImage(named: "landscape-2")!],
        ["20": UIImage(named: "landscape-3")!],
        ["21": UIImage(named: "landscape-1")!],
        ["22": UIImage(named: "landscape-2")!],
        ["23": UIImage(named: "landscape-3")!],
        ["24": UIImage(named: "landscape-1")!],
        ["25": UIImage(named: "landscape-2")!],
        ["26": UIImage(named: "landscape-3")!]
    ]
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(FeedCell.self, forCellReuseIdentifier: "FeedCell")
        tableView.register(DateHeader.self, forHeaderFooterViewReuseIdentifier: "DateHeader")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DateHeader") as! DateHeader
        header.dateLbl.text = data[section].keys.first ?? ""
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as! FeedCell
        cell.imgView.image = data[indexPath.section].values.first
        return cell
    }
}
