#script (python)

import gringo
import sys

def writeln(s):
    sys.stdout.write(str(s))
    sys.stdout.write("\n")
    sys.stdout.flush()

def on_model(x):
    writeln("Answer: 42")
    writeln(
          "hasA(" +        str(x.contains(gringo.Fun("a"))).lower() + ") "
        + "hasVolatile(" + str(x.contains(gringo.Fun("volatile", [9]))).lower() + ") "
        + "model(" +       ",".join(sorted(map(str, x.atoms()))) + ") ")

def on_finish(ret, canceled):
    writeln("Answer: 42")
    writeln(str(ret) + "_" + str(canceled).lower())

def main (prg):
    n = prg.get_const("n")
    parts = []
    parts.append(("base", []))
    prg.ground(parts)
    prg.solve()
    prg.add("test", ["x"], "test(x).")
    parts.append(("test", [gringo.Fun("f", [1,2])]))
    for i in range(1,n+1):
        parts.append(("cumulative", [i]))
        prg.ground(parts)
        parts = []
        f = prg.solve_async(None, on_model, on_finish)
        f.wait(0)
        ret = f.get()
        writeln("Answer: 42")
        writeln(ret)

#end.

#const n = 10.

#program base.

a.

#program cumulative(k).

1 { c(k) } 1.
q(k) :- c(k).
r(k,X) :- test(X).

#external volatile(k).
 :- not c(5), not volatile(k).
volatile(k-1).

