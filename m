From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: timerfd_create confusion
Date: Tue, 23 Sep 2008 07:10:05 +0200
Message-ID: <cfd18e0f0809222210r7e069987t8575669ac885001d@mail.gmail.com>
References: <cone.1221531974.45416.7917.500@commodore.email-scan.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cone.1221531974.45416.7917.500-lO+bjgoT4TKm14v+eVDVcBDJ/jce7dRH@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Sam,

On Tue, Sep 16, 2008 at 4:26 AM, Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org> wrote:
> The following paragraph in timerfd_create looks confusing to me:
>
>      The   flags   argument   is   either  0,  to  start  a  relative  timer
>      (new_value.it_interval specifies a time relative to the  current  value
>      of  the  clock specified by clockid), or TFD_TIMER_ABSTIME, to start an
>      absolute timer (new_value.it_interval specifies an  absolute  time  for
>      the clock specified by clockid; that is, the timer will expire when the
>      value of that clock reaches the value specified in  new_value.it_inter-
>      val).
>
> The way I parse this, it makes more sense if the flags argument actually
> applies to the it_value field, the field that sets the initial timer
> expiration, rather than it_interval, the periodic timer expiration duration.

Yes, you are right; a moment of inattention when I wrote that text.
Fixed for 3.10.

thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
