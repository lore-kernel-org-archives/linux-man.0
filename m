From: cerise-E0iVtVOWpgTQT0dZR+AlfA@public.gmane.org
Subject: Problem with sigaction(2) manpage
Date: Mon, 14 Jun 2010 03:19:27 -0700
Message-ID: <20100614101927.GV30344@boogeyman>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi there:

I just decided to stop using signal() and start using sigaction().  The
problem is that it neither references sigemptyset(), sigaddset(), or
any of the other functions involved in manipulating the sigset_t structure 
under "SEE ALSO", nor does it explain that sa_mask is intended to be modified 
by those functions.

That lack of clarity forced me to look up someone else's code as a reference.

I'm using man-pages-3.23 & man-pages-posix-2003a under Gentoo.

-Phil/CERisE
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
