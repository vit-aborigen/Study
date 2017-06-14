class Ship():
    '''''''''
    status: 0 - Full, 1 - injured, 2 - sunk
    '''''''''
    def __init__(self, size):
        self.size = size
        self.status = 0
        self.cells = []

    def get_size(self):
        return self.size

    def add_cell(self, cell):
        self.cells.append(cell),

    def get_cells(self):
        return self.cells

    def reset_cells(self):
        self.cells = []

    def hit(self, cell):
        self.cells = ['X' if i == cell else i for i in self.cells]
        if all(part == 'X' for part in self.cells):
            self.status = 2
        else:
            self.status = 1
        return self.status


    def __str__(self):
        if self.status == 1:
            status = "Injured"
        elif self.status == 2:
            status = "Dead"
        else:
            status = "Full"
        return "Ship size: %d is %s" % (self.size, status)