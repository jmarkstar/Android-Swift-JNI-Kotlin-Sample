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
    
    //**********************************/
    //         CONSTRUCTORS             /
    //**********************************/
    
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
    
    //**********************************/
    //        STATIC FIELDS             /
    //**********************************/
    
    
    
    //**********************************/
    //        INSTANCE FIELDS           /
    //**********************************/
    
    
    
    //**********************************/
    //        STATIC METHODS            /
    //**********************************/
    
    private static var returnInt_Method_Ref: jmethodID?
    open class func returnInt() -> Int {
        var __locals = [jobject]()
        var params = [jvalue]( repeating: jvalue(), count: 1 )
        
        let returnedInt = JNIMethod.CallStaticIntMethod(
            className: "com/jmarkstar/sample/MyExample",
            classCache: &MyExample.MyExampleJNIClass,
            methodName: "returnInt",
            methodSig: "()I",
            methodCache: &returnInt_Method_Ref,
            args: &params,
            locals: &__locals )
        
        return Int(returnedInt)
    }
    
    private static var sumInts_Method_Ref: jmethodID?
    open class func sumInts(a: Int, b: Int) -> Int {
        var __locals = [jobject]()
        
        var params = [jvalue]( repeating: jvalue(), count: 2 )
        params[0] = JNIType.toJava( value: a, locals: &__locals )
        params[1] = JNIType.toJava( value: b, locals: &__locals )
        
        let returnedInt = JNIMethod.CallStaticIntMethod(
            className: "com/jmarkstar/sample/MyExample",
            classCache: &MyExample.MyExampleJNIClass,
            methodName: "sumInts",
            methodSig: "(II)I",
            methodCache: &sumInts_Method_Ref,
            args: &params,
            locals: &__locals )
        
        return Int(returnedInt)
    }
    
    //**********************************/
    //        INSTANCE METHODS            /
    //**********************************/
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

