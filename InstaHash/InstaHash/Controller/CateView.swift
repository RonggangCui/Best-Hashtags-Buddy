//
//  CateView.swift
//  InstaHash
//
//  Created by Alex Cui on 2021-01-05.
//

import UIKit

class CateView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    
    var tag: TagCateDetail?
    var catIndex = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        
        TableView.delegate = self
        TableView.dataSource = self

    }
    
    
    func showAlertC(){
    
        let alert = UIAlertController(title: "Copied!", message: "Now you can paste all of the hastags and use them on your Instagtam post!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil ))
       
        present(alert,animated: true)
    
    }
    
    func showAlertF(){
    
        let alert = UIAlertController(title: "Favorite Tags Added!", message: "You have successfully added this category into your favorite tags!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil ))
       
        present(alert,animated: true)
    
    }
    
    func showAlertR(){
    
        let alert = UIAlertController(title: "Favorite Tags Deleted!", message: "You have successfully deleted this category from your favorite tags!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil ))
       
        present(alert,animated: true)
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tag?.category.subCate.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubCateCell") as! SubCateCell
        cell.setIndex(i: catIndex, j: indexPath.row)
        cell.setCategory(categ: tag!)
        
        return cell
    }
    
    @objc func refresh() {

        self.TableView.reloadData() // a refresh the tableView.

    }

}
