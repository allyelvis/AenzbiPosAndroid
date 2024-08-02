package com.aenzbi.pos.network

import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.Body
import com.aenzbi.pos.database.Product

interface ApiService {
    @GET("products")
    suspend fun getProducts(): List<Product>

    @POST("sales")
    suspend fun postSale(@Body sale: Sale): Response<SaleResponse>
}
