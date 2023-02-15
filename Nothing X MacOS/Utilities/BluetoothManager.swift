//
//  BluetoothManager.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 07/01/23.
//

import Foundation
import SwiftUI
import IOBluetooth
import CoreBluetooth

enum NothingXBattery:String {
    case left = "BatteryPercentLeft"
    case right = "BatteryPercentRight"
    case `case` = "BatteryPercentCase"
}

class BluetoothManager: NSObject {

    static let shared = BluetoothManager()
    private let classOfNothing:UInt32 = 2360324
    private var disconnectComplete:(_ success:Bool, _ errorInfo:String) -> Void = {_,_ in}
    private var connectComplete:(_ success:Bool, _ errorInfo:String) -> Void = {_,_ in}
    private let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    
    var centralManager:CBCentralManager!
    
    override init() {
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    var allPairedDevices:[IOBluetoothDevice] {
        IOBluetoothDevice.pairedDevices().filter{ $0 is IOBluetoothDevice }.map{ $0 as! IOBluetoothDevice }
    }
    
    var allPairedAirpods:[IOBluetoothDevice] {
        allPairedDevices.filter{ $0.classOfDevice == classOfNothing }
    }
    
    
    func connect(addressStr:String) -> (Bool, String) {
        if let device = IOBluetoothDevice(addressString: addressStr) {
            return connect(device: device)
        } else {
            return (false, "wrong address")
        }
    }
    
    func connect(device:IOBluetoothDevice) -> (Bool, String) {
        guard device.isPaired() else {
            return (false, "unpaired device")
        }
        
        guard !device.isConnected() else {
            return (false, "device is connected")
            
        }
        
        let result = device.openConnection(nil, withPageTimeout: 20, authenticationRequired: false)
        if result == kIOReturnSuccess {
            return (true, "")
        } else {
            return (false, "connect failed:\(result)")
        }
    }
    
    func disconnect(addressStr:String) -> (Bool, String){
        if let device = IOBluetoothDevice(addressString: addressStr) {
            return disconnect(device: device)
        } else {
            return (false, "wrong address")
        }
    }
    
    func disconnect(device:IOBluetoothDevice) -> (Bool, String) {
        guard device.isPaired() else {
            return (false, "unpaired device")
        }
        
        guard device.isConnected() else {
            return (false, "device is disconnected")
        }
        
        let result = device.closeConnection()
        if result == kIOReturnSuccess {
            return (true, "")
        } else {
            return (false, "disconnect failed:\(result)")
        }
    }
    
    
    
}

extension BluetoothManager:CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            print("Power on")
        case .poweredOff:
            print("Power off")
        case .unsupported:
            print("Unsupported")
        default:
            break
        }
    }
}
