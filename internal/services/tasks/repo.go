package tasks

import "github.com/jackc/pgx/v5/pgxpool"

type TasksRepo struct {
	storage pgxpool.Pool
}

func tasks() {

}
