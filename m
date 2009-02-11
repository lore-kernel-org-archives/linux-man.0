From: Martin Schulze <joey-1lCxjdRlhQ9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [BUG] man proc - missing /proc/sys/kernel/sysrq
Date: Wed, 11 Feb 2009 15:28:26 +0100
Message-ID: <20090211142826.GK29960@finlandia.home.infodrom.org>
References: <70c398100902110611n6da69f31j6def10b72b58ab28@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <70c398100902110611n6da69f31j6def10b72b58ab28-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gini <gheorghe.coserea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Gini wrote:
> Hi,
> The following bug is present in proc manpage (man proc):
> - the /proc/sys/kernel/sysrq entry is missing.

Thanks for the note!

Could you file a bug report in the Debian bug tracking system for this?
(http://bugs.debian.org/ should contain information on how to submit bug
reports - or use the reportbug utility).  Please also check against the
current version of manpages (in Debian 3.17, upstream 3.18).  In 3.17
this particular pseudo file is not mentioned.

We would also appreciate a patch for the proc(5) manpage.

Regards,

	Joey

-- 
We all know Linux is great... it does infinite loops in 5 seconds.
        -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
