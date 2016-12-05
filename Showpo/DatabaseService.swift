//
//  DatabaseService.swift
//  Showpo
//
//  Created by Thadz on 24/10/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import SQLite

class DatabaseService {
    static let instance = DatabaseService()
    private let db: Connection?
    
    //table
    private let contacts = Table("contacts")
    
    //columns
    private let id = Expression<Int64>("id")
    private let name = Expression<String>("name")
    private let phone = Expression<String>("phone")
    private let address = Expression<String>("address")
    
    private init(){
        
        //database path
        let path = NSSearchPathForDirectoriesInDomains(
            .DocumentDirectory, .UserDomainMask, true
            ).first!
        
        do {
            db = try Connection("\(path)/database.sqlite3")
        }
        catch {
            db = nil
            print ("Unable to open database")
        }
        
        createTable()
    }
    
    func createTable() {
        do {
            try db!.run(contacts.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                
                //add columns
                table.column(name)
                table.column(phone, unique: true)
                table.column(address)
              })
        }
        catch {
            print("Unable to create table")
        }
    }
    
    
    //add key-column data
    func addRow(objName: String, objPhone: String, objAddress: String) -> Int64?{
        do {
            let insert = contacts.insert(name <- objName, phone <- objPhone, address <- objAddress)
            let id = try db!.run(insert)
            
            return id
        } catch {
            print("Insert failed")
            return -1
        }
    }
    
    func getContacts() -> [ShowpoObject] {
        var contacts = [ShowpoObject]()
        
        do {
            for contact in try db!.prepare(self.contacts) {
                contacts.append(ShowpoObject(
                    id: contact[id],
                    name: contact[name],
                    phone: contact[phone],
                    address: contact[address]))
            }
        }
        catch {
            print("Select failed")
        }
        
        return contacts
    }
    
    func deleteContact(cid: Int64) -> Bool {
        do {
            let contact = contacts.filter(id == cid)
            try db!.run(contact.delete())
            return true
        } catch {
            print("Delete failed")
        }
        return false
    }
    
    func updateContact(cid:Int64, newContact: ShowpoObject) -> Bool {
        let contact = contacts.filter(id == cid)
        do {
            let update = contact.update([
                name <- newContact.name,
                phone <- newContact.phone,
                address <- newContact.address
                ])
            if try db!.run(update) > 0 {
                return true
            }
        } catch {
            print("Update failed: \(error)")
        }
        
        return false
    }
}
