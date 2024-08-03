package tasks

import (
	"github.com/gorilla/mux"
	v1 "github.com/nazarcooll/task-manager/internal/services/tasks/v1"
)

type Handler struct {
}

func NewHandler() Handler {
	return Handler{}
}

func (r *Handler) RegisterRoutes(route *mux.Router) {
	route.HandleFunc("/tasks", v1.TasksV1Handler)
	route = route.PathPrefix("/v1").Subrouter()
	route.HandleFunc("/tasks", v1.TasksV1Handler)
}
