package com.jmarkstar.sample

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.util.Log

class MainActivity : AppCompatActivity() {

    companion object {
        const val TAG = "MainActivity"

        private fun loadNativeDependencies() {
            System.loadLibrary("swiftkotlin")
        }
    }

    private external fun viewLoaded()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        loadNativeDependencies()


        var myExampleClass = MyExample()

        var sumDoubles = myExampleClass.sumDoubles(12.5, 12.5)

        myExampleClass.name = "Marco"

        Log.v(TAG, ".::Java::.")
        Log.v(TAG,"Sum is "+sumDoubles.toString())
        Log.v(TAG, MyExample.concat("Hello", "World"))
        Log.v(TAG, MyExample.MY_INT.toString())
        Log.v(TAG, "name "+myExampleClass.name)

        viewLoaded()
    }
}
