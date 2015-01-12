# KLRS Energy Parser

This set of tools will parse `.xls` files from the KLRS Energy Sensors into a set of JSON files. Each sensor will become a separate datastream named `datastream-<COLUMN NAME>.json`, with the records for that column in `datastream-<COLUMN NAME>-records.json`.

These files can then be imported using `node-dataservice` or another tool.

## Usage

Install Ruby, preferably Ruby 2.1.4 or newer. Next you can convert the data to JSON files:

    $ bin/convert data/gen_april.xls

This will create a set of JSON files in the current directory. One JSON file for each column (except TIMESTAMP column), and one JSON file for the records in each column.

The datastream JSON files can be fed into `node-dataservice`:

    $ cd node-dataservice
    $ bin/data-service create datastream <userUID> <sensorUID> < ~/.../datastream-COLUMN.json

## License

All rights reserved, GeoSensorWeb Lab.
