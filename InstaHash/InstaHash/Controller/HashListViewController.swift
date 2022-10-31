//
//  HashListViewController.swift
//  InstaHash
//
//  Created by Alex Cui on 2021-01-02.
//

import UIKit

class HashListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var TableView: UITableView!
    
    var tagCate: [TagCateDetail] = []
    var categories: [Category] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        tagCate = createArray()
        
        TableView.delegate = self
        TableView.dataSource = self
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
        return tagCate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cate = tagCate[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HashTagCell") as! HashTagCell
        cell.setCate(cate: cate)
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "GoToCate", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? CateView {
            destination.tag = tagCate[(TableView.indexPathForSelectedRow?.row)!]
            destination.catIndex = (TableView.indexPathForSelectedRow?.row)!
            
        }
    
    }
    
    
}
