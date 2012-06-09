IF(MSVC_C_ARCHITECTURE_ID AND CMAKE_GENERATOR MATCHES "Ninja" AND CMAKE_C_COMPILER)
  STRING(REPLACE "cmake.exe" "cmcldeps.exe"  CMAKE_CMCLDEPS_EXECUTABLE ${CMAKE_COMMAND})
  SET(showdir ${CMAKE_BINARY_DIR}/CMakeFiles/ShowIncludes)
  FILE(WRITE ${showdir}/foo.h "\n")
  FILE(WRITE ${showdir}/main.c "#include \"foo.h\" \nint main(){}\n")
  EXECUTE_PROCESS(COMMAND ${CMAKE_C_COMPILER} /nologo /showIncludes ${showdir}/main.c
                  WORKING_DIRECTORY ${showdir} OUTPUT_VARIABLE showOut)
  STRING(REPLACE main.c "" showOut1 ${showOut})
  STRING(REPLACE "/" "\\" header1 ${showdir}/foo.h)
  STRING(TOLOWER ${header1} header2)
  STRING(REPLACE ${header2} "" showOut2 ${showOut1})
  STRING(REPLACE "\n" "" showOut3 ${showOut2})
  SET(CMAKE_CL_SHOWINCLUDE_PREFIX ${showOut3} CACHE STRING "cl.exe's /showInclides prefix" FORCE)
ENDIF()
