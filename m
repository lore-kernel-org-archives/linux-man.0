From: Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RFC v3 0/3] vmpressure_fd: Linux VM pressure notifications
Date: Wed, 7 Nov 2012 02:53:49 -0800
Message-ID: <20121107105348.GA25549@lizard>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mel Gorman <mgorman-l3A5Bk7waGM@public.gmane.org>
Cc: Pekka Enberg <penberg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Leonid Moiseichuk <leonid.moiseichuk-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Minchan Kim <minchan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi all,

This is the third RFC. As suggested by Minchan Kim, the API is much
simplified now (comparing to vmevent_fd):

- As well as Minchan, KOSAKI Motohiro didn't like the timers, so the
  timers are gone now;
- Pekka Enberg didn't like the complex attributes matching code, and so it
  is no longer there;
- Nobody liked the raw vmstat attributes, and so they were eliminated too.

But, conceptually, it is the exactly the same approach as in v2: three
discrete levels of the pressure -- low, medium and oom. The levels are
based on the reclaimer inefficiency index as proposed by Mel Gorman, but
userland does not see the raw index values. The description why I moved
away from reporting the raw 'reclaimer inefficiency index' can be found in
v2: http://lkml.org/lkml/2012/10/22/177

While the new API is very simple, it is still extensible (i.e. versioned).

As there are a lot of drastic changes in the API itself, I decided to just
add a new files along with vmevent, it is much easier to review it this
way (I can prepare a separate patch that removes vmevent files, if we care
to preserve the history through the vmevent tree).

Thanks,
Anton.

--
 Documentation/sysctl/vm.txt                |  47 +++++
 arch/x86/syscalls/syscall_64.tbl           |   1 +
 include/linux/syscalls.h                   |   2 +
 include/linux/vmpressure.h                 | 128 ++++++++++++
 kernel/sys_ni.c                            |   1 +
 kernel/sysctl.c                            |  31 +++
 mm/Kconfig                                 |  13 ++
 mm/Makefile                                |   1 +
 mm/vmpressure.c                            | 231 +++++++++++++++++++++
 mm/vmscan.c                                |   5 +
 tools/testing/vmpressure/.gitignore        |   1 +
 tools/testing/vmpressure/Makefile          |  30 +++
 tools/testing/vmpressure/vmpressure-test.c |  93 +++++++++
 13 files changed, 584 insertions(+)
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
