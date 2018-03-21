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
        
        //var myExample = MyExample(name: "Marco")

        //var myExample2 = MyExample()
        
        NSLog("returned int: \(MyExample.returnInt())")
        
        NSLog("retured sumInts: \(MyExample.sumInts(a: 30, b: 30))")
        
    }
}
