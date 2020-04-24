# KLRS Energy Parser

This set of tools will parse `.xls` files from the KLRS Energy Sensors into a set of JSON files. Each sensor will become a separate datastream named `datastream-<COLUMN NAME>.json`, with the records for that column in `datastream-<COLUMN NAME>-records.json`.

These files can then be imported using `node-dataservice` or another tool.

## Usage

There are two tools in this repository, `verify` and `convert`. These cover the "Extract" and "Transform" steps of an ETL, and "Load" is handled by the [node-dataservice](https://github.com/GeoSensorWebLab/node-dataservice) tool.

## `verify`

![Verification tool diagram](docs/images/verify.png)

Install Ruby, preferably Ruby 2.1.4 or newer. Then use the `verify` tool to check the `.dat` file:

```
$ bin/verify data/gen_april.xls
```

This will validate the input file conforms to the expected schema before running the `convert` tool.

## `convert`

![Conversion tool diagram](docs/images/convert.png)

The `convert` tool will generate intermediary JSON files with the data and metadata to upload to the RPI Data Service:

```
$ bin/convert data/gen_april.xls
```

This will create a set of JSON files in the `output` directory. One JSON file for each column (except TIMESTAMP column), and one JSON file for the records in each column. Files are named after the hash digest of the column name, to prevent invalid file names from special characters.

![upload tool diagram](docs/images/node-dataservice.png)

The datastream JSON files can be fed into `node-dataservice`:

```
$ cd node-dataservice
$ bin/data-service create datastream <userUID> <sensorUID> < ~/.../datastream-COLUMN.json
```

And the command for loading observation records:

```
$ cd node-dataservice
$ bin/data-service create records <datastreamUID>  < ~/.../datastream-COLUMN-records.json
```

## License

MIT License

## Author

James Badger <jpbadger@ucalgary.ca>
