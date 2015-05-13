From: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: /proc/{diskstats,schedstat,vmstat} documentation
Date: Wed, 13 May 2015 12:50:23 +0300
Message-ID: <55531E5F.2090803@redhat.com>
Reply-To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Michael,

it seems that /proc/vmstat is undocumented in proc(5), is it just
because nobody has written the documentation yet or are some files
considered out of scope for proc(5)? Other such "interesting" file which
would be nice to have documented in-line is IMHO /proc/diskstats.

FWIW, for /proc/vmstat first search hit is
http://www.linuxinsight.com/proc_vmstat.html which looks decent.

I also see that /proc/schedstat and /proc/<pid>/schedstat are missing,
some information about them can be found at
http://eaglet.rain.com/rick/linux/schedstat/v15/format-15.html and
https://www.kernel.org/doc/Documentation/scheduler/sched-stats.txt.

Lastly, /proc/<pid>/{loginuid,sessionid} are missing.

PS. Yes, I think I try to provide patches at least for a couple of these
cases if time permits.

Thanks,

-- 
Marko Myllynen
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
