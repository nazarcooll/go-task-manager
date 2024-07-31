package v1

import (
	"fmt"
	"net/http"
)

func TasksV1Handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, r.Header.Values("Content-Type"))
}
