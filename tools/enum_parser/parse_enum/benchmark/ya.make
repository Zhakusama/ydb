Y_BENCHMARK()

BENCHMARK_OPTS(--budget=10)

SRCS(
    main.cpp
)

GENERATE_ENUM_SERIALIZATION_WITH_HEADER(enum.h)

END()

IF (NOT OPENSOURCE)
RECURSE(from_string)
ENDIF()
