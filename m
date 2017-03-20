From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: man-pages: fallocate.2: ext3 hole punch
Date: Mon, 20 Mar 2017 21:08:08 +0100
Message-ID: <20170320200808.vc73y4vfo6khqm3i@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Dear Developers,

According to git log, ext3 (via ext4 driver) or ext4 non-extent-mapped files
are supported for FALLOC_FL_PUNCH_HOLE since Linux 3.9 [1] (incl. bugs),
with fixes since 3.16 [2] or stable 3.14+.

I hope this qualifies for a simple one-liner mentioned on reporting_bugs page.

Best Regards,
Micha³ Miros³aw

[1] commit 8bad6fc813a3a5300f51369c39d315679fd88c72
[2] commit a93cd4cf86466caa49cfe64607bea7f0bde3f916
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
