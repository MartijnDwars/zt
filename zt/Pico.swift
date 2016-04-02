//
//  Connection.swift
//  zt
//
//  Created by Martijn Dwars on 02/04/16.
//  Copyright © 2016 Martijn Dwars. All rights reserved.
//

import Foundation
import CocoaAsyncSocket

class Pico : NSObject, AsyncSocketDelegate {
    var socket: GCDAsyncSocket! = nil
    
    func connect() {
        socket = GCDAsyncSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        
        do {
            try socket.connectToHost("192.168.0.1", onPort: 10001)
            
            socket.readDataWithTimeout(-1, tag: 0)
        } catch {
            print(error)
        }
    }
    
    func send() {
        print("Send!")
        
        let ascii = "n"
        
        let data = ascii.dataUsingEncoding(NSASCIIStringEncoding)
        
        socket.writeData(data, withTimeout: -1, tag: 0)
    }
    
    func socket(socket: GCDAsyncSocket, didConnectToHost host:String, port p:UInt16) {
        print("Connected!")
    }
    
    func socket(socket: GCDAsyncSocket, didReadData data:NSData, withTag tag:Int32) {
        if let ascii = NSString(data: data, encoding: NSASCIIStringEncoding) {
            print(ascii)
        }
        
        socket.readDataWithTimeout(-1, tag: 0)
    }
}