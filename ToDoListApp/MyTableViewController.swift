//
//  MyTableViewController.swift
//  ToDoListApp
//
//  Created by David Gudeman on 1/28/15.
//  Copyright (c) 2015 David Gudeman. All rights reserved.
//

// CP cells appear after leaving the box
// CP delete does not work
// CP the pop up box quit working when I added a second view

import UIKit

class MyTableViewController: UITableViewController{

    var ToDoItems = ["Pick Up Laundry", "Wash Car", "Study", "Order Groceries"]
    var ToDoImages = ["laundry", "car", "study", "groceries"]
    var ToDoTimes = ["10:00 am", "11:00 am", "12:00 pm", "1:00 pm", "2:00 pm"]
    var CheckState = [false, false, false, false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        var selectedItem = ToDoItems[indexPath.row]
        let msgAlert = UIAlertView(title: "To Do Row Selected", message: selectedItem, delegate: nil, cancelButtonTitle: "OK")
        msgAlert.show()
        
        CheckState[indexPath.row] = !(CheckState[indexPath.row])
        if (CheckState[indexPath.row])
        {
            self.tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .Checkmark
        }
        else
        {
            self.tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .None
        }
        
        //self.tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = .Checkmark
        self.tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return ToDoItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ToDoCell";
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as MyTableViewCell
        
        cell.cellItemName?.text = ToDoItems[indexPath.row];
        cell.cellImage?.image = UIImage(named: ToDoImages[indexPath.row])
        cell.cellItemType?.text = ToDoTimes[indexPath.row]
        
        return cell
    }
    
  

  
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        ToDoItems.removeAtIndex(indexPath.row)
        ToDoTimes.removeAtIndex(indexPath.row)
        ToDoImages.removeAtIndex(indexPath.row)
        CheckState.removeAtIndex(indexPath.row)
        
        self.tableView.reloadData()
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowItemDetail"
        {
            if let indPath = self.tableView.indexPathForSelectedRow()
            {
                let detailViewController = segue.destinationViewController as
                 MyDetailViewController
                detailViewController.LabelItemText = self.ToDoItems[indPath.row]
                detailViewController.LabelTimeText = self.ToDoTimes[indPath.row]
                detailViewController.LabelImageText = self.ToDoImages[indPath.row]
                
            }
        }
    }
    

}
