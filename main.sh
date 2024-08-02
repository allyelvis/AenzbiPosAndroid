#!/bin/bash

# Constants
PROJECT_NAME="AenzbiPOS"
PACKAGE_NAME="com.aenzbi.pos"
MIN_SDK_VERSION=21
=31
PROJECT_DIRTARGET_SDK_VERSION="$PWD/$PROJECT_NAME"

# Function to create the Android project
create_android_project() {
    echo "Creating Android project..."
    npx react-native init $PROJECT_NAME --template react-native-template-typescript
    cd $PROJECT_NAME
}

# Function to generate necessary Android components
generate_android_components() {
    echo "Generating Android components..."

    # Create directories for activities, layouts, and other resources
    mkdir -p app/src/main/java/$PACKAGE_NAME/ui/login
    mkdir -p app/src/main/java/$PACKAGE_NAME/ui/product
    mkdir -p app/src/main/java/$PACKAGE_NAME/ui/sales
    mkdir -p app/src/main/java/$PACKAGE_NAME/ui/inventory
    mkdir -p app/src/main/res/layout
    mkdir -p app/src/main/res/values

    # Create MainActivity
    cat <<EOF > app/src/main/java/$PACKAGE_NAME/MainActivity.kt
package $PACKAGE_NAME

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
}
EOF

    # Create LoginActivity
    cat <<EOF > app/src/main/java/$PACKAGE_NAME/ui/login/LoginActivity.kt
package $PACKAGE_NAME.ui.login

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import $PACKAGE_NAME.R

class LoginActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)
    }
}
EOF

    # Create ProductListActivity
    cat <<EOF > app/src/main/java/$PACKAGE_NAME/ui/product/ProductListActivity.kt
package $PACKAGE_NAME.ui.product

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import $PACKAGE_NAME.R

class ProductListActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_product_list)
    }
}
EOF

    # Create SalesActivity
    cat <<EOF > app/src/main/java/$PACKAGE_NAME/ui/sales/SalesActivity.kt
package $PACKAGE_NAME.ui.sales

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import $PACKAGE_NAME.R

class SalesActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_sales)
    }
}
EOF

    # Create InventoryActivity
    cat <<EOF > app/src/main/java/$PACKAGE_NAME/ui/inventory/InventoryActivity.kt
package $PACKAGE_NAME.ui.inventory

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import $PACKAGE_NAME.R

class InventoryActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_inventory)
    }
}
EOF

    # Create layouts
    cat <<EOF > app/src/main/res/layout/activity_main.xml
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <!-- Main layout content -->

</RelativeLayout>
EOF

    cat <<EOF > app/src/main/res/layout/activity_login.xml
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <!-- Login layout content -->

</RelativeLayout>
EOF

    cat <<EOF > app/src/main/res/layout/activity_product_list.xml
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <!-- Product list layout content -->

</RelativeLayout>
EOF

    cat <<EOF > app/src/main/res/layout/activity_sales.xml
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <!-- Sales layout content -->

</RelativeLayout>
EOF

    cat <<EOF > app/src/main/res/layout/activity_inventory.xml
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <!-- Inventory layout content -->

</RelativeLayout>
EOF

    # Create strings.xml
    cat <<EOF > app/src/main/res/values/strings.xml
<resources>
    <string name="app_name">Aenzbi POS</string>
    <string name="hello_world">Hello World!</string>
    <string name="login">Login</string>
    <string name="product_list">Product List</string>
    <string name="sales">Sales</string>
    <string name="inventory">Inventory</string>
</resources>
EOF

    # Create colors.xml
    cat <<EOF > app/src/main/res/values/colors.xml
<resources>
    <color name="colorPrimary">#6200EE</color>
    <color name="colorPrimaryDark">#3700B3</color>
    <color name="colorAccent">#03DAC5</color>
</resources>
EOF

    # Create styles.xml
    cat <<EOF > app/src/main/res/values/styles.xml
<resources>

    <!-- Base application theme -->
    <style name="AppTheme" parent="Theme.AppCompat.Light.DarkActionBar">
        <item name="colorPrimary">@color/colorPrimary</item>
        <item name="colorPrimaryDark">@color/colorPrimaryDark</item>
        <item name="colorAccent">@color/colorAccent</item>
    </style>

</resources>
EOF
}

# Function to integrate necessary dependencies
integrate_dependencies() {
    echo "Integrating dependencies..."

    # Add dependencies to build.gradle
    cat <<EOF >> app/build.gradle
dependencies {
    implementation 'androidx.appcompat:appcompat:1.3.1'
    implementation 'com.google.android.material:material:1.4.0'
    implementation 'androidx.constraintlayout:constraintlayout:2.1.0'
    implementation 'androidx.lifecycle:lifecycle-viewmodel-ktx:2.3.1'
    implementation 'androidx.lifecycle:lifecycle-livedata-ktx:2.3.1'
    implementation 'com.squareup.retrofit2:retrofit:2.9.0'
    implementation 'com.squareup.retrofit2:converter-gson:2.9.0'
    implementation 'androidx.room:room-runtime:2.3.0'
    kapt 'androidx.room:room-compiler:2.3.0'
}
EOF
}

# Function to set up networking and database
setup_networking_database() {
    echo "Setting up networking and database..."

    mkdir -p app/src/main/java/$PACKAGE_NAME/network
    mkdir -p app/src/main/java/$PACKAGE_NAME/database

    # Create ApiService
    cat <<EOF > app/src/main/java/$PACKAGE_NAME/network/ApiService.kt
package $PACKAGE_NAME.network

import retrofit2.http.GET
import retrofit2.http.POST
import retrofit2.http.Body
import $PACKAGE_NAME.database.Product

interface ApiService {
    @GET("products")
    suspend fun getProducts(): List<Product>

    @POST("sales")
    suspend fun postSale(@Body sale: Sale): Response<SaleResponse>
}
EOF

    # Create database entities and DAOs
    cat <<EOF > app/src/main/java/$PACKAGE_NAME/database/Product.kt
package $PACKAGE_NAME.database

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity
data class Product(
    @PrimaryKey val id: Int,
    val name: String,
    val price: Double,
    val quantity: Int
)
EOF

    cat <<EOF > app/src/main/java/$PACKAGE_NAME/database/ProductDao.kt
package $PACKAGE_NAME.database

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.Query

@Dao
interface ProductDao {
    @Query("SELECT * FROM product")
    fun getAll(): List<Product>

    @Insert
    fun insertAll(vararg products: Product)
}
EOF

    cat <<EOF > app/src/main/java/$PACKAGE_NAME/database/AppDatabase.kt
package $PACKAGE_NAME.database

import androidx.room.Database
import androidx.room.RoomDatabase

@Database(entities = [Product::class], version = 1)
abstract class AppDatabase : RoomDatabase() {
    abstract fun productDao(): ProductDao
}
EOF
}

# Function to generate README file
generate_readme() {
    echo "Generating README file..."

    cat <<EOF > README.md
# Aenzbi POS Android App

## Overview
This Android application is designed for the Aenzbi Point of Sale (POS) system.

## Features
- Login and registration functionalities.
- Product management: Add, edit, and view products.
- Sales management: Make sales and view sales history.
- Inventory management: Add and view inventory.
## Installation
### Prerequisites
- Android Studio: https://developer.android.com/studio
# Function to generate README file
generate_readme() {
    echo "Generating README file..."

    cat <<EOF > README.md
# Aenzbi POS Android App

## Overview
This Android application is designed for the Aenzbi Point of Sale (POS) system.

## Features
- Login and registration functionalities.
- Product management: Add, edit, and view products.
- Sales management: Make sales and view sales history.
- Inventory management.
- Reports generation.

## Installation
1. Clone the repository.
2. Open the project in Android Studio.
3. Build and run the project on an Android emulator or device.

## Dependencies
- Retrofit for networking.
- Room for local database.
- AndroidX libraries for modern Android development.

## Usage
- Implement UI/UX design using XML or Jetpack Compose.
- Integrate with EBMS for posting invoices and stock movements.

## Contributors
- [Your Name](https://github.com/yourusername)

EOF
}

# Main script flow
echo "Starting script to create Aenzbi POS Android app..."

create_android_project
generate_android_components
integrate_dependencies
setup_networking_database
generate_readme

echo "Aenzbi POS Android app created successfully!"
