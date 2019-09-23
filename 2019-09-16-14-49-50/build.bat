python "%SUMO_HOME%\tools\ptlines2flows.py" -n osm.net.xml -e 3600 -p 600 --random-begin --seed 42 --ptstops osm_stops.add.xml --ptlines osm_ptlines.xml -o osm_pt.rou.xml --ignore-errors --vtype-prefix pt_ --stopinfos-file stopinfos.xml --routes-file vehroutes.xml --trips-file trips.trips.xml --verbose
python "%SUMO_HOME%\tools\randomTrips.py" -n osm.net.xml --seed 42 --fringe-factor 1 -p 10.151717 -o osm.pedestrian.trips.xml -e 3600 -r osm.pedestrian.rou.xml --vehicle-class pedestrian --persontrips --prefix ped --trip-attributes "modes=\"public\"" --additional-files osm_stops.add.xml,osm_pt.rou.xml
python "%SUMO_HOME%\tools\randomTrips.py" -n osm.net.xml --seed 42 --fringe-factor 2 -p 20.010933 -o osm.bicycle.trips.xml -e 3600 --vehicle-class bicycle --vclass bicycle --prefix bike --fringe-start-attributes "departSpeed=\"max\"" --max-distance 8000 --trip-attributes "departLane=\"best\"" --validate
python "%SUMO_HOME%\tools\randomTrips.py" -n osm.net.xml --seed 42 --fringe-factor 2 -p 30.923100 -o osm.motorcycle.trips.xml -e 3600 --vehicle-class motorcycle --vclass motorcycle --prefix moto --fringe-start-attributes "departSpeed=\"max\"" --max-distance 1200 --trip-attributes "departLane=\"best\"" --validate
python "%SUMO_HOME%\tools\randomTrips.py" -n osm.net.xml --seed 42 --fringe-factor 5 -p 1.307700 -o osm.passenger.trips.xml -e 3600 --vehicle-class passenger --vclass passenger --prefix veh --min-distance 300 --trip-attributes "departLane=\"best\"" --fringe-start-attributes "departSpeed=\"max\"" --allow-fringe.min-length 1000 --lanes --validate
python "%SUMO_HOME%\tools\randomTrips.py" -n osm.net.xml --seed 42 --fringe-factor 5 -p 35.61550 -o osm.truck.trips.xml -e 3600 --vehicle-class truck --vclass truck --prefix truck --min-distance 600 --fringe-start-attributes "departSpeed=\"max\"" --trip-attributes "departLane=\"best\"" --validate
python "%SUMO_HOME%\tools\randomTrips.py" -n osm.net.xml --seed 42 --fringe-factor 40 -p 710.068631 -o osm.ship.trips.xml -e 3600 --vehicle-class ship --vclass ship --prefix ship --validate --fringe-start-attributes "departSpeed=\"max\""
python "%SUMO_HOME%\tools\randomTrips.py" -n osm.net.xml --seed 42 --fringe-factor 40 -p 1100.947838 -o osm.rail.trips.xml -e 3600 --vehicle-class rail --vclass rail --prefix rail --fringe-start-attributes "departSpeed=\"max\"" --min-distance 2400 --trip-attributes "departLane=\"best\"" --validate
