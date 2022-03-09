// VEHICLE CONFIGS
// A CONFIG THAT INHERITS FROM ANOTHER CONFIG MUST BE ADDED AFTER, NOT BEFORE, THE CONFIG IT INHERITS FROM
/* EXAMPLE CONFIG

tow_vehicleConfigs set	[toLower "gm_ge_army_fuchsa0_engineer", // Classname of vehicle (string)
						(createHashmapFromArray [
							["effectiveTowMass",5000], // The mass this vehicle can tow with good effect in Arma. Vehicles over this mass will be set to this mass (number)
							["limitTowMass",18000], // Hard limit tow mass. Vehicles over this mass can't be towed by this vehicle at all (number)
							["towHook",[-0.08,-3.3,-1.8]], // Relative offset of rear tow hook position, used when this is the towing vehicle (array of numbers)
							["towPointFront1",[1,2.9,-1.75]], // Relative offset of a front tow point, used when this is the towed vehicle (array of numbers)
							["towPointFront2",[-1.11,2.9,-1.75]], // Other front tow point, e.g. left and right (array of numbers)
							["towPointRear1",[-0.8,-3.4,-1.8]], // Rear tow point (array of numbers)
							["towPointRear2",[0.65,-3.4,-1.8]], // Rear tow point (array of numbers)
							["typeLockOverride",false] // If true, vehicles of this type will be locked during setup and won't be unlocked after towing. (boolean)
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "gm_ge_army_fuchsa0_engineer") // Inherited configs: classes specified below will inherit from the class specified here.
					];
} forEach [	"gm_ge_army_fuchsa0_reconnaissance",
			"gm_ge_army_fuchsa0_reconnaissance_des"];


*/
tow_vehicleConfigs = createHashmap;

tow_vehicleConfigs set 	[toLower "default",
						(createHashmapFromArray [
							["effectiveTowMass",3000],
							["limitTowMass",5000],
							["towHook",[-0.08,-1,-1.8]],
							["towPointFront1",[0,1,-2]],
							["towPointFront2",[0,1,-2]],
							["towPointRear1",[0,-1,-2]],
							["towPointRear2",[0,-1,-2]],
							["typeLockOverride",false]
						])
					];

tow_vehicleConfigs set 	[toLower "gm_ge_army_fuchsa0_engineer",
						(createHashmapFromArray [
							["effectiveTowMass",5000],
							["limitTowMass",18000],
							["towHook",[-0.08,-3.3,-1.8]],
							["towPointFront1",[1,2.9,-1.75]],
							["towPointFront2",[-1.11,2.9,-1.75]],
							["towPointRear1",[-0.8,-3.4,-1.8]],
							["towPointRear2",[0.65,-3.4,-1.8]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "gm_ge_army_fuchsa0_engineer")
					];
} forEach [	"gm_ge_army_fuchsa0_engineer_des",
			"gm_ge_army_fuchsa0_engineer_oli",
			"gm_ge_army_fuchsa0_engineer_ols",
			"gm_ge_army_fuchsa0_engineer_un",
			"gm_ge_army_fuchsa0_engineer_trp",
			"gm_ge_army_fuchsa0_engineer_win",
			"gm_ge_army_fuchsa0_engineer_olw",
			"gm_ge_army_fuchsa0_engineer_wdl",
			"gm_ge_army_fuchsa0_engineer_wiw"];
			
tow_vehicleConfigs set 	[toLower "C_Offroad_01_F",
						(createHashmapFromArray [
							["effectiveTowMass",1500],
							["limitTowMass",2000],
							["towHook",[0,-2.8,-1]],
							["towPointFront1",[0.5,2.45,-1]],
							["towPointFront2",[-0.5,2.45,-1]],
							["towPointRear1",[0.5,-2.8,-1]],
							["towPointRear2",[-0.5,-2.8,-1]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "C_Offroad_01_F")
					];
} forEach [	"C_IDAP_Offroad_01_F",
			"I_E_Offroad_01_F",
			"I_G_Offroad_01_F",
			"B_G_Offroad_01_F",
			"O_G_Offroad_01_F",
			"C_Offroad_01_repair_F",
			"C_Offroad_01_covered_F",
			"C_Offroad_01_comms_F",
			"I_E_Offroad_01_covered_F",
			"I_E_Offroad_01_comms_F",
			"B_GEN_Offroad_01_F",
			"B_GEN_Offroad_01_covered_F",
			"B_GEN_Offroad_01_comms_F",
			"I_G_Offroad_01_repair_F",
			"B_G_Offroad_01_repair_F",
			"O_G_Offroad_01_repair_F",
			"I_G_Offroad_01_AT_F",
			"B_G_Offroad_01_AT_F",
			"O_G_Offroad_01_AT_F"];
			
tow_vehicleConfigs set 	[toLower "C_Offroad_02_unarmed_F",
						(createHashmapFromArray [
							["effectiveTowMass",1500],
							["limitTowMass",2000],
							["towHook",[0,-1.6,-0.8]],
							["towPointFront1",[0.4,2.1,-0.8]],
							["towPointFront2",[-0.4,2.1,-0.8]],
							["towPointRear1",[0.4,-1.6,-0.8]],
							["towPointRear2",[-0.4,-1.6,-0.8]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "C_Offroad_02_unarmed_F")
					];
} forEach [	"I_C_Offroad_02_unarmed_F",
			"I_C_Offroad_02_AT_F",
			"C_IDAP_Offroad_02_unarmed_F"];
			
tow_vehicleConfigs set 	[toLower "I_C_Offroad_02_LMG_F",
						(createHashmapFromArray [
							["effectiveTowMass",1500],
							["limitTowMass",2000],
							["towHook",[0,-1.6,-1.6]],
							["towPointFront1",[0.4,2.1,-1.6]],
							["towPointFront2",[-0.4,2.1,-1.6]],
							["towPointRear1",[0.4,-1.6,-1.6]],
							["towPointRear2",[-0.4,-1.6,-1.6]],
							["typeLockOverride",false]
						])
					];

tow_vehicleConfigs set 	[toLower "C_Van_02_transport_F",
						(createHashmapFromArray [
							["effectiveTowMass",3500],
							["limitTowMass",5000],
							["towHook",[0,-2.9,-1.1]],
							["towPointFront1",[0.5,3.9,-1.25]],
							["towPointFront2",[-0.5,3.9,-1.25]],
							["towPointRear1",[0.5,-2.9,-1.1]],
							["towPointRear2",[-0.5,-2.9,-1.1]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "C_Van_02_transport_F")
					];
} forEach [	"C_IDAP_Van_02_transport_F",
			"I_C_Van_02_transport_F",
			"I_E_Van_02_transport_F",
			"I_G_Van_02_transport_F",
			"B_G_Van_02_transport_F",
			"O_G_Van_02_transport_F",
			"B_GEN_Van_02_transport_F",
			"C_Van_02_vehicle_F",
			"C_IDAP_Van_02_vehicle_F",
			"I_C_Van_02_vehicle_F",
			"I_E_Van_02_vehicle_F",
			"I_G_Van_02_vehicle_F",
			"B_G_Van_02_vehicle_F",
			"O_G_Van_02_vehicle_F",
			"B_GEN_Van_02_vehicle_F",
			"C_IDAP_Van_02_medevac_F",
			"C_Van_02_medevac_F",
			"I_E_Van_02_medevac_F",
			"C_Van_02_service_F",
			"C_IDAP_Van_02_service_F",
			"I_E_Van_02_transport_MP_F"];

tow_vehicleConfigs set 	[toLower "I_G_Offroad_01_armed_F",
						(createHashmapFromArray [
							["effectiveTowMass",1500],
							["limitTowMass",2000],
							["towHook",[0,-2.8,-1.7]],
							["towPointFront1",[0.5,2.45,-1.7]],
							["towPointFront2",[-0.5,2.45,-1.7]],
							["towPointRear1",[0.5,-2.8,-1.7]],
							["towPointRear2",[-0.5,-2.8,-1.7]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "I_G_Offroad_01_armed_F")
					];
} forEach [	"B_G_Offroad_01_armed_F",
			"O_G_Offroad_01_armed_F"];
			
tow_vehicleConfigs set 	[toLower "B_MRAP_01_F",
						(createHashmapFromArray [
							["effectiveTowMass",4000],
							["limitTowMass",8500],
							["towHook",[0,-4.3,-1]],
							["towPointFront1",[0.49,1.6,-1.3]],
							["towPointFront2",[-0.49,1.6,-1.3]],
							["towPointRear1",[0.4,-4.3,-1.25]],
							["towPointRear2",[-0.4,-4.3,-1.25]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "B_MRAP_01_F")
					];
} forEach [	"B_T_MRAP_01_F"];

tow_vehicleConfigs set 	[toLower "B_MRAP_01_hmg_F",
						(createHashmapFromArray [
							["effectiveTowMass",4000],
							["limitTowMass",8500],
							["towHook",[0,-4.3,-1.6]],
							["towPointFront1",[0.49,1.6,-1.9]],
							["towPointFront2",[-0.49,1.6,-1.9]],
							["towPointRear1",[0.4,-4.3,-1.85]],
							["towPointRear2",[-0.4,-4.3,-1.85]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "B_MRAP_01_hmg_F")
					];
} forEach [	"B_T_MRAP_01_hmg_F",
			"B_T_MRAP_01_gmg_F",
			"B_MRAP_01_gmg_F"];
			
tow_vehicleConfigs set 	[toLower "gm_ge_army_fuchsa0_reconnaissance",
						(createHashmapFromArray [
							["effectiveTowMass",5000],
							["limitTowMass",18000],
							["towHook",[-0.08,-3.4,-1.8]],
							["towPointFront1",[1,2.8,-1.75]],
							["towPointFront2",[-1.11,2.8,-1.75]],
							["towPointRear1",[-0.8,-3.3,-1.8]],
							["towPointRear2",[0.65,-3.3,-1.8]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "gm_ge_army_fuchsa0_reconnaissance")
					];
} forEach [	"gm_ge_army_fuchsa0_reconnaissance_des",
			"gm_ge_army_fuchsa0_reconnaissance_oli",
			"gm_ge_army_fuchsa0_reconnaissance_ols",
			"gm_ge_army_fuchsa0_reconnaissance_un",
			"gm_ge_army_fuchsa0_reconnaissance_trp",
			"gm_ge_army_fuchsa0_reconnaissance_win",
			"gm_ge_army_fuchsa0_reconnaissance_olw",
			"gm_ge_army_fuchsa0_reconnaissance_wdl",
			"gm_ge_army_fuchsa0_reconnaissance_wiw"];
			
tow_vehicleConfigs set 	[toLower "gm_ge_army_fuchsa0_command",
						(createHashmapFromArray [
							["effectiveTowMass",5000],
							["limitTowMass",18000],
							["towHook",[-0.3,-3.4,-1.8]],
							["towPointFront1",[0.8,2.85,-1.75]],
							["towPointFront2",[-1.35,2.85,-1.75]],
							["towPointRear1",[-1,-3.45,-1.8]],
							["towPointRear2",[0.45,-3.45,-1.8]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "gm_ge_army_fuchsa0_command")
					];
} forEach [	"gm_ge_army_fuchsa0_command_des",
			"gm_ge_army_fuchsa0_command_oli",
			"gm_ge_army_fuchsa0_command_ols",
			"gm_ge_army_fuchsa0_command_un",
			"gm_ge_army_fuchsa0_command_trp",
			"gm_ge_army_fuchsa0_command_win",
			"gm_ge_army_fuchsa0_command_olw",
			"gm_ge_army_fuchsa0_command_wdl",
			"gm_ge_army_fuchsa0_command_wiw"];

tow_vehicleConfigs set 	[toLower "gm_ge_army_bpz2a0",
						(createHashmapFromArray [
							["effectiveTowMass",10000],
							["limitTowMass",60000],
							["towHook",[0.4,-3.2,-1.8]],
							["towPointFront1",[1.4,3.4,-1.6]],
							["towPointFront2",[-0.6,3.4,-1.6]],
							["towPointRear1",[-0.6,-3.2,-1.9]],
							["towPointRear2",[1.4,-3.2,-1.9]],
							["typeLockOverride",false]
						])
					];

tow_vehicleConfigs set 	[toLower "US85_M1IP",
						(createHashmapFromArray [
							["effectiveTowMass",10000],
							["limitTowMass",20000],
							["towHook",[]],
							["towPointFront1",[0.95,2.6,-1.9]],
							["towPointFront2",[-0.9,2.6,-1.9]],
							["towPointRear1",[1.05,-4.65,-1.55]],
							["towPointRear2",[-1,-4.65,-1.55]],
							["typeLockOverride",false]
						])
					];
	
tow_vehicleConfigs set 	[toLower "US85_M923c",
						(createHashmapFromArray [
							["effectiveTowMass",5000],
							["limitTowMass",10000],
							["towHook",[0,-3.3,-1.2]],
							["towPointFront1",[-0.4,4.4,-0.8]],
							["towPointFront2",[0.42,4.4,-0.8]],
							["towPointRear1",[0,-3.3,-1.2]],
							["towPointRear2",[0,-3.3,-1.2]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "US85_M923c")
					];
} forEach [	"US85_M923o",
			"US85_M923f"];
	
tow_vehicleConfigs set 	[toLower "US85_M923a",
						(createHashmapFromArray [
							["effectiveTowMass",5000],
							["limitTowMass",10000],
							["towHook",[-0.5,-3.3,-1.2]],
							["towPointFront1",[-0.1,4.4,-0.8]],
							["towPointFront2",[-0.95,4.4,-0.8]],
							["towPointRear1",[-0.5,-3.3,-1.2]],
							["towPointRear2",[-0.5,-3.3,-1.2]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "US85_M923a")
					];
} forEach [	"US85_M923r"];

tow_vehicleConfigs set 	[toLower "gm_gc_army_btr60pa",
						(createHashmapFromArray [
							["effectiveTowMass",3900],
							["limitTowMass",12000],
							["towHook",[0,-2.5,-1]],
							["towPointFront1",[-0.58,3.1,-2.1]],
							["towPointFront2",[0.58,3.1,-2.1]],
							["towPointRear1",[0,-2.5,-1]],
							["towPointRear2",[0,-2.5,-1]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "gm_gc_army_btr60pa")
					];
} forEach [	"gm_gc_army_btr60pa_oli",
			"gm_gc_army_btr60pa_ols",
			"gm_gc_army_btr60pa_olw",
			"gm_gc_army_btr60pa_un",
			"gm_gc_army_btr60pa_wdl",
			"gm_gc_army_btr60pa_win"];
			
tow_vehicleConfigs set 	[toLower "gm_gc_army_btr60pb",
						(createHashmapFromArray [
							["effectiveTowMass",3900],
							["limitTowMass",12000],
							["towHook",[0,-2.5,-0.7]],
							["towPointFront1",[-0.58,3.1,-1.9]],
							["towPointFront2",[0.58,3.1,-1.9]],
							["towPointRear1",[0,-2.5,-0.7]],
							["towPointRear2",[0,-2.5,-0.7]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "gm_gc_army_btr60pb")
					];
} forEach [	"gm_gc_army_btr60pb_oli",
			"gm_gc_army_btr60pb_ols",
			"gm_gc_army_btr60pb_olw",
			"gm_gc_army_btr60pb_un",
			"gm_gc_army_btr60pb_wdl",
			"gm_gc_army_btr60pb_win",
			"gm_gc_army_btr60pu12",
			"gm_gc_army_btr60pu12_oli",
			"gm_gc_army_btr60pu12_ols",
			"gm_gc_army_btr60pu12_olw",
			"gm_gc_army_btr60pu12_un",
			"gm_gc_army_btr60pu12_wdl",
			"gm_gc_army_btr60pu12_win"];
	
tow_vehicleConfigs set [toLower "gm_gc_army_ural4320_cargo",
						(createHashmapFromArray [
							["effectiveTowMass",5000],
							["limitTowMass",14000],
							["towHook",[0,-3.5,-1.3]],
							["towPointFront1",[0.4,3.7,-0.95]],
							["towPointFront2",[-0.4,3.7,-0.95]],
							["towPointRear1",[0,-3.5,-1.3]],
							["towPointRear2",[0,-3.5,-1.3]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "gm_gc_army_ural4320_cargo")
					];
} forEach [	"gm_gc_army_ural4320_cargo_oli",
			"gm_gc_army_ural4320_cargo_ols",
			"gm_gc_army_ural4320_cargo_olw",
			"gm_gc_army_ural4320_cargo_un",
			"gm_gc_army_ural4320_cargo_wdl",
			"gm_gc_army_ural4320_cargo_win",
			"gm_gc_army_ural4320_reammo",
			"gm_gc_army_ural4320_reammo_oli",
			"gm_gc_army_ural4320_reammo_ols",
			"gm_gc_army_ural4320_reammo_olw",
			"gm_gc_army_ural4320_reammo_un",
			"gm_gc_army_ural4320_reammo_wdl",
			"gm_gc_army_ural4320_reammo_win",
			"gm_pl_army_ural4320_reammo",
			"gm_pl_army_ural4320_reammo_oli",
			"gm_pl_army_ural4320_reammo_ols",
			"gm_pl_army_ural4320_reammo_olw",
			"gm_pl_army_ural4320_repair",
			"gm_pl_army_ural4320_repair_oli",
			"gm_pl_army_ural4320_repair_ols",
			"gm_pl_army_ural4320_repair_olw",
			"gm_pl_army_ural4320_cargo",
			"gm_pl_army_ural4320_cargo_oli",
			"gm_pl_army_ural4320_cargo_ols",
			"gm_pl_army_ural4320_cargo_olw",
			"gm_pl_army_ural375d_medic",
			"gm_pl_army_ural375d_medic_oli",
			"gm_pl_army_ural375d_medic_ols",
			"gm_pl_army_ural375d_medic_olw",
			"gm_pl_army_ural375d_mlrs",
			"gm_pl_army_ural375d_mlrs_oli",
			"gm_pl_army_ural375d_mlrs_ols",
			"gm_pl_army_ural375d_mlrs_olw",
			"gm_pl_army_ural375d_refuel",
			"gm_pl_army_ural375d_refuel_oli",
			"gm_pl_army_ural375d_refuel_ols",
			"gm_pl_army_ural375d_refuel_olw",
			"gm_gc_army_ural4320_repair",
			"gm_gc_army_ural4320_repair_oli",
			"gm_gc_army_ural4320_repair_ols",
			"gm_gc_army_ural4320_repair_olw",
			"gm_gc_army_ural4320_repair_un",
			"gm_gc_army_ural4320_repair_wdl",
			"gm_gc_army_ural4320_repair_win",
			"gm_gc_army_ural375d_cargo",
			"gm_gc_army_ural375d_cargo_oli",
			"gm_gc_army_ural375d_cargo_ols",
			"gm_gc_army_ural375d_cargo_olw",
			"gm_gc_army_ural375d_cargo_un",
			"gm_gc_army_ural375d_cargo_wdl",
			"gm_gc_army_ural375d_cargo_win",
			"gm_gc_army_ural375d_medic",
			"gm_gc_army_ural375d_medic_oli",
			"gm_gc_army_ural375d_medic_ols",
			"gm_gc_army_ural375d_medic_olw",
			"gm_gc_army_ural375d_medic_un",
			"gm_gc_army_ural375d_medic_wdl",
			"gm_gc_army_ural375d_medic_win",
			"gm_gc_army_ural375d_refuel",
			"gm_gc_army_ural375d_refuel_oli",
			"gm_gc_army_ural375d_refuel_ols",
			"gm_gc_army_ural375d_refuel_olw",
			"gm_gc_army_ural375d_refuel_un",
			"gm_gc_army_ural375d_refuel_wdl",
			"gm_gc_army_ural375d_refuel_win",
			"gm_gc_army_ural375d_mlrs",
			"gm_gc_army_ural375d_mlrs_oli",
			"gm_gc_army_ural375d_mlrs_ols",
			"gm_gc_army_ural375d_mlrs_olw",
			"gm_gc_army_ural375d_mlrs_un",
			"gm_gc_army_ural375d_mlrs_wdl",
			"gm_gc_army_ural375d_mlrs_win"];

tow_vehicleConfigs set [toLower "gm_gc_army_ural44202",
						(createHashmapFromArray [
							["effectiveTowMass",5000],
							["limitTowMass",14000],
							["towHook",[0,-1.3,-0.8]],
							["towPointFront1",[0.4,3.7,-0.95]],
							["towPointFront2",[-0.4,3.7,-0.95]],
							["towPointRear1",[0,-1.3,-0.8]],
							["towPointRear2",[0,-1.3,-0.8]],
							["typeLockOverride",false]
						])
					];

tow_vehicleConfigs set [toLower "US85_M1043_M60",
						(createHashmapFromArray [
							["effectiveTowMass",1000],
							["limitTowMass",3000],
							["towHook",[0,-1.8,-1.8]],
							["towPointFront1",[0.45,2.9,-1.8]],
							["towPointFront2",[-0.45,2.9,-1.8]],
							["towPointRear1",[0.45,-1.76,-1.8]],
							["towPointRear2",[-0.45,-1.76,-1.8]],
							["typeLockOverride",false]
						])
					],
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "US85_M1043_M60")
					];
} forEach [	"US85_M1043_ua",
			"US85_M1025_ua",
			"US85_M1025_M60"];

tow_vehicleConfigs set [toLower "US85_M1008",
						(createHashmapFromArray [
							["effectiveTowMass",1000],
							["limitTowMass",3000],
							["towHook",[0,-2.55,-1]],
							["towPointFront1",[0.45,3.05,-1.05]],
							["towPointFront2",[-0.42,3.05,-1.05]],
							["towPointRear1",[0.44,-2.55,-1.05]],
							["towPointRear2",[-0.41,-2.55,-1.05]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "US85_M1008")
					];
} forEach [	"US85_M1008c",
			"US85_M1008_S250"];

tow_vehicleConfigs set [toLower "gm_ge_army_m113a1g_apc",
						(createHashmapFromArray [
							["effectiveTowMass",4000],
							["limitTowMass",12000],
							["towHook",[0,-1.5,-2.1]],
							["towPointFront1",[-0.55,2.8,-1.9]],
							["towPointFront2",[0.65,2.8,-1.9]],
							["towPointRear1",[0.7,-1.75,-2]],
							["towPointRear2",[-0.6,-1.75,-2]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "gm_ge_army_m113a1g_apc")
					];
} forEach [	"gm_ge_army_m113a1g_apc_des",
			"gm_ge_army_m113a1g_apc_oli",
			"gm_ge_army_m113a1g_apc_ols",
			"gm_ge_army_m113a1g_apc_un",
			"gm_ge_army_m113a1g_apc_trp",
			"gm_ge_army_m113a1g_apc_win",
			"gm_ge_army_m113a1g_apc_olw",
			"gm_ge_army_m113a1g_apc_wdl",
			"gm_ge_army_m113a1g_apc_wiw",
			"gm_ge_army_m113a1g_apc_milan",
			"gm_ge_army_m113a1g_apc_milan_des",
			"gm_ge_army_m113a1g_apc_milan_oli",
			"gm_ge_army_m113a1g_apc_milan_ols",
			"gm_ge_army_m113a1g_apc_milan_un",
			"gm_ge_army_m113a1g_apc_milan_trp",
			"gm_ge_army_m113a1g_apc_milan_win",
			"gm_ge_army_m113a1g_apc_milan_olw",
			"gm_ge_army_m113a1g_apc_milan_wdl",
			"gm_ge_army_m113a1g_apc_milan_wiw",
			"gm_ge_army_m113a1g_apc_command",
			"gm_ge_army_m113a1g_apc_command_des",
			"gm_ge_army_m113a1g_apc_command_oli",
			"gm_ge_army_m113a1g_apc_command_ols",
			"gm_ge_army_m113a1g_apc_command_un",
			"gm_ge_army_m113a1g_apc_command_trp",
			"gm_ge_army_m113a1g_apc_command_win",
			"gm_ge_army_m113a1g_apc_command_olw",
			"gm_ge_army_m113a1g_apc_command_wdl",
			"gm_ge_army_m113a1g_apc_command_wiw",
			"gm_ge_army_m113a1g_apc_medic",
			"gm_ge_army_m113a1g_apc_medic_des_rc",
			"gm_ge_army_m113a1g_apc_medic_oli_rc",
			"gm_ge_army_m113a1g_apc_medic_ols_rc",
			"gm_ge_army_m113a1g_apc_medic_un_rc",
			"gm_ge_army_m113a1g_apc_medic_trp_rc",
			"gm_ge_army_m113a1g_apc_medic_win_rc",
			"gm_ge_army_m113a1g_apc_medic_olw_rc",
			"gm_ge_army_m113a1g_apc_medic_wdl_rc",
			"gm_ge_army_m113a1g_apc_medic_wiw_rc",
			"gm_dk_army_m113a1dk_apc",
			"gm_dk_army_m113a1dk_apc_des",
			"gm_dk_army_m113a1dk_apc_tan",
			"gm_dk_army_m113a1dk_apc_un",
			"gm_dk_army_m113a1dk_apc_wdl",
			"gm_dk_army_m113a1dk_apc_win",
			"gm_dk_army_m113a1dk_command",
			"gm_dk_army_m113a1dk_command_des",
			"gm_dk_army_m113a1dk_command_tan",
			"gm_dk_army_m113a1dk_command_un",
			"gm_dk_army_m113a1dk_command_wdl",
			"gm_dk_army_m113a1dk_command_win",
			"gm_dk_army_m113a1dk_engineer",
			"gm_dk_army_m113a1dk_engineer_des",
			"gm_dk_army_m113a1dk_engineer_tan",
			"gm_dk_army_m113a1dk_engineer_un",
			"gm_dk_army_m113a1dk_engineer_wdl",
			"gm_dk_army_m113a1dk_engineer_win",
			"gm_dk_army_m113a1dk_medic",
			"gm_dk_army_m113a1dk_medic_des_rc",
			"gm_dk_army_m113a1dk_medic_tan_rc",
			"gm_dk_army_m113a1dk_medic_un_rc",
			"gm_dk_army_m113a1dk_medic_wdl_rc",
			"gm_dk_army_m113a1dk_medic_win_rc",
			"gm_dk_army_m113a2dk_apc",
			"gm_dk_army_m113a2dk_apc_des",
			"gm_dk_army_m113a2dk_apc_tan",
			"gm_dk_army_m113a2dk_apc_un",
			"gm_dk_army_m113a2dk_apc_wdl",
			"gm_dk_army_m113a2dk_apc_win"
			];
			
tow_vehicleConfigs set [toLower "gm_gc_army_brdm2",
						(createHashmapFromArray [
							["effectiveTowMass",4000],
							["limitTowMass",7500],
							["towHook",[-0.05,-2.7,-1.8]],
							["towPointFront1",[-0.58,2.01,-1.75]],
							["towPointFront2",[0.47,2.01,-1.75]],
							["towPointRear1",[0.48,-2.9,-1.57]],
							["towPointRear2",[-0.65,-2.9,-1.57]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "gm_gc_army_brdm2")
					];
} forEach [	"gm_gc_army_brdm2_win",
			"gm_gc_army_brdm2_oli",
			"gm_gc_army_brdm2_ols",
			"gm_gc_army_brdm2_olw",
			"gm_gc_army_brdm2_un",
			"gm_gc_army_brdm2_wdl",
			"gm_pl_army_brdm2",
			"gm_pl_army_brdm2_oli",
			"gm_pl_army_brdm2_ols",
			"gm_pl_army_brdm2_win",
			"gm_pl_army_brdm2_olw",
			"gm_pl_army_brdm2_inv"];

tow_vehicleConfigs set 	[toLower "gm_ge_civ_typ1200",
						(createHashmapFromArray [
							["effectiveTowMass",900],
							["limitTowMass",1300],
							["towHook",[0,-1.6,-1]],
							["towPointFront1",[0.4,1.8,-1]],
							["towPointFront2",[-0.4,1.8,-1]],
							["towPointRear1",[0.4,-1.6,-1]],
							["towPointRear2",[-0.4,-1.6,-1]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "gm_ge_civ_typ1200")
					];
} forEach [	"gm_ge_dbp_typ1200",
			"gm_ge_ff_typ1200",
			"gm_ge_pol_typ1200",
			"gm_dk_army_typ1200_cargo",
			"gm_dk_army_typ1200_cargo_oli",
			"gm_dk_army_typ1200_cargo_ols",
			"gm_dk_army_typ1200_cargo_olw",
			"gm_ge_army_typ1200_cargo",
			"gm_ge_army_typ1200_cargo_oli",
			"gm_ge_army_typ1200_cargo_oli_rc",
			"gm_ge_army_typ1200_cargo_ols",
			"gm_ge_army_typ1200_cargo_ols_rc",
			"gm_ge_army_typ1200_cargo_olw",
			"gm_ge_army_typ1200_cargo_olw_rc"];

tow_vehicleConfigs set 	[toLower "gm_gc_civ_p601",
						(createHashmapFromArray [
							["effectiveTowMass",600],
							["limitTowMass",650],
							["towHook",[0.1,-1.5,-1.1]],
							["towPointFront1",[0.4,1.65,-1.2]],
							["towPointFront2",[-0.55,1.65,-1.2]],
							["towPointRear1",[-0.55,-1.5,-1.2]],
							["towPointRear2",[0.4,-1.5,-1.2]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "gm_gc_civ_p601")
					];
} forEach [	"gm_gc_ff_p601",
			"gm_gc_pol_p601",
			"gm_gc_dp_p601",
			"gm_gc_army_p601",
			"gm_gc_army_p601_oli",
			"gm_gc_army_p601_mp",
			"gm_gc_bgs_p601",
			"gm_gc_bgs_p601_oli"];

// Mora
tow_vehicleConfigs set 	[toLower "I_APC_tracked_03_cannon_F",
						(createHashmapFromArray [
							["effectiveTowMass",36200],
							["limitTowMass",15000],
							["towHook",[0,-3.4,-1.9]],
							["towPointFront1",[0.8,2.8,-1.35]],
							["towPointFront2",[-0.8,2.8,-1.35]],
							["towPointRear1",[0.8,-3.5,-1.5]],
							["towPointRear2",[-0.8,-3.5,-1.5]],
							["typeLockOverride",false]
						])
					];
{tow_vehicleConfigs set [toLower _x,
						tow_vehicleConfigs get (toLower "I_APC_tracked_03_cannon_F")
					];
} forEach [	"I_E_APC_tracked_03_cannon_F"];
			
// TOWABLE VEHICLES & VEHICLES THAT CAN TOW
// These two arrays contain classnames of classes that should be towable, and should be able to tow, respectively. These arrays will be checked when the mission starts or when the JIP client joins.
// If you want to add a vehicle later you have to remoteExec njt_fnc_towableSetup or njt_fnc_canTowSetup on it.
// By default all vehicles with configured classes will be added.

_towableClassList = keys tow_vehicleConfigs;
_canTowClassList = keys tow_vehicleConfigs;

_towableVehiclesBeforeRemoves = vehicles select {(toLower typeOf _x) in _towableClassList};
_canTowVehiclesBeforeRemoves = vehicles select {(toLower typeOf _x) in _canTowClassList};

// Remove specific vehicles even if they are configured by type:
_towableVehicles = _towableVehiclesBeforeRemoves - [];
_canTowVehicles = _canTowVehiclesBeforeRemoves - [];

// These two arrays can contain specific vehicles that you want to add to each list, in addition to the classes. Specified vehicles will still use their class-type config defined above.
_towableVehicles append [];
_canTowVehicles append [];