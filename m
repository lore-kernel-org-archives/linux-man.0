From: Song Liu <songliubraving-b10kYP2dOMg@public.gmane.org>
Subject: [PATCH v2] create [k,u]probe with perf_event_open
Date: Tue, 9 Jan 2018 11:39:25 -0800
Message-ID: <20180109193926.2098429-1-songliubraving@fb.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: kernel-team-b10kYP2dOMg@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, Song Liu <songliubraving-b10kYP2dOMg@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Changes in v2:
  Fix grammer issue found by Michael.
  Try explain the behavior with more details.

Song Liu (1):
  perf_event_open.2: add type kprobe and uprobe

 man2/perf_event_open.2 | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

--
2.9.5
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
