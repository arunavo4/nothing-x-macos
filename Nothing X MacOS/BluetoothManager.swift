//
//  BluetoothManager.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 07/01/23.
//

import Foundation
import SwiftUI
import CoreBluetooth

class BluetoothManager: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate{
    
    static var shared = BluetoothManager()
    private var centralManager:CBCentralManager!
    
    var discoveredPeripheral: CBPeripheral!
    var targetCharacteristic: CBCharacteristic!
    
    var connectedHeadphones: [CBPeripheral] = []
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: .main)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        // Ensure Bluetooth is on to start scanning
        if central.state == .poweredOn {
            print("Bluetooth is available")
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        }
        else if central.state == .poweredOff {
            print("Bluetooth is Off")
            // Ask User to Turn On BT
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral,
                        advertisementData: [String: Any], rssi RSSI: NSNumber) {
        
        // Reject if the signal strength is too low to attempt data transfer.
        // Change the minimum RSSI value depending on your app’s use case.
//        guard RSSI.intValue >= -50
//            else {
//                print("Discovered perhiperal not in expected range, at %d", RSSI.intValue)
//                return
//        }
        
//        print("Discovered %s at %d", String(describing: peripheral.name), RSSI.intValue)
        
        // Device is in range - have we already seen it?
        if discoveredPeripheral != peripheral {
            if let name = peripheral.name {
                if name.contains("Nothing") {
                    // Save a local copy of the peripheral, so CoreBluetooth doesn't get rid of it.
                    discoveredPeripheral = peripheral
                    
                    // And finally, connect to the peripheral.
                    print("Connecting to perhiperal %@", peripheral)
                    centralManager.connect(peripheral, options: nil)
                }
            }
        }
    }
    
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral){
        print("Connected to \(peripheral.name ?? "default")")
        discoveredPeripheral = peripheral
        discoveredPeripheral.delegate = self
        discoveredPeripheral.discoverServices(nil)
    }
        
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error:Error?){
        guard let services = peripheral.services else {return}
        for service in services{
            print(service)
            peripheral.discoverCharacteristics(nil, for: service)
            // Look for the service  which contains the characteristics
//            if service.uuid == CBUUID(string: "myServiceUUID"){
//                // Discover the characteristics
//                peripheral.discoverCharacteristics(nil, for: service)
//            }
        }
    }
    
    //in CBPeripheralDelegate
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service:CBService, error:Error?) {
        guard let characteristics = service.characteristics else {return}
        for characteristic in characteristics {
            print(characteristic)
            //discover descriptors for the characteristic
            peripheral.discoverDescriptors(for: characteristic)
        }
    }
    
    func peripheral(_ peripheral:CBPeripheral, didDiscoverDescriptorsFor characteristic:CBCharacteristic, error:Error?){
        guard let descriptors = characteristic.descriptors else {return}
        for descriptor in descriptors{
            //read value for the descriptor
            peripheral.readValue(for:descriptor)
            
            //print descriptor
            print(descriptor.description)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor:CBDescriptor, error: Error?) {
        
        print("descriptor UUID: \(descriptor.uuid)")
        print("descriptor type: \(descriptor.uuid)")
        if let dataValue = descriptor.value as? Data {
            //print data value as string
            let value = String(data: dataValue, encoding: .utf8)
            print("value: \(value ?? "string-val")")
        } else if let numberValue = descriptor.value as? NSNumber {
             print("value: \(numberValue)")
        } else if let stringValue = descriptor.value as?String{
            print("value: \(stringValue)")
        } else {
            print("value: \(descriptor.value ?? "default-val")")
        }
    }
    
}
