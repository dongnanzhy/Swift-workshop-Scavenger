//
//  ListViewController.swift
//  Scavenger
//
//  Created by Xinyun (Victor) Zhao on 9/23/14.
//  Copyright (c) 2014 Xinyun (Victor) Zhao. All rights reserved.
//


import UIKit

class ListViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //var itemsList = ["Cat", "Bird", "Brick"]
    var itemsList = [ScavengerHuntItem]()
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell") as UITableViewCell
        
        let item = itemsList[indexPath.row]
        cell.textLabel!.text = item.name
        
        if (item.isComplete){
            cell.accessoryType = .Checkmark
            cell.imageView!.image = item.photo
        }
        else{
            cell.accessoryType = .None
            cell.imageView?.image = nil
        }
        
        return cell
    }
    @IBAction func unwindToList(seque: UIStoryboardSegue){
        if seque.identifier == "DoneItem"{
            let additemController = seque.sourceViewController as ViewController
            if let newItem = additemController.createdItem{
                itemsList += [newItem]
                let indexPath = NSIndexPath (forRow : itemsList.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation:.Automatic)
            }
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            imagePicker.sourceType = .Camera
        }
        else{
            imagePicker.sourceType = .PhotoLibrary
        }
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion:nil)
    }
    
// func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage info: NSDictionary){
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let indexPath = tableView.indexPathForSelectedRow()!
        let selectedItem = itemsList[indexPath.row]
        let photo = info[UIImagePickerControllerOriginalImage] as UIImage
        selectedItem.photo = photo
        dismissViewControllerAnimated(true, completion: {
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
            self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        })
    }
}