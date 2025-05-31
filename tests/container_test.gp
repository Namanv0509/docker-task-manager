package tests

     import (
         "net/http"
         "net/http/httptest"
         "testing"
         "github.com/docker/docker/client"
         "github.com/gin-gonic/gin"
         "gorm.io/driver/sqlite"
         "gorm.io/gorm"
         "github.com/stretchr/testify/assert"
         "docker-task-manager/handlers"
         "docker-task-manager/models"
     )

     func TestListContainers(t *testing.T) {
         // Setup in-memory SQLite for testing
         db, err := gorm.Open(sqlite.Open(":memory:"), &gorm.Config{})
         assert.NoError(t, err)
         db.AutoMigrate(&models.Container{}, &models.Metric{})

         // Setup Docker client (mock or real, depending on environment)
         cli, err := client.NewClientWithOpts(client.FromEnv)
         assert.NoError(t, err)

         // Setup Gin router
         router := gin.Default()
         router.GET("/containers", handlers.ListContainersHandler(db, cli))

         // Create test request
         req, _ := http.NewRequest("GET", "/containers", nil)
         w := httptest.NewRecorder()
         router.ServeHTTP(w, req)

         // Assert response
         assert.Equal(t, http.StatusOK, w.Code)
     }