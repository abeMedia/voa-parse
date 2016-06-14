package main

import (
    "time"
    "strconv"
)

const (
    PropertyID = "01"
    dateFormat = `02-Jan-2006`
)

type Property struct {
    ID                    int64     `db:"id"`
    X1                    string    `db:"unknown1"`
    BillingAuthority      int64     `db:"billing_authority"`
    Owner                 string    `db:"owner"`
    BuildingNumber        int64     `db:"building_number"`
    BuildingUnit          string    `db:"building_unit"`
    BuildingName          string    `db:"building_name"`
    Location              string    `db:"location"`
    Street                string    `db:"street"`
    Suburb                string    `db:"suburb"`
    City                  string    `db:"city"`
    County                string    `db:"county"`
    Postcode              string    `db:"postcode"`
    Scheme                int64     `db:"scheme"`
    Description           string    `db:"description"`
    AreaTotal             float64   `db:"area_total"`
    ValueSubtotal         int64     `db:"value_subtotal"`
    ValueTotal            int64     `db:"value_total"`
    ValueRateable         int64     `db:"value_rateable"`
    RatingList            int64     `db:"rating_list"`
    BillingAuthorityName  string    `db:"billing_authority_name"`
    BillingAuthorityRef   string    `db:"ba_reference"`
    X2                    string    `db:"unknown2"`
    DateEffective         time.Time `db:"date_effective"`
    DateAltered           time.Time `db:"date_altered"`
    SCAT                  int64     `db:"scat"`
    BasisOfMeasurement    string    `db:"basis_of_measurement"`
    GBPPerM2              float64   `db:"gbp_per_m2"`
}

func NewProperty(v []string) (p Property) {
    p.ID, _ = strconv.ParseInt(v[0], 10, 64)
    p.X1 = v[1]
    p.BillingAuthority, _ = strconv.ParseInt(v[2], 10, 64)
    p.Owner = v[3]
    p.BuildingNumber, _ = strconv.ParseInt(v[4], 10, 64)
    p.BuildingUnit = v[5]
    p.BuildingName = v[6]
    p.Location = v[7]
    p.Street = v[8]
    p.Suburb = v[9]
    p.City = v[10]
    p.County = v[11]
    p.Postcode = v[12]
    p.Scheme, _ = strconv.ParseInt(v[13], 10, 64)
    p.Description = v[14]
    p.AreaTotal, _ = strconv.ParseFloat(v[15], 64)
    p.ValueSubtotal, _ = strconv.ParseInt(v[16], 10, 64)
    p.ValueTotal, _ = strconv.ParseInt(v[17], 10, 64)
    p.ValueRateable, _ = strconv.ParseInt(v[18], 10, 64)
    p.RatingList, _ = strconv.ParseInt(v[19], 10, 64)
    p.BillingAuthorityName = v[20]
    p.BillingAuthorityRef = v[21]
    p.X2 = v[22]
    p.DateEffective, _ = time.Parse(dateFormat, v[23])
    p.DateAltered, _ = time.Parse(dateFormat, v[24])
    p.SCAT, _ = strconv.ParseInt(v[25], 10, 64)
    p.BasisOfMeasurement = v[26]
    p.GBPPerM2, _ = strconv.ParseFloat(v[27], 64)

    return p
}