//
//  FavoriteCell.swift
//  InstaHash
//
//  Created by Alex Cui on 2021-01-06.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var TagsText: UITextView!
    @IBOutlet weak var CopyButton: UIButton!
    @IBOutlet weak var FavoriteButton: UIButton!
    
    var catIndex = 0
    var subCatIndex = 0
    
    
    func setIndex(i: Int, j: Int) {
        catIndex = i
        subCatIndex = j
    }
   
    func setCategory(categ: TagCateDetail) {
        TitleLabel.text = categ.category.subCate[subCatIndex]
        TagsText.text = categ.category.subCateTags[subCatIndex].joined(separator: " ")
        CopyButton.layer.cornerRadius = 15
        CopyButton.clipsToBounds = true
        FavoriteButton.layer.cornerRadius = 15
        FavoriteButton.clipsToBounds = true
        copyBV()
        favoriteBV()
        
    }
    
    @IBAction func CopyAction(_ sender: UIButton) {
        if let myViewController = parentViewController as? FavoriteController {
            myViewController.showAlertC()
        }
        
        let pasteboard = UIPasteboard.general
        pasteboard.string = TagsText.text
    }
   

    
    @IBAction func FavoriteAction(_ sender: UIButton) {
        
        
        var indexL: [[Int]] = []
        let selfIndex = [catIndex, subCatIndex]
        
        if UserDefaults.standard.array(forKey: "IndexList") == nil {
            addFavorite()
        }
        else {
            indexL = UserDefaults.standard.array(forKey: "IndexList")! as! [[Int]]
            
            if indexL.contains(selfIndex){
                removeFavorite()
            } else {
                addFavorite()
            }
        }
        
    }
    
    func addFavorite() {
        
        if let myViewController = parentViewController as? FavoriteController {
            myViewController.showAlertF()
        }
        
        favoriteBV()
        
        // Favorite index list
        var indexL: [[Int]] = []
        
        // Current Favorite Index
        let selfIndex = [catIndex, subCatIndex]
       
        
        if UserDefaults.standard.array(forKey: "IndexList") == nil {
            indexL.append(selfIndex)
            UserDefaults.standard.set(indexL, forKey: "IndexList")
        }
        else {
            
            indexL = UserDefaults.standard.array(forKey: "IndexList")! as! [[Int]]
            UserDefaults.standard.removeObject(forKey: "IndexList")
            if  !indexL.contains(selfIndex) {
                indexL.append(selfIndex)
            }
            UserDefaults.standard.set(indexL, forKey: "IndexList")
        
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
    }

    func removeFavorite() {
        
        if let myViewController = parentViewController as? FavoriteController {
            myViewController.showAlertR()
        }
        
        favoriteBV()
        
        // Favorite index list
        var indexL: [[Int]] = []
        
        // Current Favorite Index
        let selfIndex = [catIndex, subCatIndex]
       
        indexL = UserDefaults.standard.array(forKey: "IndexList")! as! [[Int]]
        UserDefaults.standard.removeObject(forKey: "IndexList")
        
        if let index = indexL.firstIndex(of: selfIndex) {
            indexL.remove(at: index)
        }
        
        UserDefaults.standard.set(indexL, forKey: "IndexList")
        
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
    }
    
    func favoriteBV() {
        
        var indexL: [[Int]] = []
        let selfIndex = [catIndex, subCatIndex]
        
        if UserDefaults.standard.array(forKey: "IndexList") == nil {
            FavoriteButton.setTitleColor(UIColor(named: "buttonBlue"), for: .normal)
            FavoriteButton.backgroundColor = UIColor(named: "buttonGray")
            FavoriteButton.setTitle("Favorite", for: .normal)
        }
        else {
            
            indexL = UserDefaults.standard.array(forKey: "IndexList")! as! [[Int]]
            
            if indexL.contains(selfIndex){
                FavoriteButton.setTitleColor(UIColor.white, for: .normal)
                FavoriteButton.backgroundColor = UIColor.gray
                FavoriteButton.setTitle("Remove", for: .normal)
            } else {
                FavoriteButton.setTitleColor(UIColor(named: "buttonBlue"), for: .normal)
                FavoriteButton.backgroundColor = UIColor(named: "buttonGray")
                FavoriteButton.setTitle("Favorite", for: .normal)
            }
        }
        
    }
    
    func copyBV() {
        
        CopyButton.setTitleColor(UIColor(named: "buttonBlue"), for: .normal)
        CopyButton.backgroundColor = UIColor(named: "buttonGray")
        CopyButton.setTitle("Copy", for: .normal)
        
    }
}
