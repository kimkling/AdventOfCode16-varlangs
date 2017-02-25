import 'dart:io';

main() async {  
    var input = await new File("input.txt").readAsString();
    List triangles = buildList(input);
    int count = 0;
    for (var t in triangles){
        if(t[0] + t[1] > t[2] && t[0] + t[2] > t[1] && t[1] + t[2] > t[0]){
            count++;
        }
    }
    print(count);
}

buildList (String s) {
    var triangles = s.split("\n");
    List list = new List();
    for(int i = 0; i < triangles.length; i++){
        var tempSides = triangles[i].split("  ");
        List sides = new List();
        for(int j = 0; j < tempSides.length; j++){
            if(tempSides[j] != ""){
                sides.add(int.parse(tempSides[j]));
            }
        }
        list.add(sides);
    }
    return list;
}