From: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] Various minor clarifications
Date: Wed, 9 Nov 2016 20:30:16 +0300
Message-ID: <20161109173016.GA18332@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello.

The following patches contain some minor clarifications for quotactl and
mq_* syscalls.

Eugene Syromyatnikov (3):
  quotactl.2: clarification regarding Q_XQUOTASYNC, which is present
    but no-op in recent kernels
  mq_receive.3, mq_send.3: clarification regarding reasons behind EBADF
  mq_open.3: clarification regarding usage of mq_flags attribute in
    mq_open()

 man2/quotactl.2   |   16 ++++++++++------
 man3/mq_open.3    |    9 ++++++++-
 man3/mq_receive.3 |    2 +-
 man3/mq_send.3    |    2 +-
 4 files changed, 20 insertions(+), 9 deletions(-)

-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
