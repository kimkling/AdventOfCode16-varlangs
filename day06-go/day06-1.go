package main

import "fmt"
import "io/ioutil"
import "strings"

func main() {
	dat, err := ioutil.ReadFile("input.txt")
	if err != nil {
        panic(err)
    }

    var columns [8] string

    lines := strings.Split(string(dat), "\n")
    for _, line := range lines {
    	chars := strings.Split(line, "")
    	for i, char := range chars {
    		columns[i] += char
    	}

    }

    result := ""
    for _, column := range columns {
    	counts := make(map[string]int)

    	chars := strings.Split(column, "")
    	for _, char := range chars {
    		counts[char] += 1
    	}

    	mostFrequent := ""
    	mostFrequentCount := 0;
    	for k, v := range counts {
    		if mostFrequentCount < v {
    			mostFrequentCount = v
    			mostFrequent = k
    		}
    	}
    	result += mostFrequent

    }

    fmt.Println(result)
}