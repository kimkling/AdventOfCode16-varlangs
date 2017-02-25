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
        lineAbbaCount = 0;
        for (var j = 0; j < chars.length; j++){
            if (chars[j] === "[") {
                inBracket += 1;
            } else if (chars[j] === "]") {
                inBracket -= 1;
            }
            if ((j+3) < chars.length && chars[j] === chars[j+3] && chars[j+1] === chars[j+2]
                    && chars[j] !== chars[j+2]){
                //console.log(chars[j] + chars[j+1] + chars[j+2] + chars[j+3]);
                //console.log("In bracket: " + (inBracket > 0));
                if(inBracket === 0){
                    lineAbbaCount++;
                } else {
                    lineAbbaCount = 0;
                    break;
                }

            }
        }
        if(lineAbbaCount > 0){
            count++;
        }

    }
    console.log(count);
}