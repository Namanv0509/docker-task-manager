package models

  import (
      "time"
  )

  type Metric struct {
      ID           uint      `gorm:"primaryKey"`
      ContainerID  uint      `gorm:"not null"`
      CPUUsage     float64
      MemoryUsage  float64
      Timestamp    time.Time `gorm:"autoCreateTime"`
  }