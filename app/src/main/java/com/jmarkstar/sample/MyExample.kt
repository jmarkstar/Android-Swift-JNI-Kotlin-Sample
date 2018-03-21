package com.jmarkstar.sample

/**
 * Created by jmarkstar on 3/20/18.
 */
class MyExample {

    companion object {
        @JvmStatic val myInt: Int = 1000

        fun returnInt() : Int = 20
        fun sumInts(a: Int, b:Int) : Int = a + b
        fun concat(str1: String, str2: String) : String = "$str1 $str2"
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

}