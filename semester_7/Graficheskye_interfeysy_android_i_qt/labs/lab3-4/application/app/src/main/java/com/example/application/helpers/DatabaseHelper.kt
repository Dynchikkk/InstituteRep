package com.example.application.helpers

import android.content.ContentValues
import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper

data class User(val id: Int, val name: String, val email: String, val login: String, val password: String, var isAdmin: Int)

class DatabaseHelper(context: Context) : SQLiteOpenHelper(context, "users.db", null, 1) {

    override fun onCreate(db: SQLiteDatabase) {
        db.execSQL(
            "CREATE TABLE users (" +
                    "id INTEGER PRIMARY KEY AUTOINCREMENT," +
                    "name TEXT," +
                    "email TEXT," +
                    "login TEXT UNIQUE," +
                    "password TEXT," +
                    "isAdmin INTEGER DEFAULT 0" +
                    ")"
        )
    }

    override fun onUpgrade(db: SQLiteDatabase, oldVersion: Int, newVersion: Int) {
        db.execSQL("DROP TABLE IF EXISTS users")
        onCreate(db)
    }

    fun registerUser(name: String, email: String, login: String, password: String): Long {
        val db = writableDatabase
        val cursor = db.rawQuery("SELECT COUNT(*) FROM users", null)
        cursor.moveToFirst()
        val count = cursor.getInt(0)
        cursor.close()
        val isAdmin = if (count == 0) 1 else 0

        val values = ContentValues().apply {
            put("name", name)
            put("email", email)
            put("login", login)
            put("password", password)
            put("isAdmin", isAdmin)
        }
        return db.insert("users", null, values)
    }

    fun loginUser(login: String, password: String): User? {
        val db = readableDatabase
        val cursor = db.rawQuery("SELECT id, name, email, login, password, isAdmin FROM users WHERE login=? AND password=?", arrayOf(login, password))
        return if (cursor.moveToFirst()) {
            val u = User(
                cursor.getInt(0),
                cursor.getString(1),
                cursor.getString(2),
                cursor.getString(3),
                cursor.getString(4),
                cursor.getInt(5)
            )
            cursor.close()
            u
        } else {
            cursor.close()
            null
        }
    }

    fun getAllUsers(): List<User> {
        val db = readableDatabase
        val cursor = db.rawQuery("SELECT id, name, email, login, password, isAdmin FROM users", null)
        val list = mutableListOf<User>()
        while (cursor.moveToNext()) {
            list.add(
                User(
                    cursor.getInt(0),
                    cursor.getString(1),
                    cursor.getString(2),
                    cursor.getString(3),
                    cursor.getString(4),
                    cursor.getInt(5)
                )
            )
        }
        cursor.close()
        return list
    }

    fun makeAdmin(userId: Int) {
        val db = writableDatabase
        val values = ContentValues().apply { put("isAdmin", 1) }
        db.update("users", values, "id=?", arrayOf(userId.toString()))
    }

    fun getUserById(userId: Int): User? {
        val db = readableDatabase
        val cursor = db.rawQuery("SELECT id, name, email, login, password, isAdmin FROM users WHERE id=?", arrayOf(userId.toString()))
        return if (cursor.moveToFirst()) {
            val u = User(
                cursor.getInt(0),
                cursor.getString(1),
                cursor.getString(2),
                cursor.getString(3),
                cursor.getString(4),
                cursor.getInt(5)
            )
            cursor.close()
            u
        } else {
            cursor.close()
            null
        }
    }
}