From: Petre Mierlutiu <peter-zTtBy73WAK9hl2p70BpVqQ@public.gmane.org>
Subject: sleep(3) manpage
Date: Thu, 10 Dec 2009 19:50:30 +0200
Message-ID: <9C1C3093-079B-4125-8621-56628C4A963B@cs.upt.ro>
Mime-Version: 1.0 (Apple Message framework v1077)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

the sleep(3) manpage states, under DESCRIPTION, that "sleep()  makes  the  calling  process sleep [...]". I believe this not to be true and the appropriate text would be: "sleep() makes the calling thread sleep [...]".

 I think in the past Linux did implement it so it would block the process, I am not sure.
Anyway, sleep is currently implemented using nanosleep() and a simple threaded program can be written to prove sleep only sleeps the calling thread.

Manpages version: 3.21
Distribution: ubuntu 9.10

Kind regards,

Petre Mierlutiu--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
