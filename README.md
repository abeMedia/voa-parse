# VOA Data Parser

A command-line tool (written in go) for importing data from the Valuation Office Agency's `.dta` format into a MySQL database.

To use this tool you will need a data dump from the Valuation Office Agency (typically named something like `SMV_2010_MERGED.dta`).


## Usage

Download the latest executable for the OS of your choice, unzip it, then run the following command (replacing the parameters for your actual ones).

```shell
/path/to/voa-parse -f /path/to/SMV_2010_MERGED.dta -h localhost -P 3306 -u root -p mypassword
```

### Parameters

| Flag | Description | Default |
|------|-------------|---------|
| `-f` | The .dta file to parse | - |
| `-h` | The MySQL host | localhost |
| `-P` | The MySQL port | 3306 |
| `-u` | The MySQL username | root |
| `-p` | The MySQL password | - |
| `-d` | The MySQL database | voa |
| `-c` | Truncate tables before import | false |


## Known issues

There's a couple of fields I couldn't identify in the properties table (named `unkown1` & `unkown2`). If you happen to know what these are please feel free to do a pull request.


## Copyright

&copy; 2016 Adam Bouqdib - http://abemedia.co.uk
