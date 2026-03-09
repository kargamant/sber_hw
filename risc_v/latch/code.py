
class sr_Latch:
    def __init__(self, q: bool = False):
        self._Q = q
        self._nQ = not q

    def process_signals(self, c, s, r):
        ns = not (c and s)
        nr = not (c and r)

        # transition process
        old_q = self._nQ
        old_nq = self._Q
        # doing until stabilization
        while self._Q != old_q or self._nQ != old_nq:
            old_q = self._Q
            old_nq = self._nQ

            self._Q = not (ns and self._nQ)
            self._nQ = not (nr and self._Q)

    def get_state(self):
        if self._Q == self._nQ:
            return -1
        return self._Q


if __name__ == '__main__':
    diagram_signals = [
        # c, s, r
        [0, 0, 1],
        [1, 0, 1],
        [1, 0, 0],
        [1, 1, 0],
        [1, 0, 0],
        [1, 0, 1],
        [1, 0, 0],
        [1, 1, 1]
    ]

    latch = sr_Latch()
    print('initial state: ', latch.get_state())

    print('C: ', [sig[0] for sig in diagram_signals])
    print('S: ', [sig[1] for sig in diagram_signals])
    print('R: ', [sig[2] for sig in diagram_signals])

    state_history = []

    for sigs in diagram_signals:
        latch.process_signals(*sigs)
        state_history.append(latch.get_state())

    print('Q: ', [st for st in state_history])
