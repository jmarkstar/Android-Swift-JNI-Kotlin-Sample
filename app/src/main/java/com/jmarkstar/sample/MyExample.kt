package com.jmarkstar.sample

/**
 * Created by jmarkstar on 3/20/18.
 */
class MyExample {

    companion object {
        @JvmStatic val MY_BYTE: Byte = 127
        @JvmStatic val MY_SHORT: Short = 2700
        @JvmStatic val MY_INT: Int = 1000
        @JvmStatic val MY_LONG: Long = 12700000
        @JvmStatic val MY_FLOAT: Float = 1000.4534F
        @JvmStatic val MY_DOUBLE: Double = 12034343.3434454
        @JvmStatic val MY_BOOLEAN: Boolean = true
        @JvmStatic val MY_CHAR: Char = 'S'

        @JvmStatic fun returnInt() : Int = 20
        @JvmStatic fun sumInts(a: Int, b:Int) : Int = a + b
        @JvmStatic fun concat(str1: String, str2: String) : String = "$str1 $str2"
    }

    var name: String? = null

    init {
        println("Init Block")
    }

    constructor()

    constructor(name: String?){
        this.name = name
    }

    fun sumDoubles(d1: Double, d2: Double) : Double = d1 + d2

    fun sayHello(){
        name = "Hi $name"
    }
}