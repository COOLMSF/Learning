#ifndef RAMINIT_H
#define RAMINIT_H

/* I think the 855 is only four sockets -- RGM */
#define DIMM_SOCKETS 4
struct mem_controller {
  device_t d0;
  uint16_t channel0[DIMM_SOCKETS];
};


#endif /* RAMINIT_H */
