From: Alexandre Bique <bique.alexandre-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: /proc/[pid]/oom_adj and /proc/[pid]/oom_score_adj
Date: Mon, 12 Nov 2012 12:09:45 +0100
Message-ID: <CAP737oKmr2msE0SvFh4kiCf+psg25hobVEDGvZ5-sg=TmL1OQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

Recent Linux kernels says:

/proc/2978/oom_adj is deprecated, please use /proc/2978/oom_score_adj instead.

But man proc(5) doesn't explain how to use oom_score_adj. Can someone
update man proc(5)?

Thanks a lot!

--
Alexandre Bique
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
