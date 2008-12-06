From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] nscd.8: Correct NOTES section on reloading configuration files
Date: Sat, 6 Dec 2008 12:23:07 -0500
Message-ID: <cfd18e0f0812060923ke0cf121sdd68c563cb10653c@mail.gmail.com>
References: <20081205231738.GU10491@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081205231738.GU10491-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Thorsten Kukuk <kukuk-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC+=Thorsten Kukuk <kukuk-l3A5Bk7waGM@public.gmane.org>, since he wrote the original page,
and may have some input to make as well]

Hi Petr,

On Fri, Dec 5, 2008 at 6:17 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> The original notes were obsolete, current nscd watches changes in
> config files.

I've applied this for man-pages-3.16, with a few very small tweaks.

Thanks,

Michael

> Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
>
> diff --git a/man8/nscd.8 b/man8/nscd.8
> index ecbd9ba..987efcb 100644
> --- a/man8/nscd.8
> +++ b/man8/nscd.8
> @@ -17,7 +17,10 @@
>  .\" write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
>  .\" Boston, MA 02111-1307, USA.
>  .\"
> -.TH NSCD 8 1999-10-01 "GNU" "Linux Programmer's Manual"
> +.\" 2008-12-05 Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
> +.\"    Rewrite the NOTES section to reflect modern reality
> +.\"
> +.TH NSCD 8 2008-12-05 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  /usr/sbin/nscd \- name service cache daemon
>  .SH DESCRIPTION
> @@ -55,16 +58,29 @@ calls remain uncached as a result.
>  .B "\-\-help"
>  will give you a list with all options and what they do.
>  .SH NOTES
> -Nscd doesn't know anything about the underlying protocols for a
> -service.
> -This also means, that if you change
> -.I /etc/resolv.conf
> -for DNS queries, nscd will continue to use the old one if you have
> -configured
> -.I /etc/nsswitch.conf
> -to use DNS for host lookups.
> -In such a case, you need to restart
> -nscd.
> +The daemon will try to watch for changes in configuration files
> +appropriate for each database (e.g.
> +.I /etc/passwd
> +for the
> +.I passwd
> +database or
> +.IR "/etc/hosts " and " /etc/resolv.conf"
> +for the
> +.I hosts
> +database) and flush the cache when these are changed.
> +However, this will happen only after a short delay
> +(unless the
> +.BR inotify (7)
> +mechanism is available and glibc-2.9 or newer is used)
> +and this auto-detection does not cover configuration files
> +required by non-standard NSS modules, if any are specified in
> +.IR /etc/nsswitch.conf .
> +In that case, you need to call
> +.I nscd -i DATABASE
> +after changing the configuration file of the database
> +so that
> +.B nscd
> +invalidates its cache.
>  .SH "SEE ALSO"
>  .BR nscd.conf (5),
>  .BR nsswitch.conf (5)
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
