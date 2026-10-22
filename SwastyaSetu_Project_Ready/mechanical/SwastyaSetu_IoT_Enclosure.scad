
// Swastya Setu IoT Accident Detection Unit — Concept CAD
// Units: millimetres. Editable OpenSCAD source.
// IMPORTANT: Prototype concept only. Measure actual boards/battery before fabrication.
// Do not attach to, drill into, or wire through any airbag/SRS component or wiring.

$fn = 48;
part = "assembly"; // "tray", "lid", or "assembly"

// Overall proposed enclosure dimensions
L = 160;
W = 112;
H = 38;
wall = 3;
floor_t = 3;
lid_t = 3;
corner_r = 8;
lid_clearance = 0.35;

// Mounting ears
ear_w = 18;
ear_l = 22;
mount_hole_d = 5.2;
mount_offset = 10;

// Interior board standoff settings
standoff_d = 7;
standoff_h = 7;
standoff_hole_d = 2.6;

// Rounded rectangular prism using hull of cylinders
module rounded_box(x,y,z,r) {
    hull() {
        for (xx=[r,x-r], yy=[r,y-r])
            translate([xx,yy,0]) cylinder(h=z, r=r);
    }
}

module mount_ears() {
    for (xpos=[18,L-18], ypos=[-ear_l+5,W-ear_l+5]) {
        translate([xpos-9,ypos,0])
            difference() {
                cube([ear_w,ear_l,wall+1]);
                translate([ear_w/2,ear_l/2,-1])
                    cylinder(h=wall+3,d=mount_hole_d);
            }
    }
}

module tray() {
    difference() {
        union() {
            rounded_box(L,W,H,corner_r);
            mount_ears();
        }
        // Hollow cavity, leaving floor and side walls
        translate([wall,wall,floor_t])
            rounded_box(L-2*wall,W-2*wall,H-floor_t+1,corner_r-wall/2);
        // Lid screw holes at four corners
        for (x=[12,L-12], y=[12,W-12])
            translate([x,y,H-8])
                cylinder(h=10,d=3.2);
        // Cable/antenna ports on short sides; use grommets, not exposed sharp edges
        translate([-1, W*0.28, 18]) rotate([0,90,0]) cylinder(h=wall+2,d=8);
        translate([-1, W*0.72, 18]) rotate([0,90,0]) cylinder(h=wall+2,d=8);
        translate([L-wall-1, W*0.5, 18]) rotate([0,90,0]) cylinder(h=wall+2,d=10);
    }
    // PCB/battery standoffs (illustrative placement; verify actual board dimensions)
    for (p=[[20,20],[65,20],[20,52],[65,52],[100,20],[140,20],[100,55],[140,55]]) {
        translate([p[0],p[1],floor_t])
            difference() {
                cylinder(h=standoff_h,d=standoff_d);
                translate([0,0,-0.5]) cylinder(h=standoff_h+1,d=standoff_hole_d);
            }
    }
    // Divider rails to separate battery/power section from controller area
    translate([88,8,floor_t]) cube([2,W-16,8]);
}

module lid() {
    difference() {
        union() {
            rounded_box(L,W,lid_t,corner_r);
            // shallow inner locating lip
            translate([wall+lid_clearance,wall+lid_clearance,-4])
                difference() {
                    rounded_box(L-2*(wall+lid_clearance),W-2*(wall+lid_clearance),4,corner_r-wall/2);
                    translate([wall,wall,-0.5])
                        rounded_box(L-2*(wall+lid_clearance+wall),W-2*(wall+lid_clearance+wall),5,corner_r-wall);
                }
        }
        for (x=[12,L-12], y=[12,W-12])
            translate([x,y,-1]) cylinder(h=lid_t+2,d=3.6);
    }
}

if (part=="tray") tray();
else if (part=="lid") lid();
else {
    color("gainsboro") tray();
    translate([L+15,0,0]) color("white") lid();
}
