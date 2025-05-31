package models

  import (
      "time"
  )

  type Container struct {
      ID          uint      `gorm:"primaryKey"`
      ContainerID string    `gorm:"unique;not null"`
      Name        string    `gorm:"not null"`
      Image       string
      Status      string
      CreatedAt   time.Time `gorm:"autoCreateTime"`
      Metrics     []Metric  `gorm:"foreignKey:ContainerID"`
  }