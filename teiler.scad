module schubladenteiler(width, depth, height, numh, numv, thickness){
    
    // we need to create exactly two types of things. the horizontal and vertical bars.
    // both can be generated with the same function
    // we just have to define the right amounts of slots
    
    // horizontal ones
    for(n = [0:numh-2]){
        translate([0, (height+5) * n, 0]) part(thickness, width, height, numh);
    }
    
    // vertical ones
    for(n = [0:numv-2]){
        translate([width + 5, (height+5) * n, 0]) part(thickness, depth, height, numv);
    }
}

// vertical bars
module part(thickness, width, height, slots){

    abst = width / slots;

    difference(){
        cube([width,height, thickness]);

        for(n = [1 : slots-1]){

            translate([(n * abst) - (thickness/2), height/2, -1]) cube([thickness, (height/2) + 1,thickness+2]);
        }
    }

}

// Breite der Lade: 200mm
// Tiefe der Lade: 150mm
// Höhe der Teiler: 50mm
// Anzahl in der Breite: 4
// Anzahl in der Tiefe: 3
// Material: 4mm

projection(cut = false) schubladenteiler(200,150,50,4,3,4);