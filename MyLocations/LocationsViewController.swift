//
//  LocationsViewController.swift
//  MyLocations
//
//  Created by Gerson Costa on 19/06/2019.
//  Copyright © 2019 Gerson Costa. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class LocationsViewController: UITableViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    lazy var fetchedResultController: NSFetchedResultsController<Location> = {
        let fetchRequest = NSFetchRequest<Location>()
        let entity = Location.entity()
        fetchRequest.entity = entity
        
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchRequest.fetchBatchSize = 20
        
        let fetchedResultController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: "Locations")
        
        fetchedResultController.delegate = self
        
        return fetchedResultController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        performFetch()
    }
    
    func performFetch() {
        do {
            try fetchedResultController.performFetch()
        } catch {
            fatalCoreDataError(error)
        }
    }
    
    deinit {
        fetchedResultController.delegate = nil
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell", for: indexPath) as! LocationCell
        
        let location = fetchedResultController.object(at: indexPath)
        
        cell.configure(for: location)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editLocation" {
            let controller = segue.destination as! LocationDetailsViewController
            controller.managedObjectContext = managedObjectContext
            
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                let location = fetchedResultController.object(at: indexPath)
                controller.locationToEdit = location
            }
        }
    }
}

extension LocationsViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        print("====Controller will change content!====")
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
            case .insert:
                debugPrint("*** NSFetchedResultsChangeInsert (object)")
                tableView.insertRows(at: [newIndexPath!], with: .fade)
            case .delete:
                print("*** NSFetchedResultsChangeDelete (object)")
                tableView.deleteRows(at: [indexPath!], with: .fade)
            case .update:
                print("*** NSFetchedResultsChangeUpdate (object)")
                if let cell = tableView.cellForRow(at: indexPath!) as? LocationCell {
                    let location = controller.object(at: indexPath!) as! Location
                    cell.configure(for: location)
                }
            case .move:
                print("*** NSFetchedResultsChangeMove (object)")
                tableView.deleteRows(at: [indexPath!], with: .fade)
                tableView.insertRows(at: [indexPath!], with: .fade)
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        switch type {
            case .insert:
                print("*** NSFetchedResultsChangeInsert (section)")
                tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
            case .delete:
                print("*** NSFetchedResultsChangeDelete (section)")
                tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
            case .update:
                print("*** NSFetchedResultsChangeUpdate (section)")
            case .move:
                print("*** NSFetchedResultsChangeMove (section)")
        }
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        debugPrint("*** controllerDidChangeContent***")
        tableView.endUpdates()
    }
    
}
