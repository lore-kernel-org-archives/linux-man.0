From: Michal Hocko <mhocko-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] signal.7: add missing async-signal-safe functions
Date: Fri, 11 Sep 2015 13:28:28 +0200
Message-ID: <20150911112828.GG3417@dhcp22.suse.cz>
References: <1441638469-22062-1-git-send-email-mhocko@kernel.org>
 <55F2B413.5090003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55F2B413.5090003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri 11-09-15 12:59:31, Michael Kerrisk wrote:
> Hi Michael,
> 
> On 09/07/2015 05:07 PM, mhocko-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org wrote:
> > From: Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>
> > 
> > It seems that few async-signal-safe functions listed by POSIX.1-2008
> > http://pubs.opengroup.org/onlinepubs/9699919799/functions/V2_chap02.html#tag_15_04_03
> > are not mentioned in the man page. I am not exactly sure in which
> > version of the standard they have declared as signal safe. So they
> > were added to the section according to which standard they conform to:
> > 
> > POSIX.1-2001
> > - fchdir
> > - pthread_self
> > - pthread_sigmask
> > 
> > POSIX.1-2008
> > - pthread_kill
> 
> Thanks for spotting this. I had missed it myself.
> I see now that those 4 functions were added in POSIX.1-2008
> Technical Corrigendum 1 (2013). So, I've applied a different
> patch (below). Thanks for catching this, and the effort on the
> patch.

OK, thanks for fixing that up!
-- 
Michal Hocko
SUSE Labs
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
