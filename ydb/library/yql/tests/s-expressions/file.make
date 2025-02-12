PY2TEST()

TEST_SRCS(
    test.py
)

IF (SANITIZER_TYPE OR NOT OPENSOURCE)
    REQUIREMENTS(cpu:4 ram:13)
ENDIF()

IF (SANITIZER_TYPE)
    TIMEOUT(1800)
    SIZE(LARGE)
    TAG(ya:fat sb:ttl=2)
ELSE()
    TIMEOUT(600)
    SIZE(MEDIUM)
    TAG(sb:ttl=2)
ENDIF()

FORK_TESTS()
FORK_SUBTESTS()
SPLIT_FACTOR(10)

DEPENDS(
    ydb/library/yql/tools/yqlrun
    yql/essentials/tools/astdiff
    ydb/library/yql/tests/common/test_framework/udfs_deps
    yql/essentials/udfs/test/test_import
    yql/essentials/udfs/test/simple
)

DATA(
    arcadia/ydb/library/yql/tests/s-expressions # python files
    arcadia/yql/essentials/mount
    arcadia/ydb/library/yql/cfg/tests
)

PEERDIR(
    library/python/testing/swag/lib
    yql/essentials/protos
    ydb/library/yql/tests/common/test_framework
)

TAG(ya:dump_test_env)

IF (SANITIZER_TYPE == "memory")
    TAG(ya:not_autocheck) # YQL-15385
ENDIF()

NO_CHECK_IMPORTS()

END()

