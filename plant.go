package main

import (
    "strconv"
)

const PlantID = "04"

type Plant struct {
    PropertyID  int64   `db:"property_id"`
    Value       int64   `db:"value"`
}

func NewPlant(id int64, v []string) (p Plant) {
    p.PropertyID = id
    p.Value, _ = strconv.ParseInt(v[0], 10, 64)

    return p
}