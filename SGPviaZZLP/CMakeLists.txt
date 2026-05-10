# ── CMR static library (vendored sources) ────────────────────────────────────
file(GLOB CMR_SOURCES "third_party/cmr/src/cmr/*.c")
# regular_dec.c uses CMR_DEC, renamed to CMR_SEYMOUR_NODE in v1.4.0; dead code.
list(FILTER CMR_SOURCES EXCLUDE REGEX "regular_dec\\.c$")

add_library(cmr STATIC ${CMR_SOURCES})
target_include_directories(cmr PUBLIC
    third_party/cmr/include
    third_party/cmr/src/cmr
)

# ── Main executable ───────────────────────────────────────────────────────────
add_executable(SGPviaZZLP
    main.cpp
)

target_include_directories(SGPviaZZLP PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    third_party/utfcpp
)

target_link_libraries(SGPviaZZLP PRIVATE
    cmr
    highs
)

if(MSVC)
    target_compile_definitions(SGPviaZZLP PRIVATE
        _CRT_SECURE_NO_WARNINGS
        UNICODE
        _UNICODE
    )
    target_compile_options(SGPviaZZLP PRIVATE /W3)
endif()
