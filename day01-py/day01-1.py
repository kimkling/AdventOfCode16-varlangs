content = open('input.txt', 'r').read()
steps = content.split(', ')
heading = 0
pos = [0, 0]
for step in steps:
    turn = step[0]
    length = int(step[1:])

    # Rotate
    if turn == 'R':
        heading = (heading + 1) % 4
    elif turn == 'L':
        heading = (heading - 1) % 4

    # Walk
    if heading == 0:
        pos[1] += length
    elif heading == 1:
        pos[0] += length
    elif heading == 2:
        pos[1] -= length
    elif heading == 3:
        pos[0] -= length

print "Final position: %s, total distance: %s" % (pos, abs(pos[0]) + abs(pos[1]))