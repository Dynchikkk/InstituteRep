package com.example.application

import android.app.Activity
import android.os.Bundle
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.ListView

class UserListActivity : Activity() {
    // Elements
    private lateinit var buttonAddUser: Button
    private lateinit var listUsers: ListView
    private lateinit var adapter: ArrayAdapter<String>

    // Variables
    private val userList = ArrayList<String>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_user_list)

        buttonAddUser = findViewById(R.id.buttonAddUser)

        listUsers = findViewById(R.id.listUsers)
        adapter = ArrayAdapter(
            this,
            R.layout.item_user,
            R.id.itemContent,
            userList
        )
        listUsers.adapter = adapter

        buttonAddUser.setOnClickListener {
            userList.add("Пользователь")
            adapter.notifyDataSetChanged()
        }
    }
}