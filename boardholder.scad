board_size = 160;
outer_lip_width = 5;
inner_lip_width = 5;
board_height = 5;
total_height = 30;

difference() {
    cube([board_size+2*outer_lip_width,
            board_size+2*outer_lip_width,
            total_height]);
    translate([outer_lip_width,outer_lip_width,total_height-board_height])
    cube([board_size,board_size,board_height]);
    translate([outer_lip_width+inner_lip_width, outer_lip_width+inner_lip_width,5])
    cube([board_size-2*inner_lip_width, board_size-2*inner_lip_width, total_height-board_height]);
    translate([outer_lip_width+board_size/2,0,total_height-board_height-5])
    cube([10,board_size+2*outer_lip_width,board_height+5]);
    translate([5,4,5])
    cube([62,162,30]);
}