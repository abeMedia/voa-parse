package main

const AdjustmentID = "06"

type Adjustment struct {
    PropertyID  int64   `db:"property_id"`
    Description string  `db:"description"`
    Value       string  `db:"value"`
}

func NewAdjustment(id int64, v []string) (a Adjustment) {
    a.PropertyID = id
    a.Description = v[0]
    a.Value = v[1]

    return a
}