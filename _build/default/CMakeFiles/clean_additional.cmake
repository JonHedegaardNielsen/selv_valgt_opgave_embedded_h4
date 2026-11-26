# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "/home/jon/Projects/Programming/Embedded/selve_valgte_opgave/out/default.cmf"
  "/home/jon/Projects/Programming/Embedded/selve_valgte_opgave/out/default.hex"
  "/home/jon/Projects/Programming/Embedded/selve_valgte_opgave/out/default.hxl"
  "/home/jon/Projects/Programming/Embedded/selve_valgte_opgave/out/default.mum"
  "/home/jon/Projects/Programming/Embedded/selve_valgte_opgave/out/default.o"
  "/home/jon/Projects/Programming/Embedded/selve_valgte_opgave/out/default.sdb"
  "/home/jon/Projects/Programming/Embedded/selve_valgte_opgave/out/default.sym"
  )
endif()
