LIBRARY()

SRCS(
    status_code_counters.cpp
)

PEERDIR(
    library/cpp/monlib/dynamic_counters
    ydb/library/yql/dq/actors/protos
    yql/essentials/public/issue
)

YQL_LAST_ABI_VERSION()

END()

RECURSE_FOR_TESTS(
    ut
)
