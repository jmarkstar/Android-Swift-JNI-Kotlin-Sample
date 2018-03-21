//
//  main.swift
//  libswiftkotlin.soPackageDescription
//
//  Created by Marco Estrella on 3/20/18.
//

import Foundation
import java_lang
import java_util
import Foundation

open class main {
    
    public init() {
        NSLog("\(type(of: self)): \(#function)")
    }
    

    // one-off call to bind the Java and Swift sections of app
    @_silgen_name("Java_com_jmarkstar_sample_MainActivity_viewLoaded")
    public static func viewLoaded( __env: UnsafeMutablePointer<JNIEnv?>, __this: jobject?){
        
        NSLog("\(type(of: self)): \(#function)")
        
        NSLog(".::SWIFT::.")
        
        let myExample = MyExample(name: "Marco")
        
        NSLog("NAME instance field: \(myExample.name!)")
        myExample.name = "Shelly"
        NSLog("NAME instance field: \(myExample.name!)")
        
        let result: Double = myExample.sumDoubles(d1: 25.342323, d2: 34.232356)
        NSLog("result sumDoubles: \(result)")
        
        myExample.sayHello()
        
        NSLog("NAME instance field: \(myExample.name!)")
        
        NSLog("returned int: \(MyExample.returnInt())")
        
        NSLog("retured sumInts: \(MyExample.sumInts(a: 30, b: 30))")
        
        NSLog("MY BYTE static field: \(MyExample.MY_BYTE)")
        NSLog("MY SHORT static field: \(MyExample.MY_SHORT)")
        NSLog("MY INT static field: \(MyExample.MY_INT)")
        NSLog("MY LONG static field: \(MyExample.MY_LONG)")
        
        
    }
}
