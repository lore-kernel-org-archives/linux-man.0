From: Song Liu <songliubraving-b10kYP2dOMg@public.gmane.org>
Subject: [PATCH] create [k,u]probe with perf_event_open
Date: Mon, 8 Jan 2018 17:21:53 -0800
Message-ID: <20180109012154.1146884-1-songliubraving@fb.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: kernel-team-b10kYP2dOMg@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, Song Liu <songliubraving-b10kYP2dOMg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This patches adds information about extending perf_event_open API to
create kprobe and uprobe. The [k,u]probe is attached to the file
descriptor returned by perf_event_open() for easier clean up.

Kernel side patches ofthis work as been accepted by Peter into his
repository:

 git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core

Discussions about the latest version can be found at:

 https://marc.info/?l=linux-kernel&m=151260040403095

Thanks,
Song

Song Liu (1):
  perf_event_open.2: add type kprobe and uprobe

 man2/perf_event_open.2 | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

--
2.9.5
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
