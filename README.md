This repository contains GPS data tracked by an iPhone and a Playground to Playaround with the data as GeoJSON load it into a PostgresDB with PostgresKit.

Playground can be opened in Xcode and SPM should load the following as dependencies:
- PostgresKit
- GeoJSON

The folders GPX and GEOJSON contain the same tracks in different format. To transform the recorded gpx tracks to geojson a cli tool is used.
https://github.com/mapbox/togeojson
