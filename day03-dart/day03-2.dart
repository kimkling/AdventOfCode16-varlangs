import 'dart:io';

main() async {  
    var input = await new File("input.txt").readAsString();
    List rows = buildList(input);
    int count = 0;
    for(int i = 0; i < rows.length; i+=3){
        List t1 = rows[i];
        List t2 = rows[i+1];
        List t3 = rows[i+2];
        for(int j = 0; j < t1.length; j++){
            if(t1[j] + t2[j] > t3[j] && t1[j] + t3[j] > t2[j] && t2[j] + t3[j] > t1[j]){
                count++;
            }
        }
    }
    print(count);
}

buildList (String s) {
    var rows = s.split("\n");
    List list = new List();
    for(int i = 0; i < rows.length; i++){
        var tempSides = rows[i].split("  ");
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