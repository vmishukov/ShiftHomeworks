//
//  EmployeesDataStore.swift
//  homework-8
//
//  Created by Vladislav Mishukov on 16.06.2024.
//

import Foundation
import CoreData
import UIKit

protocol EmployeesDataStoreDelegate: AnyObject {
    
    func employeesDataStore(_ : any EmployeesDataStoreProtocol, insert employee: Employee, at indexPath: IndexPath)
    
    func employeesDataStoreDeleteEmployee(_ : any EmployeesDataStoreProtocol, at indexPath: IndexPath)
}

protocol EmployeesDataStoreProtocol {
    
    var delegate: EmployeesDataStoreDelegate? { get set }
    func addNew(employee: EmployeeServiceData, at companyUuid: UUID) throws
    func deleteEmployee(by uuid: UUID, at companyUuid: UUID) throws
    func fetchEmployees(at companyUuid: UUID) throws -> [Employee]?
}

final class EmployeesDataStore: NSObject, EmployeesDataStoreProtocol {
    
    weak var delegate: EmployeesDataStoreDelegate?
    
    private let context: NSManagedObjectContext
    private var companiesFetchResultController: NSFetchedResultsController<Employee>?
    
    override init() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.context = context
        super.init()
        self.setupFetchResultController()
    }
    
    func addNew(employee: EmployeeServiceData, at companyUuid: UUID) throws {
        let companyFetchRequest = Company.fetchRequest()
        companyFetchRequest.returnsObjectsAsFaults = false
        companyFetchRequest.predicate = NSPredicate(format: "%K == %@",
                                                    #keyPath(Company.uid),
                                                    companyUuid.uuidString)
        
        let results = try context.fetch(companyFetchRequest)
        
        if results.isEmpty == false {
            let employeeCoreData = Employee(context: context)
            employeeCoreData.uid = UUID()
            employeeCoreData.name = employee.name
            if let age = employee.age {
                employeeCoreData.age = NSDecimalNumber(string: String(age) )
            }
            employeeCoreData.position = employee.position
            results[0].addToEmployees(employeeCoreData)
            try context.save()
        }
    }
    
    func deleteEmployee(by uuid: UUID, at companyUuid: UUID) throws {
        let fetchRequest = Employee.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        let companyPredicate = NSPredicate(format: "%K == %@",
                                             #keyPath(Employee.workPlace.uid),
                                             companyUuid.uuidString)
        let employeePredicate = NSPredicate(format: "%K == %@",
                                             #keyPath(Employee.workPlace.uid),
                                             companyUuid.uuidString)
        let andPredicate = NSCompoundPredicate(type: .and, subpredicates: [employeePredicate, companyPredicate])
        fetchRequest.predicate = andPredicate
        let results = try context.fetch(fetchRequest)
        
        results.forEach {
            context.delete($0)
        }
        try context.save()
    }
    
    func fetchEmployees(at companyUuid: UUID) throws -> [Employee]? {
        let fetchRequest = Employee.fetchRequest()
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.predicate = NSPredicate(format: "%K == %@",
                                             #keyPath(Employee.workPlace.uid),
                                             companyUuid.uuidString)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let employeesFromCoreData = try context.fetch(fetchRequest)
        return employeesFromCoreData
    }
}

private extension EmployeesDataStore {
    
    private func setupFetchResultController() {
        let fetchRequest = Employee.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let context = self.context
        let fetchedResultController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        fetchedResultController.delegate = self
        try? fetchedResultController.performFetch()
        self.companiesFetchResultController = fetchedResultController
    }
}

extension EmployeesDataStore: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<any NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
            
        case .insert:
            if let indexPath = newIndexPath, let employee = anObject as? Employee {
                delegate?.employeesDataStore(self, insert: employee, at: indexPath)
            }
            break
            
        case .delete:
            if let indexPath = indexPath {
                delegate?.employeesDataStoreDeleteEmployee(self, at: indexPath)
            }
            break
            
        default:
            break
        }
    }
}
