#!/bin/bash
export DATABASE=locationtracking
export USER=postgres
export SCHEMA=geojson
export TABLE=rawdata
psql --command="create database ${DATABASE};"
psql -d ${DATABASE} --command="create schema ${SCHEMA};"
psql -d ${DATABASE} --command="CREATE EXTENSION postgis;           -- Enable PostGIS (includes raster)"
psql -d ${DATABASE} --command="CREATE EXTENSION postgis_topology;  -- Enable Topology"
