//
//  Util.swift
//  SwiftDataStructures
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Greg Omelaenko
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

/// Wraps an unowned value.
///
/// Useful for cases when the `unowned` modifier cannot be used directly, for example `enum` associated values, and optional variables.
internal struct Unowned<Value : AnyObject> {
    unowned var value: Value
    init(_ value: Value) { self.value = value }
}

/// Round `v` upwards to the nearest power of 2.
internal func ceilToPowerOf2(v: Int) -> Int {
    return Int(1 << (flsl(v - 1)))
}

internal struct CollectionSlice<Base : CollectionType> : CollectionType {

    typealias Index = Base.Index

    private let base: Base
    private let bounds: Range<Index>

    init(base: Base, bounds: Range<Index>) {
        self.base = base
        self.bounds = bounds
    }

    var startIndex: Index { return bounds.startIndex }
    var endIndex: Index { return bounds.endIndex }

    subscript(index: Index) -> Base.Generator.Element {
        return base[index]
    }

    subscript(range: Range<Index>) -> CollectionSlice<Base> {
        return CollectionSlice(base: base, bounds: range)
    }

}
