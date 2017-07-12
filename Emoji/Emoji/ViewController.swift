//
//  ViewController.swift
//  Emoji
//
//  Created by Victor Rykov on 7/7/17.
//  Copyright © 2017 Victor Rykov. All rights reserved.
//

import UIKit

class Emoji
{
    var view : String!
    var description : String!
    
    init(_ view : String, _ desc : String)
    {
        self.view = view
        self.description = desc
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var emojis = [Emoji]()
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.emojis.count
    }
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.textLabel?.text = self.emojis[indexPath.row].view
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.table.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "detailsSegue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let row = sender as? Int, let detailsView = segue.destination as? DetailsViewController
        {
            detailsView.curEmoji = emojis[row]
        }
    }
    
    @IBOutlet weak var table: UITableView!
    
    @IBAction func onTouch(_ sender: Any) {
        self.performSegue(withIdentifier: "detailsSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.table.delegate = self
        self.table.dataSource = self
        self.emojis.append(Emoji("😃","Grinning face"))
        self.emojis.append(Emoji("😇","Halo face"))
        self.emojis.append(Emoji("😡","Angry face"))
        self.emojis.append(Emoji("😎","Face with sunglasses"))
        self.emojis.append(Emoji("👹","Ogre"))
        self.emojis.append(Emoji("🤖","Robot"))
        self.emojis.append(Emoji("🐨","Koala"))
        self.emojis.append(Emoji("🐥","Chicken"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

