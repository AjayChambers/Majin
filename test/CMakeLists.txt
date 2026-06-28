# Fetch & Include GoogleTest
Include(CTest)
Include(add-gtest-test)
Include(Fetch-GoogleTest)
fetch_googletest("v1.17.0")

# TODO: Change function such that 'TEST_NAME' parameter can be
# used to set the test target's name
add_gtest_test(
    "buffer_test"
    "${CMAKE_CURRENT_SOURCE_DIR}/buffer.test.cxx"
    "Majin-Buffer-Test"
    "${BUFFER_INC_DIR}"
    "buffer;GTest::gtest_main")

Include(GoogleTest)
gtest_discover_tests(buffer_test)
enable_testing()








# add_executable(buffer_test "${CMAKE_CURRENT_SOURCE_DIR}/buffer.test.cxx")
# set_target_properties(buffer_test PROPERTIES
#     RUNTIME_OUTPUT_DIRECTORY    ${TEST_EXEC_OUTPUT_DIR}
#     OUTPUT_NAME                 "MajinBufferTest"
# )

# target_include_directories(buffer_test PUBLIC ${BUFFER_INC_DIR})
# target_link_libraries(buffer_test PRIVATE buffer GTest::gtest_main)

# add_test(
#     NAME buffer_test
#     COMMAND buffer_test)
