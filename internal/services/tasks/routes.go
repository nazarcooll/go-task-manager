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

func (r *Handler) RegisterRoutes(mux *mux.Router) *mux.Route {
	v1Route := mux.PathPrefix("/v1").Subrouter()

	return v1Route.HandleFunc("/tasks", v1.TasksV1Handler)
}
