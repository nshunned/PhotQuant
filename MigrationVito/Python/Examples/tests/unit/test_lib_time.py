import random
from copy import copy
from datetime import datetime as std_datetime
from datetime import timedelta, timezone

import pytest
from hightime import datetime as ht_datetime

from nidaqmx._lib_time import AbsoluteTime as LibTimestamp
from tests.unit._time_utils import (
    JAN_01_2002_TIMESTAMP_1904_EPOCH,
    JAN_01_2002_DATETIME,
    JAN_01_2002_HIGHTIME,
)


JAN_01_2002_LIB = LibTimestamp(lsb=0, msb=JAN_01_2002_TIMESTAMP_1904_EPOCH)


def test___timestamps___sort___is_ordered():
    ordered = [
        LibTimestamp(msb=1, lsb=0),
        LibTimestamp(msb=2, lsb=0),
        LibTimestamp(msb=2, lsb=1),
        LibTimestamp(msb=2, lsb=2),
        LibTimestamp(msb=3, lsb=0),
    ]

    shuffled = copy(ordered)
    random.shuffle(shuffled)
    assert sorted(shuffled) == ordered


@pytest.mark.parametrize("from_dt", [(JAN_01_2002_DATETIME), (JAN_01_2002_HIGHTIME)])
def test___utc_datetime___convert_to_timestamp___is_reversible(from_dt):
    to_ts = LibTimestamp.from_datetime(from_dt)
    roundtrip_dt = to_ts.to_datetime(tzinfo=timezone.utc)

    assert to_ts == JAN_01_2002_LIB
    assert roundtrip_dt == JAN_01_2002_HIGHTIME


@pytest.mark.parametrize(
    "datetime_cls, tzinfo, expected_offset",
    [
        (std_datetime, timezone(timedelta(minutes=30)), -1800),
        (std_datetime, timezone(timedelta(minutes=-30)), 1800),
        (std_datetime, timezone(timedelta(hours=1)), -3600),
        (std_datetime, timezone(timedelta(hours=-1)), 3600),
        (ht_datetime, timezone(timedelta(minutes=30)), -1800),
        (ht_datetime, timezone(timedelta(minutes=-30)), 1800),
        (ht_datetime, timezone(timedelta(hours=1)), -3600),
        (ht_datetime, timezone(timedelta(hours=-1)), 3600),
    ],
)
def test___tz_datetime___convert_to_timestamp___is_reversible(
    datetime_cls, tzinfo, expected_offset
):
    from_dt = datetime_cls(2002, 1, 1, tzinfo=tzinfo)

    to_ts = LibTimestamp.from_datetime(from_dt)
    roundtrip_dt = to_ts.to_datetime(tzinfo=tzinfo)

    assert to_ts.msb == JAN_01_2002_LIB.msb + expected_offset
    assert to_ts.lsb == JAN_01_2002_LIB.lsb
    assert roundtrip_dt == from_dt


@pytest.mark.parametrize(
    "base_dt, microsecond, subseconds",
    [
        (JAN_01_2002_DATETIME, 0, 0),
        (JAN_01_2002_DATETIME, 1, 0x10C6F7A0B5EE),
        (JAN_01_2002_DATETIME, 250000, 0x4000000000000000),
        (JAN_01_2002_DATETIME, 500000, 0x8000000000000000),
        (JAN_01_2002_DATETIME, 750000, 0xC000000000000000),
        (JAN_01_2002_DATETIME, 999999, 0xFFFFEF39085F4800),
        (JAN_01_2002_HIGHTIME, 0, 0),
        (JAN_01_2002_HIGHTIME, 1, 0x10C6F7A0B5EE),
        (JAN_01_2002_HIGHTIME, 250000, 0x4000000000000000),
        (JAN_01_2002_HIGHTIME, 500000, 0x8000000000000000),
        (JAN_01_2002_HIGHTIME, 750000, 0xC000000000000000),
        (JAN_01_2002_HIGHTIME, 999999, 0xFFFFEF39085F4800),
    ],
)
def test___datetime_with_microseconds___convert_to_timestamp___is_reversible(
    base_dt, microsecond, subseconds
):
    from_dt = base_dt.replace(microsecond=microsecond)

    to_ts = LibTimestamp.from_datetime(from_dt)
    roundtrip_dt = to_ts.to_datetime(tzinfo=timezone.utc)

    assert to_ts.msb == JAN_01_2002_LIB.msb
    assert to_ts.lsb == subseconds
    # comparison is tricky since imprecision in the conversion to NI-BTF are
    # caught by the higher precision values in hightime, so we round here.
    roundtrip_dt_microsecond = roundtrip_dt.microsecond
    if roundtrip_dt.femtosecond > LibTimestamp.MAX_FS / 2:
        roundtrip_dt_microsecond += 1

    assert roundtrip_dt_microsecond == microsecond


@pytest.mark.parametrize(
    "base_dt, femtosecond, subseconds",
    [
        (JAN_01_2002_HIGHTIME, 0, 0),
        (JAN_01_2002_HIGHTIME, 1, 0x480F),
    ],
)
def test___datetime_with_femtoseconds___convert_to_timestamp___is_reversible(
    base_dt, femtosecond, subseconds
):
    from_dt = base_dt.replace(femtosecond=femtosecond)

    ts = LibTimestamp.from_datetime(from_dt)
    roundtrip_dt = ts.to_datetime(tzinfo=timezone.utc)

    assert ts.msb == JAN_01_2002_LIB.msb
    assert ts.lsb == subseconds
    # comparison is tricky since imprecision in the conversion to NI-BTF are
    # caught by the higher precision values in hightime, so we round here.
    roundtrip_dt_femtosecond = roundtrip_dt.femtosecond
    if roundtrip_dt.yoctosecond > LibTimestamp.MAX_YS / 2:
        roundtrip_dt_femtosecond += 1
    assert roundtrip_dt_femtosecond == femtosecond


@pytest.mark.parametrize(
    "base_dt, yoctosecond, subseconds, yoctosecond_round_trip",
    [
        (JAN_01_2002_HIGHTIME, 0, 0, 0),
        # Yoctoseconds is quite a bit more precise than NI-BTF
        (JAN_01_2002_HIGHTIME, 54210, 1, 54210),
        (JAN_01_2002_HIGHTIME, 54211, 1, 54210),
    ],
)
def test___datetime_with_yoctoseconds___convert_to_timestamp___is_reversible(
    base_dt, yoctosecond, subseconds, yoctosecond_round_trip
):
    from_dt = base_dt.replace(yoctosecond=yoctosecond)

    ts = LibTimestamp.from_datetime(from_dt)
    to_dt = ts.to_datetime(tzinfo=timezone.utc)

    assert ts.msb == JAN_01_2002_LIB.msb
    assert ts.lsb == subseconds
    assert to_dt.yoctosecond == yoctosecond_round_trip


# Note: I can't actually test overflow because Python's datetime object is
# limited to years 1-9999, but the NI-BTF format can represent time before the
# Big Bang and until about year 292 billion. Oh well.
