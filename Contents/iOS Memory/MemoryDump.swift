//
//  MemoryDump.swift
//  SwiftTest
//
//  Created by Shin Jae Ung on 2022/08/30.
//

import Foundation

struct Memory {
    @inlinable static func dump<T>(variable: inout T) {
        withUnsafePointer(to: &variable) { print($0) }
    }
    
    @inlinable static func dump(with: UnsafeRawPointer) {
        let address = Int(bitPattern: with)
        print(String(format:"%018p", address))
    }
    
    @inlinable static func dump(object: AnyObject) {
        print(Unmanaged.passUnretained(object).toOpaque())
    }
}

func dumpInt() {
    var int = 10
    print("\n--------Int(\(MemoryLayout.size(ofValue: int)))---------")
    Memory.dump(variable: &int)
}

func dumpArray() {
    var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    print("\n--------Array(\(MemoryLayout.size(ofValue: array)))---------")
    Memory.dump(variable: &array)
    Memory.dump(with: array)
}

func dumpString() {
    var shortString = "ABCDEFGHIJLMNO"
    var longString = "ABCDEFGHIJKLMNOP"
    print("\n--------String(\(MemoryLayout.size(ofValue: shortString)))---------")
    Memory.dump(variable: &shortString)
    Memory.dump(with: shortString)
    Memory.dump(variable: &longString)
    Memory.dump(with: longString)
}

func dumpClass() {
    class TestClass { var x = 253 }
    var testClass = TestClass()
    print("\n--------TestClass(\(MemoryLayout.size(ofValue: testClass)))---------")
    Memory.dump(variable: &testClass)
    Memory.dump(object: testClass)
    Memory.dump(variable: &testClass.x)
    Memory.dump(with: &testClass.x)
}

func dumpStruct() {
    struct TestStruct {
        class TestClass { var x = 254 }
        var testClass = TestClass()
    }
    var testStruct = TestStruct()
    print("\n--------TestStruct(\(MemoryLayout.size(ofValue: testStruct)))---------")
    Memory.dump(variable: &testStruct.testClass)
    Memory.dump(variable: &testStruct.testClass.x)
    Memory.dump(object: testStruct.testClass)
}

func dumpEnum() {
    enum TestEnum { }
    var testEnum = TestEnum.self
    print("\n--------TestEnum(\(MemoryLayout.size(ofValue: testEnum)))---------")
    Memory.dump(variable: &testEnum)
    
    enum TestEnum2 { case x }
    var testEnum2 = TestEnum2.x
    print("\n--------TestEnum2(\(MemoryLayout.size(ofValue: testEnum2)))---------")
    Memory.dump(variable: &testEnum2)
    
    enum TestEnum3 { case x, y }
    var testEnum3 = TestEnum3.x
    print("\n--------TestEnum3(\(MemoryLayout.size(ofValue: testEnum3)))---------")
    Memory.dump(variable: &testEnum3)
}

func dumpStruct2() {
    struct TestStruct {
        let 십오 = UInt.max
        let 십사 = UInt.max / 15 * 14
        let 십심 = UInt.max / 15 * 13
        let 십이 = UInt.max / 15 * 12
        let 십일 = UInt.max / 15 * 11
        let 십 = UInt.max / 15 * 10
        let 구 = UInt.max / 15 * 9
        let 팔 = UInt.max / 15 * 8
        let 칠 = UInt.max / 15 * 7
        let 육 = UInt.max / 15 * 6
        let 오 = UInt.max / 15 * 5
        let 사 = UInt.max / 15 * 4
        let 삼 = UInt.max / 15 * 3
        let 이 = UInt.max / 15 * 2
        let 일 = UInt.max / 15 * 1
        let 영 = 0
        let a = 97
        let b = 98
        let c = 99
        let d = 100
        let e = 101
        let f = 102
        let g = 103
        let h = 104
        let i = 105
        let j = 106
        let k = 107
        let l = 108
        let m = 109
        let n = 110
        let o = 111
        let p = 112
        let q = 113
        let r = 114
        let s = 115
        let t = 116
        let u = 117
        let v = 118
        let w = 119
        let x = 120
        let y = 121
        let z = 122
        let (A, B, C, D, E ,F) = (65, 66, 67, 68, 69, 70)
    }
    var testStruct = TestStruct()
    print("\n--------TestStruct(\(MemoryLayout.size(ofValue: testStruct)))---------")
    Memory.dump(variable: &testStruct)
}

//dumpInt()
//dumpArray()
//dumpString()
//dumpClass()
//dumpStruct()
//dumpEnum()
//dumpStruct2()
