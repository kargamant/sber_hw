# Latch  
Latch или тригер - простейшая бистабильная ячейка памяти, хранящая один бит информации. Часто с управляющими надстройками для различных действий над хранимым значением.  

# Схемное представление  
В общем виде любой latch выглядит так  
![suzya](suzya.jpg)
Здесь:  
**СУ** - схема управления, реализующая те самые различные действия над хранимым значением: запись 1/0, хранение, инверсия.  
**E1, E2** - кастомные управляющие сигналы.  
**C** - clock.  Для синхронных триггеров.  
**ЗЯ** - запоминающая ячейка.  
**SR** - сигналы set и reset.  
**Q** - хранимое значение.  

Для простоты буду использовать реализацию синхронного SR триггера.  
Схемно она реализуется следующим образом на элементах И-НЕ:  
![sr_schematic](sr_schematic.jpg)
И таблица переходов для этого триггера:  
![sr_table](sr_table.jpg)


В данном случае всё, что делает схема управления, просто инвертирует сигналы Set и Reset и разрешает их подачу только при поступлении клока. В противном случае(если синхросигнал не поступает), на выходах D1 и D2 будут единички, т.е. хранение текущего состояния.  
Set=1, Reset=1 является запрещённой комбинацией. Если её подать, то триггер находится в неопределённом состоянии.  
# Waveform  

Диаграмма работы триггера:  
![waveform](waveform.png)

События на диаграмме по клокам:  
**0ns**: триггер в неопределённом состоянии  
**5ns**: заресетили триггер в ноль  
**15ns**: храним ноль  
**25ns**: засетили триггер в единицу  
**35ns**: храним единицу  
**45ns**: сбросили в ноль  
**55ns**: храним ноль  
**65ns**: подаём запрещённую комбинацию.  
> На диаграмме хоть и показано, что Q и NQ оба равны единице, но в реальности они просто равны и их значения неопределены.  
# Code  

```python
  
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
```
