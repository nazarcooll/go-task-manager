package main

import (
	"context"
	"log"

	"github.com/jackc/pgx/v5"
	"github.com/nazarcooll/task-manager/cmd/task-manager/api"
	"github.com/nazarcooll/task-manager/internal/configs"
)

func main() {

	conn, err := pgx.Connect(context.Background(), configs.Envs.ConnectionString)
	if err != nil {
		log.Fatalf("Unable to connect to database: %v\n", err)
	}

	log.Println(conn.Config())

	log.Printf("Server is listening on port %v", configs.Envs.Port)
	server := api.NewAPIServer(configs.Envs.Port)
	if err := server.Run(); err != nil {
		log.Fatalf("Unable to connect to database: %v\n", err)
	}
}
