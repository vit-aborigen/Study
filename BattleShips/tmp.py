import itertools

size = 4

def mark_cell(cell):
    y, x = cell

    x_range = []
    if x - 1 >= 0:
        x_range.append(x - 1)
    if x + 1 <= size - 1:
        x_range.append(x + 1)

    y_range = []
    if y - 1 >= 0:
        y_range.append(x - 1)
    if y + 1 <= size - 1:
        y_range.append(x + 1)

    print(list(itertools.product(x_range, y_range)))

mark_cell((0,1))


