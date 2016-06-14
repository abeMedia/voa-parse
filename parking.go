package main

import (
    "strconv"
)

const ParkingID = "05"

type Parking struct {
    PropertyID  int64   `db:"property_id"`
    Spaces      int64   `db:"spaces"`
    GBPPerUnit  float64 `db:"gbp_per_unit"`
    Area        float64 `db:"area"`
    GBPPerM2    float64 `db:"gbp_per_m2"`
    Value       string  `db:"value"`
}

func NewParking(id int64, v []string) (p Parking) {
    p.PropertyID = id
    p.Spaces, _ = strconv.ParseInt(v[0], 10, 64)
    p.GBPPerUnit, _ = strconv.ParseFloat(v[1], 64)
    p.Area, _ = strconv.ParseFloat(v[2], 64)
    p.GBPPerM2, _ = strconv.ParseFloat(v[3], 64)
    p.Value = v[4]

    return p
}