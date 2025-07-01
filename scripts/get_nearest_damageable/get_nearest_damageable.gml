function get_nearest_damageable(xPosition, yPosition){
	var nearest = noone;
    var nearestDist = 100000;

    with (obj_damageable) {
        var d = point_distance(x, y, other.x, other.y);
        if (d < nearestDist) {
            nearest = id;
            nearestDist = d;
        }
    }

    return nearest;
}