# njt_tow
Vehicle towing system for Arma 3



This system allows vehicles to tow others in a relatively graceful manner.



Before a vehicle can tow or be towed, it must have a config set up in njt_tow\tow_vehicleConfigs.sqf

There's a sample config with instructions in that file.



At the bottom of tow_vehicleConfigs.sqf is the stuff that determines which vehicles get tow setup on mission start. By default, this is all vehicles that have configs, but you can also make specific lists of classes and vehicles to include or exclude.



After the mission has started, you can add new vehicles (that have configs) like this:

```
[_vehicle] remoteExec ["njt_fnc_towableSetup",0,true];
[_vehicle] remoteExec ["njt_fnc_canTowSetup",0,true];
```

Note: this is for local execution. If you're doing global execution already, use `call` rather than `remoteExec`.

Defining new configs after the mission starts is not properly supported. You can probably figure out how to do it but if you don't know exactly what you're doing, I don't recommend it.
