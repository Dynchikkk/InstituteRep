package com.example.application.helpers

import android.content.ContentValues
import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.ByteArrayOutputStream

data class User(
    val id: Int,
    val name: String,
    val email: String,
    val login: String,
    val password: String,
    var isAdmin: Int,
    val avatar: ByteArray? = null
)

class DatabaseHelper(context: Context) :
    SQLiteOpenHelper(context, "users.db", null, 2) {

    override fun onCreate(db: SQLiteDatabase) {
        db.execSQL(
            """
            CREATE TABLE users (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT,
                email TEXT,
                login TEXT UNIQUE,
                password TEXT,
                isAdmin INTEGER DEFAULT 0,
                avatar BLOB
            )
            """
        )
    }

    override fun onUpgrade(db: SQLiteDatabase, oldVersion: Int, newVersion: Int) {
        db.execSQL("DROP TABLE IF EXISTS users")
        onCreate(db)
    }

    // FUNCTIONS

    fun registerUser(
        name: String,
        email: String,
        login: String,
        password: String,
        avatar: Bitmap? = null
    ): Long {
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

            // сохраняем аватар, если есть
            avatar?.let {
                val stream = ByteArrayOutputStream()
                it.compress(Bitmap.CompressFormat.PNG, 100, stream)
                put("avatar", stream.toByteArray())
            }
        }
        return db.insert("users", null, values)
    }

    fun registerUserAsync(
        scope: CoroutineScope,
        name: String,
        email: String,
        login: String,
        password: String,
        avatar: Bitmap? = null,
        callback: (Long) -> Unit
    ) {
        scope.launch(Dispatchers.IO) {
            val id = registerUser(name, email, login, password, avatar)
            withContext(Dispatchers.Main) { callback(id) }
        }
    }

    fun loginUser(login: String, password: String): User? {
        val db = readableDatabase
        val cursor = db.rawQuery(
            "SELECT * FROM users WHERE login=? AND password=?",
            arrayOf(login, password)
        )
        val user = if (cursor.moveToFirst()) {
            User(
                id = cursor.getInt(cursor.getColumnIndexOrThrow("id")),
                name = cursor.getString(cursor.getColumnIndexOrThrow("name")),
                email = cursor.getString(cursor.getColumnIndexOrThrow("email")),
                login = cursor.getString(cursor.getColumnIndexOrThrow("login")),
                password = cursor.getString(cursor.getColumnIndexOrThrow("password")),
                isAdmin = cursor.getInt(cursor.getColumnIndexOrThrow("isAdmin")),
                avatar = cursor.getBlob(cursor.getColumnIndexOrThrow("avatar"))
            )
        } else null

        cursor.close()
        return user
    }

    fun loginUserAsync(
        scope: CoroutineScope,
        login: String,
        password: String,
        callback: (User?) -> Unit
    ) {
        scope.launch(Dispatchers.IO) {
            val user = loginUser(login, password)
            withContext(Dispatchers.Main) { callback(user) }
        }
    }

    fun getAllUsers(): List<User> {
        val db = readableDatabase
        val cursor = db.rawQuery("SELECT * FROM users", null)
        val list = mutableListOf<User>()
        while (cursor.moveToNext()) {
            list.add(
                User(
                    id = cursor.getInt(cursor.getColumnIndexOrThrow("id")),
                    name = cursor.getString(cursor.getColumnIndexOrThrow("name")),
                    email = cursor.getString(cursor.getColumnIndexOrThrow("email")),
                    login = cursor.getString(cursor.getColumnIndexOrThrow("login")),
                    password = cursor.getString(cursor.getColumnIndexOrThrow("password")),
                    isAdmin = cursor.getInt(cursor.getColumnIndexOrThrow("isAdmin")),
                    avatar = cursor.getBlob(cursor.getColumnIndexOrThrow("avatar"))
                )
            )
        }
        cursor.close()
        return list
    }

    fun getAllUsersAsync(scope: CoroutineScope, callback: (List<User>) -> Unit) {
        scope.launch(Dispatchers.IO) {
            val users = getAllUsers()
            withContext(Dispatchers.Main) { callback(users) }
        }
    }

    fun getUserById(userId: Int): User? {
        val db = readableDatabase
        val cursor = db.rawQuery("SELECT * FROM users WHERE id=?", arrayOf(userId.toString()))
        val user = if (cursor.moveToFirst()) {
            User(
                id = cursor.getInt(cursor.getColumnIndexOrThrow("id")),
                name = cursor.getString(cursor.getColumnIndexOrThrow("name")),
                email = cursor.getString(cursor.getColumnIndexOrThrow("email")),
                login = cursor.getString(cursor.getColumnIndexOrThrow("login")),
                password = cursor.getString(cursor.getColumnIndexOrThrow("password")),
                isAdmin = cursor.getInt(cursor.getColumnIndexOrThrow("isAdmin")),
                avatar = cursor.getBlob(cursor.getColumnIndexOrThrow("avatar"))
            )
        } else null

        cursor.close()
        return user
    }

    fun getUserByIdAsync(scope: CoroutineScope, userId: Int, callback: (User?) -> Unit) {
        scope.launch(Dispatchers.IO) {
            val user = getUserById(userId)
            withContext(Dispatchers.Main) { callback(user) }
        }
    }

    fun makeAdmin(userId: Int) {
        val db = writableDatabase
        val values = ContentValues().apply { put("isAdmin", 1) }
        db.update("users", values, "id=?", arrayOf(userId.toString()))
    }

    fun makeAdminAsync(scope: CoroutineScope, userId: Int, callback: () -> Unit) {
        scope.launch(Dispatchers.IO) {
            makeAdmin(userId)
            withContext(Dispatchers.Main) { callback() }
        }
    }

    fun updateUserAvatar(userId: Int, avatar: Bitmap) {
        val db = writableDatabase
        val stream = ByteArrayOutputStream()
        avatar.compress(Bitmap.CompressFormat.PNG, 100, stream)
        val values = ContentValues().apply {
            put("avatar", stream.toByteArray())
        }
        db.update("users", values, "id=?", arrayOf(userId.toString()))
    }

    fun updateUserAvatarAsync(scope: CoroutineScope, userId: Int, avatar: Bitmap, callback: () -> Unit) {
        scope.launch(Dispatchers.IO) {
            updateUserAvatar(userId, avatar)
            withContext(Dispatchers.Main) { callback() }
        }
    }

    // ---------- UTILS ----------

    fun decodeAvatar(bytes: ByteArray?): Bitmap? {
        return bytes?.let { BitmapFactory.decodeByteArray(it, 0, it.size) }
    }
}
