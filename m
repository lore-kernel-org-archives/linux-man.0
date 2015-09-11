From: Michal Hocko <mhocko-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] mlock.2: mlock2.2: Add entry to for new mlock2 syscall
Date: Fri, 11 Sep 2015 17:16:05 +0200
Message-ID: <20150911151605.GL3417@dhcp22.suse.cz>
References: <1441030820-2960-1-git-send-email-emunson@akamai.com>
 <55F14E05.6020304@suse.cz>
 <20150911145712.GA3452@akamai.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150911145712.GA3452-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric B Munson <emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
Cc: Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri 11-09-15 10:57:12, Eric B Munson wrote:
> On Thu, 10 Sep 2015, Vlastimil Babka wrote:
[...]
> > Also, what about glibc wrapper for mlock2()? Does it have to come before or
> > after the manpage and who gets it in?
> 
> V3 now has an updated version, hopefully mlock2 hits the 4.4 merge
> window.
> 
> I don't know about the glibc wrapper, are we expected to write one
> ourselves?  Will they even take it?  They haven't been the most open
> minded about taking wrappers for system calls that are unique to Linux
> in the past.

I do not think we really do care about the glibc wrapper. There are many
syscalls which do not have it either (e.g. gettid).

But I guess it would be worth noting this in the man page the same way
as gettid does.
-- 
Michal Hocko
SUSE Labs
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
