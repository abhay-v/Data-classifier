import numpy as np
import ctypes as ct


class s_data(ct.Structure):
    _pack_ = 1
    _fields_ = [
        ("magic", ct.c_uint16),
        ("time", ct.c_uint64),
        ("x", ct.c_float),
        ("y", ct.c_float),
        ("z", ct.c_float),
        ("temp", ct.c_float),
        ("audio", ct.c_float),
    ]

    def __repr__(self):
        return """
        struct s_data {
            magic = %d,
            time = %.3f,

            accel = {
                %.3f,
                %.3f,
                %.3f
            }

            mag = %.3f,

            temp = %.3f,

            audio = %.3f,
        }
        """ % (
            self.magic,
            self.time / 1000.0,
            self.x,
            self.y,
            self.z,
            np.sqrt(self.x * self.x + self.y * self.y + self.z * self.z),
            self.temp,
            self.audio,
        )


ext = None


def init_extension():
    global ext

    ext = np.ctypeslib.load_library("libnudft", "./bin")

    ext.nudft.restype = None
    ext.nudft.argtypes = [
        np.ctypeslib.ndpointer(ct.c_float, ndim=1, flags="C"),
        np.ctypeslib.ndpointer(ct.c_float, ndim=1, flags="C"),
        ct.c_uint64,
        np.ctypeslib.ndpointer(np.complex64, ndim=1, flags="C"),
    ]
    ext.gen_training_set.restype = np.uint64
    ext.gen_training_set.argtypes = [
        np.ctypeslib.ndpointer(ct.c_float, ndim=1, flags="C"),
        np.ctypeslib.ndpointer(ct.c_float, ndim=1, flags="C"),
        ct.c_uint64,
        ct.c_uint64,
        ct.c_uint64,
        np.ctypeslib.ndpointer(ct.c_float, ndim=2, flags="C"),
    ]
