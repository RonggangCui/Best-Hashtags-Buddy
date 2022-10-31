//
//  FavoriteController.swift
//  InstaHash
//
//  Created by Alex Cui on 2021-01-06.
//

import UIKit

class FavoriteController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var RemoveAll: UIButton!
    
    @IBOutlet weak var TableView: UITableView!
    
    
    var tagCate: [TagCateDetail] = []
    var categories: [Category] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.refresh), name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        
        tagCate = createArray()
        
        TableView.delegate = self
        TableView.dataSource = self
        
        RemoveAll.setTitleColor(UIColor(named: "buttonBlue"), for: .normal)
        RemoveAll.backgroundColor = UIColor(named: "buttonGray")
        RemoveAll.layer.cornerRadius = 18
        
    }
    
    @IBAction func removeAll(_ sender: UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "IndexList")
        self.TableView.reloadData()
    }
    
    
    func decodeData(pathName: URL){
        do{
            let jsonData = try Data(contentsOf: pathName)
            let decoder = JSONDecoder()
            categories = try decoder.decode([Category].self, from: jsonData)
        } catch {}
    }
    
    func createArray() -> [TagCateDetail] {
        
        
        let mainUrl = Bundle.main.url(forResource: "category", withExtension: "json")
        
        decodeData(pathName: mainUrl!)
        
        
        var tempCate: [TagCateDetail] = []
        
        let Cate1 = TagCateDetail(image: UIImage(named: "hottags")!, title: "Hot Tags", category: categories[0])
        let Cate2 = TagCateDetail(image: UIImage(named: "animal")!, title: "Animals", category: categories[1])
        let Cate3 = TagCateDetail(image: UIImage(named: "automotives")!, title: "Auto", category: categories[2])
        let Cate4 = TagCateDetail(image: UIImage(named: "events")!, title: "Events", category: categories[3])
        let Cate5 = TagCateDetail(image: UIImage(named: "fitness")!, title: "Fitness", category: categories[4])
        let Cate6 = TagCateDetail(image: UIImage(named: "food")!, title: "Food", category: categories[5])
        let Cate7 = TagCateDetail(image: UIImage(named: "friends")!, title: "Friends", category: categories[6])
        let Cate8 = TagCateDetail(image: UIImage(named: "gaming")!, title: "Gaming", category: categories[7])
        let Cate9 = TagCateDetail(image: UIImage(named: "luxury")!, title: "Luxury", category: categories[8])
        let Cate10 = TagCateDetail(image: UIImage(named: "movies")!, title: "Movies", category: categories[9])
        let Cate11 = TagCateDetail(image: UIImage(named: "music")!, title: "Music", category: categories[10])
        let Cate12 = TagCateDetail(image: UIImage(named: "nature")!, title: "Nature", category: categories[11])
        let Cate13 = TagCateDetail(image: UIImage(named: "photos")!, title: "Photos", category: categories[12])
        let Cate14 = TagCateDetail(image: UIImage(named: "travel")!, title: "Travel", category: categories[13])
        
        tempCate.append(Cate1)
        tempCate.append(Cate2)
        tempCate.append(Cate3)
        tempCate.append(Cate4)
        tempCate.append(Cate5)
        tempCate.append(Cate6)
        tempCate.append(Cate7)
        tempCate.append(Cate8)
        tempCate.append(Cate9)
        tempCate.append(Cate10)
        tempCate.append(Cate11)
        tempCate.append(Cate12)
        tempCate.append(Cate13)
        tempCate.append(Cate14)
        
        return tempCate
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if UserDefaults.standard.array(forKey: "IndexList") == nil {
            return 0
        } else {
            return (UserDefaults.standard.array(forKey: "IndexList")?.count)!
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell") as! FavoriteCell
        let row = indexPath.row
        
        let indexL = UserDefaults.standard.array(forKey: "IndexList")! as! [[Int]]
        let index = indexL[row]
        let i = index[0]
        let j = index[1]
        let tag = tagCate[i]
        
        cell.setIndex(i: i, j: j)
        cell.setCategory(categ: tag)
        
        return cell
        
    
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
    
    @objc func refresh() {

        self.TableView.reloadData() // a refresh the tableView.

    }

}
