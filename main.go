package main

import (
    "bufio"
    "log"
    "os"
    "flag"
    "fmt"
    "time"
    "strings"
    "upper.io/db"
    "upper.io/db/mysql"
)

func main() {
    // get command-line flags
    path := flag.String("f", "", "path to .dta file")
    host := flag.String("h", "localhost", "database host")
    port := flag.String("P", "", "database port")
    user := flag.String("u", "root", "database user")
    pass := flag.String("p", "", "database password")
    name := flag.String("d", "voa", "database name")
    clean := flag.Bool("c", false, "truncate tables before import")
    flag.Parse()

    if *port != "" {
        *host += ":" + *port
    }

    // swag
    log.Println(`_  _ ____ ____    ___  ____ ____ ____ ____`)
    log.Println(`|  | |  | |__|    |__] |__| |__/ [__  |___`)
    log.Println(` \/  |__| |  |    |    |  | |  \ ___] |___`)
    log.Println(`------------------------------------------`)

    // open file
    file, err := os.Open(*path)
    if err != nil {
        log.Fatalf("Can't open file: %q\n", err)
    }
    defer file.Close()

    // connect to DB
    sess, err := db.Open(mysql.Adapter, mysql.ConnectionURL{
        Database: *name,
        Address:  db.ParseAddress(*host),
        User:     *user,
        Password: *pass,
    })
    if err != nil {
        log.Fatalf("Can't connect to DB: %q\n", err)
    }
    defer sess.Close()

    // connect to tables
    tableNames := map[string]string{
        "01": "properties",
        "02": "rooms",
        "03": "additional",
        "04": "plant",
        "05": "parking",
        "06": "adjustments",
        "07": "adjustments_total",
    }
    tables := make(map[string]db.Collection, 7)
    for id, table := range tableNames {
        tables[id], err = sess.Collection(table)
        if err != nil {
            log.Fatalf("Can't open table %s: %q\n", table, err)
        }
        if *clean {
            tables[id].Truncate()
        }
    }

    log.Print("Importing... Please be patient.")

    start := time.Now()
    var id, count, errors int64
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        values := strings.Split(scanner.Text(), "*")
        typeId, values := values[0], values[1:]

        var item interface{}
        switch typeId {
            case PropertyID:
                item = NewProperty(values)
                // set property ID for following rows
                id = item.(Property).ID
            case RoomID:
                item = NewRoom(id, values)
            case AdditonalID:
                item = NewAdditonal(id, values)
            case PlantID:
                item = NewPlant(id, values)
            case ParkingID:
                item = NewParking(id, values)
            case AdjustmentID:
                item = NewAdjustment(id, values)
            case TotalAdjustmentsID:
                item = NewTotalAdjustments(id, values)
            default:
                log.Printf("Unrecognised entry type: %s (%s)\n", typeId, values)
                errors++
        }

        if item != nil {
            if _, err = tables[typeId].Append(item); err != nil {
                log.Println(id, err)
                errors++
            } else {
                count++
            }
        }
    }

    if err := scanner.Err(); err != nil {
        log.Fatal(err)
    }
    finish := time.Now()
    log.Printf("Done! Imported %d rows in %s. %d errors encountered.", count, duration(finish.Sub(start)), errors)
}

func duration(d time.Duration) string {
    seconds := int(d.Seconds())
    minutes := int(d.Minutes())
    hours := int(d.Hours())
    days := hours/24

    if seconds < 60 {
        return formatDuration(seconds, "second")
    }
    if minutes < 60 {
        return formatDuration(minutes, "minute")
    }
    if hours < 24 {
        return fmt.Sprintf("%s and %s", formatDuration(hours, "hour"), formatDuration(minutes-(60*hours), "minute"))
    }
    return fmt.Sprintf("%s and %s", formatDuration(days, "day"), formatDuration(hours-(24*days), "hour"))
}

func formatDuration(d int, u string) string {
    if(d != 1) {
        u += "s"
    }
    return fmt.Sprintf("%d %s", d, u)
}