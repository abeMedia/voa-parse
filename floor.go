package main

import (
    "strconv"
)

const RoomID = "02"

type Room struct {
    PropertyID  int64     `db:"property_id"`
    Ref         int64     `db:"ref"`
    Floor       string    `db:"floor"`
    Description string    `db:"description"`
    Area        float64   `db:"area"`
    GBPPerM2    float64   `db:"gbp_per_m2"`
    Value       string     `db:"value"`
}

func NewRoom(id int64, v []string) (r Room) {
    r.PropertyID = id
    r.Ref, _ = strconv.ParseInt(v[0], 10, 64)
    r.Floor = v[1]
    r.Description = v[2]
    r.Area, _ = strconv.ParseFloat(v[3], 64)
    r.GBPPerM2, _ = strconv.ParseFloat(v[4], 64)
    r.Value = v[5]

    return r
}