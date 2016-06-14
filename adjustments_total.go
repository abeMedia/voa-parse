package main

const TotalAdjustmentsID = "07"

type TotalAdjustments struct {
    PropertyID        int64   `db:"property_id"`
    ValueSubtotal     string  `db:"value_before_adjustments"`
    AdjustmentsTotal  string  `db:"adjustments_total"`
}

func NewTotalAdjustments(id int64, v []string) (a TotalAdjustments) {
    a.PropertyID = id
    a.ValueSubtotal = v[0]
    a.AdjustmentsTotal = v[1]

    return a
}