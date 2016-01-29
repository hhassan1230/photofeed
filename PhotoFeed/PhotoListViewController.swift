//
//  PhotoListViewController.swift
//  PhotoFeed
//
//  Created by Hessvacio Hassan on 1/28/16.
//  Copyright © 2016 Hessvacio Hassan. All rights reserved.
//

import UIKit
import Alamofire

class PhotoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var instagramName: String?
    var photoFeed = Array<AnyObject>()
    
    @IBOutlet var photoTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(self.instagramName!)")
        
        let url = "https://www.instagram.com/juicecrawl/media/"
        
        Alamofire.request(.GET, url, parameters:nil).responseJSON { response in
            if let JSON = response.result.value as? Dictionary<String, AnyObject> {
                
                
                let items = JSON["items"] as! Array<Dictionary<String, AnyObject>>
                print("\(items)")
                
                for (var i = 0; i < items.count; i++) {
                    let photoInfo = items[i]
                    self.photoFeed.append(photoInfo)
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.photoTable.reloadData()
                })
                
            }
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.photoFeed.count
    }
    
    // replacing the memory in recycle bin
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cellId = "cellId"
        
        let post = self.photoFeed[indexPath.row]
        let captionInfo = post["caption"] as! Dictionary<String, AnyObject>
        
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
//            cell.textLabel?.text = "\(indexPath.row)"
            cell.textLabel?.text = captionInfo["text"] as? String
            return cell
        }
        
        print("NEW CELL: \(indexPath.row)")
        let cell = UITableViewCell(style: .Default, reuseIdentifier: cellId)
//        cell.textLabel?.text = "\(indexPath.row)"
        cell.textLabel?.text = captionInfo["text"] as? String
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
