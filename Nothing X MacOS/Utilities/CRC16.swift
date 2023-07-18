//
//  CRC16.swift
//  Nothing X MacOS
//
//  Created by Arunavo Ray on 28/02/23.
//
//  Blog used for Reference.
//  https://quickbirdstudios.com/blog/data-integrity-crc-swift-ios/
//

import Foundation

public protocol CRC {
    associatedtype Size

    var currentValue: Size { get }

    func getCrc(_ bytes: [UInt8]) -> [UInt8]
}

/// Class to conveniently calculate CRC-16. It uses the CRC16-CCITT polynomial (0x1021)  by default
public class CRC16: CRC {

    /// The table that stores the precomputed remainders for all possible divisions for 1 byte
    /// This table is used as a lookup (to speed up the calculation)
    public let lookupTable: [UInt16]

    private(set) public var currentValue: UInt16 = 0

    /// Creates the instance for calculating CRC
    /// - Parameter polynomial: The polynomial to use. It uses CRC16-CCITT's polynomial (0x1021) by default
    public init(polynomial: UInt16 = 0x1021) {
        /// Generates the lookup table (make sure to generate it only once)
        self.lookupTable = (0...255).map { Self.crc16(for: UInt8($0), polynomial: polynomial) }
    }
    
    public func getCrc(_ bytes: [UInt8]) -> [UInt8] {
        /// Reset
        currentValue = 0
        
        /// Add Bytes for Crc Calculation
        currentValue = crc16(for: bytes, initialValue: currentValue)
        
        return withUnsafeBytes(of: self.currentValue, Array.init)
    }
}

extension CRC16 {
    /// Caculates CRC-16 of an array of Bytes (UInt8)
    private func crc16(for inputs: [UInt8], initialValue: UInt16 = 0) -> UInt16 {
        inputs.reduce(initialValue) { remainder, byte in
            let bigEndianInput = UInt16(byte).bigEndian
            let index = (bigEndianInput ^ remainder) >> 8
            return lookupTable[Int(index)] ^ (remainder << 8)
        }
    }

    /// Calculates the CRC-16 of 1 Byte
    private static func crc16(for input: UInt8, polynomial: UInt16) -> UInt16 {
        var result = UInt16(input).bigEndian
        for _ in 0..<8 {
            let isMostSignificantBitOne = result & 0x8000 != 0

            result = result << 1

            if isMostSignificantBitOne {
                result = result ^ polynomial
            }
        }

        return result
    }
}
