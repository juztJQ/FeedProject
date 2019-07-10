//
//  ViewController.swift
//  FeedProject
//
//  Created by Juanelo on 7/10/19.
//  Copyright © 2019 Juanelo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tablePost: UITableView!
    var refreshControl   = UIRefreshControl()
    
    var posts : [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "PostTableViewCell", bundle: nil)
        self.tablePost.register(nib, forCellReuseIdentifier: "postcell")
        getData()
        refreshControl.attributedTitle = NSAttributedString(string: "updating..")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.tablePost.addSubview(refreshControl)
        self.tablePost.rowHeight = UITableView.automaticDimension
        self.tablePost.estimatedRowHeight = 600
        // Do any additional setup after loading the view.
    }
    
    @objc func refresh(_ sender: Any) {
        // Call webservice here after reload tableview.
        
        getData()
        tablePost.refreshControl?.endRefreshing()
        refreshControl.endRefreshing()
        
    }
    
    
    func getData(){
         tablePost.refreshControl?.beginRefreshing()
        Connection.sharedInstance.getPost(onSuccess: { (json) in
            let data = json.arrayValue
            
            for item in data{
                let pt = Post(json: item)
                self.posts.append(pt)
            }
            self.tablePost.reloadData()
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    


}

extension ViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tablePost.dequeueReusableCell(withIdentifier: "postcell") as! PostTableViewCell
        if posts.count > 0{
            let pt = posts[indexPath.row]
            cell.titlePost.text = pt.firstName + " " + pt.lastName
            cell.datePost.text = "\(pt.date)"
            cell.descriptionPost.text = pt.postBody
            
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

