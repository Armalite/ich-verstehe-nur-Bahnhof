# Qiskit - Quantum Superposition

Like a classical computer, a quantum computer operates on bits. However, while classical bits can only be found in the states 0 and 1, a quantum bit, or qubit, can represent the values 0 and 1, or linear combinations of both. These linear combinations are known as superpositions (or superposition states).

"A general computation on a quantum computer proceeds in very much the same way as noise cancellation. To begin, one prepares a superposition of all possible computation states. This is then used as an input to a quantum circuit that selectively interferes the components of the superposition according to a prescribed algorithm. What remains after cancelling the relative amplitudes and phases of the input state is the solution to the computation performed by the quantum circuit."

```python
from qiskit import QuantumRegister, ClassicalRegister, QuantumCircuit
from numpy import pi

qreg_q = QuantumRegister(1, 'q')
creg_c = ClassicalRegister(1, 'c')
circuit = QuantumCircuit(qreg_q, creg_c)

circuit.reset(qreg_q[0])
circuit.h(qreg_q[0])
circuit.measure(qreg_q[0], creg_c[0])
```
