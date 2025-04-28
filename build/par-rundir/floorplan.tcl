create_floorplan -core_margins_by die -flip f -die_size_by_io_height max -site unithd -die_size { 500 500 0 0 0 0 }
# Floorplan automatically generated from HAMMER
# Floorplan manually specified from HAMMER
 create_fence -name guts/link_downstream -area  40 40 340 310 
 create_fence -name guts/link_upstream -area 300 250 450 450 
