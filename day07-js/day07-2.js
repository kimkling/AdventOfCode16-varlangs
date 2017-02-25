var fs = require("fs");
fs.readFile(__dirname + "/input.txt", function (err, data){
    main(data.toString());
});

var main = function (text){
    var lines = text.split("\n");
    //console.log(lines);

    var count = 0;

    for (var i = 0; i < lines.length; i++){
        var chars = lines[i].split("");
        //console.log("--------");
        var inBracket = 0;
        var sequences = [];

        for (var j = 0; j < chars.length; j++){
            if (chars[j] === "[") {
                inBracket += 1;
            } else if (chars[j] === "]") {
                inBracket -= 1;
            }
            if ((j+2) < chars.length && chars[j] === chars[j+2]
                    && chars[j] !== chars[j+1]){
                sequences.push([chars[j], chars[j+1], inBracket]);                
            }
        }

        var exit = false;
        for(var k = 0; k < sequences.length; k++){
            for(var l = 0; l < sequences.length; l++){
                if(sequences[k][0] === sequences[l][1] && sequences[k][1] === sequences[l][0]
                        && ((sequences[k][2] && !sequences[l][2]) || (!sequences[k][2] && sequences[l][2]))){
                    count++;
                    exit = true;
                    break;
                }
            }
            if(exit){
                break;
            }
        }

    }
    console.log(count);
}