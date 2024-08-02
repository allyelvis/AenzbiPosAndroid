package com.aenzbi.pos.database

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity
data class Product(
    @PrimaryKey val id: Int,
    val name: String,
    val price: Double,
    val quantity: Int
)
