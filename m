From: Michael Witten <mfwitten-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [OVERVIEW 0/9] Cleanup Time
Date: Sat,  9 Jan 2010 17:45:28 -0600
Message-ID: <1263080737-2868-1-git-send-email-mfwitten@gmail.com>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This patch series is a medley of cleanups
focused mainly on issues related to time.

Subjects:

    [PATCH 1/9] tzset.3: Cleanup grammar/clarity
    [PATCH 2/9] stime.2, strftime.3, tzset.3, zic.8: GMT -> UTC (where appropriate)
    [PATCH 3/9] strftime.3: Clarification of %z
    [PATCH 4/9] strftime.3: %z is defined by the SUSv3
    [PATCH 5/9] strftime.3: Move 822-compliant date format example to EXAMPLES section
    [PATCH 6/9] strftime.3: Expanded introduction
    [PATCH 7/9] "timezone" -> "time zone"
    [PATCH 8/9] Consistently define the Epoch
    [PATCH 9/9] "null terminated" -> "null-terminated"

Overall diffstat

    man2/gettimeofday.2  |    4 +-
    man2/stime.2         |    4 +-
    man2/time.2          |    4 +-
    man2/utimensat.2     |    6 ++--
    man3/ctime.3         |   13 +++++------
    man3/difftime.3      |    6 ++--
    man3/ftime.3         |    6 ++--
    man3/fts.3           |    8 +++---
    man3/getdate.3       |    2 +-
    man3/getnetent.3     |    2 +-
    man3/getprotoent.3   |    2 +-
    man3/getrpcent.3     |    2 +-
    man3/getservent.3    |    2 +-
    man3/getspnam.3      |    4 +-
    man3/getsubopt.3     |    2 +-
    man3/mq_receive.3    |    2 +-
    man3/mq_send.3       |    2 +-
    man3/putgrent.3      |    2 +-
    man3/rtime.3         |    4 +-
    man3/sem_wait.3      |    2 +-
    man3/strcat.3        |    4 +-
    man3/strcpy.3        |    2 +-
    man3/strftime.3      |   58 +++++++++++++++++++++++++++++++++----------------
    man3/strptime.3      |    7 ++---
    man3/sysconf.3       |    2 +-
    man3/timeradd.3      |    3 +-
    man3/tzset.3         |   44 +++++++++++++++++++-------------------
    man4/console_ioctl.4 |    2 +-
    man4/rtc.4           |    2 +-
    man5/core.5          |    2 +-
    man5/proc.5          |    2 +-
    man5/tzfile.5        |   18 +++++++-------
    man7/environ.7       |    2 +-
    man7/hier.7          |    2 +-
    man7/icmp.7          |    2 +-
    man7/time.7          |    2 +-
    man8/tzselect.8      |   10 ++++----
    man8/zdump.8         |    2 +-
    man8/zic.8           |   30 +++++++++++++-------------
    39 files changed, 146 insertions(+), 129 deletions(-)

Sincerely,
Michael Witten
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
