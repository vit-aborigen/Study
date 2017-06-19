class Ship():
    '''''''''
    status: 0 - Full, 1 - injured, 2 - sunk
    '''''''''
    def __init__(self, size):
        self.size = size
        self.status = 0
        self.cells = []
        self.live = []

    def get_size(self):
        return self.size

    def add_cell(self, cell):
        self.cells.append(cell),
        self.live.append(cell),

    def get_cells(self):
        return self.cells[::1]

    def reset_cells(self):
        self.cells = []
        self.live = []

    def hit(self, cell):
        self.live = ['X' if i == cell else i for i in self.live]
        if all(part == 'X' for part in self.live):
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