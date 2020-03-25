add_library(phys STATIC
    Linear_Algebra.cpp
    Natural_Units.cpp
    Numerics.cpp
    Statistics.cpp
    Utilities.cpp
)

target_include_directories(phys  PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

target_compile_options(phys PUBLIC -Wall -pedantic)

# Include code-coverage settings:
target_link_libraries(phys PUBLIC coverage_config)

install(TARGETS phys DESTINATION ${LIB_DIR})
