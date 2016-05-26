
CREATE OR REPLACE FUNCTION pgr_xydtsp(
    matrix_row_sql TEXT,
    randomize BOOLEAN DEFAULT true,
    start_id BIGINT DEFAULT -1,
    end_id BIGINT DEFAULT -1,
    imax_processing_time FLOAT DEFAULT '+infinity'::FLOAT,
    initial_temperature FLOAT DEFAULT 100,
    final_temperature FLOAT DEFAULT 0.1,
    cooling_factor FLOAT DEFAULT 0.9,
    tries_per_temperature INTEGER DEFAULT 500,
    max_changes_per_temperature INTEGER DEFAULT 60,
    max_consecutive_non_changes INTEGER DEFAULT 200,

    OUT seq integer,
    OUT node integer,
    OUT cost FLOAT,
    OUT agg_cost FLOAT)
RETURNS SETOF record
AS '$libdir/${PGROUTING_LIBRARY_NAME}', 'xyd_tsp'
LANGUAGE c VOLATILE STRICT;
