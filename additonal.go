package main

import (
    "strconv"
)

const AdditonalID = "03"

type Additonal struct {
    PropertyID  int64   `db:"property_id"`
    Description string  `db:"description"`
    Area        float64 `db:"area"`
    GBPPerM2    float64 `db:"gbp_per_m2"`
    Value       string  `db:"value"`
}

func NewAdditonal(id int64, v []string) (a Additonal) {
    a.PropertyID = id
    a.Description = v[0]
    a.Area, _ = strconv.ParseFloat(v[1], 64)
    a.GBPPerM2, _ = strconv.ParseFloat(v[2], 64)
    a.Value = v[3]

    return a
}