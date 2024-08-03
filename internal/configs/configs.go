package configs

import (
	"fmt"
	"os"
	"strconv"

	"github.com/joho/godotenv"
)

type Config struct {
	PublicHost             string
	Port                   uint16
	DBUser                 string
	DBPassword             string
	DBHost                 string
	DBPort                 uint16
	DBName                 string
	JWTSecret              string
	JWTExpirationInSeconds uint64
	ConnectionString       string
}

var Envs = initConfig()

func initConfig() Config {
	godotenv.Load()

	config := Config{
		PublicHost:             getEnv("PUBLIC_HOST", "http://localhost"),
		Port:                   uint16(getEnvAsUint("PORT", 8080)),
		DBUser:                 getEnv("DB_USER", "postgres"),
		DBPassword:             getEnv("DB_PASSWORD", "postgres"),
		DBHost:                 getEnv("DB_HOST", "127.0.0.1"),
		DBPort:                 uint16(getEnvAsUint("DB_PORT", 5432)),
		DBName:                 getEnv("DB_NAME", "tasks-db"),
		JWTSecret:              getEnv("JWT_SECRET", "not-so-secret-now-is-it?"),
		JWTExpirationInSeconds: getEnvAsUint("JWT_EXPIRATION_IN_SECONDS", 3600*24*7),
	}

	config.ConnectionString = fmt.Sprintf("postgresql://%s:%s@%s:%d/%s?connect_timeout=10&application_name=task-manager",
		config.DBUser, config.DBPassword, config.DBHost, config.DBPort, config.DBName)

	return config
}

// Gets the env by key or fallbacks
func getEnv(key, fallback string) string {
	if value, ok := os.LookupEnv(key); ok {
		return value
	}

	return fallback
}

func getEnvAsUint(key string, fallback uint64) uint64 {
	if value, ok := os.LookupEnv(key); ok {
		i, err := strconv.ParseUint(value, 10, 64)
		if err != nil {
			return fallback
		}

		return i
	}

	return fallback
}
