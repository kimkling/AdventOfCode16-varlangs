import sys

content = open('input.txt', 'r').read()
steps = content.split(', ')
heading = 0
pos = [0, 0]

visited_pos = set()
visited_pos.add(str(pos))

for step in steps:
    turn = step[0]
    left_to_walk = int(step[1:])

    # Rotate
    if turn == 'R':
        heading = (heading + 1) % 4
    elif turn == 'L':
        heading = (heading - 1) % 4

    # Walk
    while left_to_walk != 0:
        if heading == 0:
            pos[1] += 1
        elif heading == 1:
            pos[0] += 1
        elif heading == 2:
            pos[1] -= 1
        elif heading == 3:
            pos[0] -= 1

        left_to_walk -= 1
        if str(pos) in visited_pos:
            print "Visited %s twice! Distance is %s" % (pos, abs(pos[0]) + abs(pos[1])) 
            sys.exit(0)
        else:
            visited_pos.add(str(pos))