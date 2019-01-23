//
//  Coin.swift
//  HDWalletKit
//
//  Created by Pavlo Boiko on 10/3/18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation

public enum Coin {
    case bitcoin
    case ethereum
    case zilliqa
    case litecoin
    case bitcoinCash
    case neo
    case zcoin
    case divi
    
    //https://github.com/satoshilabs/slips/blob/master/slip-0132.md
    public var privateKeyVersion: UInt32 {
        switch self {
        case .litecoin: return 0x019D9CFE
        default: return 0x0488ADE4
        }
    }
    
    public var publicKeyVersion: UInt32 {
        switch self {
        case .litecoin: return 0x019DA462
        default: return 0x0488B21E
        }
    }
    
    public var publicKeyHash: UInt8 {
        switch self {
        case .litecoin: return 0x30
        case .zcoin: return 0x52
        case .divi: return 30
        case .neo: return 0x21
        default: return 0x00
        }
    }
    
    //https://www.reddit.com/r/litecoin/comments/6vc8tc/how_do_i_convert_a_raw_private_key_to_wif_for/
    public var wifPreifx: UInt8 {
        switch self {
        case .litecoin: return 0xB0
        case .zcoin: return 0xd2
        case .divi: return 0xd4
        default: return 0x80
        }
    }
    
    public var addressPrefix:String {
        switch self {
        case .zilliqa: fallthrough
        case .ethereum: return "0x"
        default: return ""
        }
    }
    
    public var masterSecret:String {
        switch self {
        case .neo: return "Nist256p1 seed"
        default: return "Bitcoin seed"
        }
    }
    
    
    public var coinType: UInt32 {
        switch self {
        case .bitcoin: return 0
        case .litecoin: return 2
        case .ethereum: return 60
        case .bitcoinCash: return 145
        case .zcoin: return 136
        case .divi: return 301
        case .neo: return 888
        case .zilliqa: return 8888
        }
    }
}
