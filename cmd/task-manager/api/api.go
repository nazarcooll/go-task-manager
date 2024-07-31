package api

import (
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/nazarcooll/task-manager/internal/services/tasks"
)

type APIServer struct {
	port uint16
}

func NewAPIServer(port uint16) *APIServer {
	return &APIServer{
		port: port,
	}
}

func (api *APIServer) Run() error {
	router := mux.NewRouter()
	subrouter := router.PathPrefix("/api").Subrouter()

	tasksHandler := tasks.NewHandler()
	tasksHandler.RegisterRoutes(subrouter)

	// Serve static files
	router.PathPrefix("/").Handler(http.FileServer(http.Dir("static")))

	return http.ListenAndServe(fmt.Sprintf(":%d", api.port), router)
}
