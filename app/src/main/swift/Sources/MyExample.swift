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
    
    private static var MY_BYTE_FieldID: jfieldID?
    open static var MY_BYTE: Int8 {
        get{
            let __value = JNIField
                .GetStaticByteField(
                    fieldName: "MY_BYTE",
                    fieldType: "B",
                    fieldCache: &MY_BYTE_FieldID,
                    className: "com/jmarkstar/sample/MyExample", classCache: &MyExample.MyExampleJNIClass )
            return __value
        }
    }
    
    private static var MY_SHORT_FieldID: jfieldID?
    open static var MY_SHORT: Int16 {
        get{
            let __value = JNIField
                .GetStaticShortField(
                    fieldName: "MY_SHORT",
                    fieldType: "S",
                    fieldCache: &MY_SHORT_FieldID,
                    className: "com/jmarkstar/sample/MyExample", classCache: &MyExample.MyExampleJNIClass )
            return __value
        }
    }
    
    private static var MY_INT_FieldID: jfieldID?
    open static var MY_INT: Int {
        get{
            let __value = JNIField
                .GetStaticIntField(
                    fieldName: "MY_INT",
                    fieldType: "I",
                    fieldCache: &MY_INT_FieldID,
                    className: "com/jmarkstar/sample/MyExample", classCache: &MyExample.MyExampleJNIClass )
            return Int(__value)
        }
    }
    
    private static var MY_LONG_FieldID: jfieldID?
    open static var MY_LONG: Int64 {
        get{
            let __value = JNIField
                .GetStaticLongField(
                    fieldName: "MY_LONG",
                    fieldType: "J",
                    fieldCache: &MY_LONG_FieldID,
                    className: "com/jmarkstar/sample/MyExample", classCache: &MyExample.MyExampleJNIClass )
            return __value
        }
    }
    
    
    //**********************************/
    //        INSTANCE FIELDS           /
    //**********************************/
    
    private static var name_FieldID: jfieldID?
    open var name: String? {
        get{
            let __value = JNIField.GetObjectField(
                    fieldName: "name",
                    fieldType: "Ljava/lang/String;",
                    fieldCache: &MyExample.name_FieldID,
                    object: javaObject )
            defer { JNI.DeleteLocalRef( __value ) }
            return __value != nil ? String( javaObject: __value ) : nil
        }
        set(newName){
            var __locals = [jobject]()
            let __value = JNIType.toJava( value: newName, mapClass: "java/lang/String", locals: &__locals )
            
            JNIField.SetObjectField(
                fieldName: "name",
                fieldType: "Ljava/lang/String;",
                fieldCache: &MyExample.name_FieldID,
                object: javaObject,
                value: __value.l,
                locals: &__locals )
        }
    }
    
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
    
    private static var sumDoubles_MethodID: jmethodID?
    open func sumDoubles(d1: Double, d2: Double) -> Double {
        
        var __locals = [jobject]()
        
        var params = [jvalue]( repeating: jvalue(), count: 2 )
        params[0] = JNIType.toJava( value: d1, locals: &__locals )
        params[1] = JNIType.toJava( value: d2, locals: &__locals )
        
        let __return = JNIMethod.CallDoubleMethod(
            object: javaObject,
            methodName: "sumDoubles",
            methodSig: "(DD)D",
            methodCache: &MyExample.sumDoubles_MethodID,
            args: &params,
            locals: &__locals )
        
        return __return
    }
    
    private static var sayHello_MethodID: jmethodID?
    open func sayHello(){
        var __locals = [jobject]()
        var params = [jvalue]( repeating: jvalue(), count: 1 )
        JNIMethod.CallVoidMethod(
            object: javaObject,
            methodName: "sayHello",
            methodSig: "()V",
            methodCache: &MyExample.sayHello_MethodID,
            args: &params,
            locals: &__locals )
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 
}

