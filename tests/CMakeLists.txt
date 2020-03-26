add_executable(tests tests.cpp)

# Linking up all libraries (includes the coverage settings set by 'example' library)
target_link_libraries(tests PRIVATE phys)

add_test(NAME libphys_test COMMAND tests)

install(TARGETS tests DESTINATION ${TESTS_DIR})
