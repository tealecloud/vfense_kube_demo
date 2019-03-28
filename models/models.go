package models

import (
	"fmt"
	"github.com/jinzhu/gorm"
    _ "github.com/jinzhu/gorm/dialects/sqlite"
	"github.com/joho/godotenv"
)

var db *gorm.DB //database

func init() {

	e := godotenv.Load() //Load .env file
	if e != nil {
		fmt.Print(e)
	}

	conn, err := gorm.Open("sqlite3", "/tmp/vfense.db")
	if err != nil {
		fmt.Print(err)
	}

	db = conn
	db.Debug().AutoMigrate(&Account{}) //Database migration
}

//returns a handle to the DB object
func GetDB() *gorm.DB {
	return db
}
