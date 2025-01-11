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

    ext.py_memmove.restype = ct.c_void_p
    ext.py_memmove.argtypes = [
        ct.c_void_p,
        ct.c_void_p,
        ct.c_size_t,
    ]

    ext.py_memcpy.restype = ct.c_void_p
    ext.py_memcpy.argtypes = [
        ct.c_void_p,
        ct.c_void_p,
        ct.c_size_t,
    ]

    ext.py_element_ptr.restype = ct.c_void_p
    ext.py_element_ptr.argtypes = [
        ct.c_void_p,
        ct.c_size_t,
        ct.c_uint64,
    ]

    ext.py_fdopen.restype = ct.c_void_p
    ext.py_fdopen.argtypes = [ct.c_int, ct.c_char_p]

    ext.py_fclose.restype = ct.c_int
    ext.py_fclose.argtypes = [ct.c_void_p]

    ext.py_fread.restype = ct.c_size_t
    ext.py_fread.argtypes = [
        ct.c_void_p,
        ct.c_size_t,
        ct.c_size_t,
        ct.c_void_p,
    ]

    ext.py_write_to_file.restype = ct.c_int
    ext.py_write_to_file.argtypes = [
        ct.c_void_p,
        ct.c_void_p,
        ct.c_int64,
    ]
