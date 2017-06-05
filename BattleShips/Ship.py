class Ship():
    #USELESS. Only ship.size is worthy
    def __init__(self, size):
        self.size = size
        self.status = ['0']*size
        self.cells = []

    def get_size(self):
        return self.size

    def get_status(self):
        return self.status

    def add_cell(self, cell):
        self.cells.append(cell),

    def get_cells(self):
        return self.cells

    def reset_cells(self):
        self.cells = []

    def hit(self, cell):
        pass

    def __str__(self):
        if all(ch == '0' for ch in self.status):
            result = "x Full "
        elif all(ch == 'X' for ch in self.status):
            result = "x Dead "
        else:
            result = "x Injured "
        return "Size: " + str(self.size) + result + ''.join(self.status)