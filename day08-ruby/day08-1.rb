
def printDisplay (display)
	for row in display
		print row.join(" ")
		print "\n"
	end
end

def rotateRow (display, row, steps)
	display[row] = display[row].rotate(-steps)
	return display
end

def rotateColumn (display, column, steps)

end

display = Array.new(6, ".")
for i in 0..display.size-1
	display[i] = Array.new(50, ".")
end

display[1][1] = "#"

printDisplay display

display = rotateRow(display, 1, 1)
print "\n"

printDisplay display