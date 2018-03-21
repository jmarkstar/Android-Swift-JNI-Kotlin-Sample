//
//  MyExampleClass.swift
//  libswiftkotlin.soPackageDescription
//
//  Created by Marco Estrella on 3/20/18.
//

import Foundation
import java_swift
import java_lang
import java_util

open class MyExample: JavaObject {
    
    public convenience init?( casting object: JavaObject, _ file: StaticString = #file, _ line: Int = #line ) {
        self.init( javaObject: nil )
        object.withJavaObject {
            self.javaObject = $0
        }
    }
    
    //Global reference of the Java MyExample object
    private static var MyExampleJNIClass: jclass?
    
    /** Constructor without params
     */
    private static var constructor1: jmethodID?
    public convenience init() {
        
        var __locals = [jobject]()
        
        //creating arrays of params for the constructor
        var params = [jvalue]( repeating: jvalue(), count: 1 )

        //creating newMyExampleObject local ref
        let newMyExampleObject = JNIMethod
            .NewObject( className: "com/jmarkstar/sample/MyExample",
                        classCache: &MyExample.MyExampleJNIClass,
                        methodSig: "()V",
                        methodCache: &MyExample.constructor1, args: &params, locals: &__locals )
        
        //creating newMyExampleObject global ref.
        self.init( javaObject: newMyExampleObject )
        
        //deleting newMyExampleObject
        JNI.DeleteLocalRef( newMyExampleObject )
    }
    
    /** Constructor with name param
     */
    private static var constructor2: jmethodID?
    public convenience init( name: String? ) {
        
        var __locals = [jobject]()
        
        //creating arrays of params for the constructor
        var params = [jvalue]( repeating: jvalue(), count: 1 )
        params[0] = JNIType.toJava( value: name, locals: &__locals )
        
        //creating newMyExampleObject local ref
        let newMyExampleObject = JNIMethod
            .NewObject( className: "com/jmarkstar/sample/MyExample",
            classCache: &MyExample.MyExampleJNIClass,
            methodSig: "(Ljava/lang/String;)V",
            methodCache: &MyExample.constructor2, args: &params, locals: &__locals )
        
        //creating newMyExampleObject global ref.
        self.init( javaObject: newMyExampleObject )
        
        //deleting newMyExampleObject
        JNI.DeleteLocalRef( newMyExampleObject )
    }
    
    
    
    
}

