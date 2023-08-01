package main

import (
	"io"
	"log"
	"net/http"
	"os"
	"strings"
	"time"
)

func main() {
	addr := os.Getenv("WEBSERVER_ADDR")
	if addr == "" {
		addr = ":8000"
	}
	log.Println("Starting HTTP server at", addr)

	h := http.FileServer(http.Dir("/html"))
	h = methodMiddleware(h)
	h = logMiddleware(h)
	http.ListenAndServe(addr, h)
}

func methodMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Method != http.MethodGet {
			w.WriteHeader(http.StatusMethodNotAllowed)
			io.WriteString(w, "Method not allowed: "+r.Method)
		} else {
			next.ServeHTTP(w, r)
		}
	})
}

func logMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		start := time.Now()
		next.ServeHTTP(w, r)
		log.Printf("[http] Request from %s; latency=%s, method=%s, path=%q\n", getRealIP(r), time.Since(start), r.Method, r.URL.Path)
	})
}

func getRealIP(r *http.Request) string {
	xff := r.Header.Get("X-Forwarded-For")
	if xff != "" {
		before, _, ok := strings.Cut(xff, ", ")
		if ok {
			return before
		} else {
			return xff
		}
	}

	xrip := r.Header.Get("X-Real-IP")
	if xrip != "" {
		return xrip
	}

	return r.RemoteAddr
}
