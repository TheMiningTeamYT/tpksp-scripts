// The goal of these changes is to ensure nothing can go wrong if the user gives invalid inputs.
parameter ascent_roll is 0.
if ascent_roll > 360 {
  print "Invalid ascent roll amount. Parameters are launch_to_orbit(ascent_roll, heading, target_apoapsis)."
}
parameter hdg is 90.
if hdg > 360 {
  print "Invalid heading. Parameters are launch_to_orbit(ascent_roll, heading, target_apoapsis)."
}
parameter target_apoapsis is body:atm:height + 10000.

run once "util/logging".

run launch.
run ascent(ascent_roll, hdg, target_apoapsis).
wait until altitude > body:atm:height.
run plan_circularize.
run execute_node.
