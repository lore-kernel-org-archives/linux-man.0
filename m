From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [Patch] utmpname(3) returns int instead of void
Date: Sun, 29 Jun 2008 04:53:43 +0200
Message-ID: <cfd18e0f0806281953i2d5ae156p3e201df7fe98b8e5@mail.gmail.com>
References: <20080628181713.GA1605@hack.netcabo.pt>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080628181713.GA1605-E5McWMdeTmA/VrvnIVm4NQ@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Halesh S <halesh.s-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Jun 28, 2008 at 8:17 PM, WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> As pointed by Halesh S, utmpname(3) should return int, just like what it is
> in glibc's source code.
>
> Signed-off-by: WANG Cong <wangcong-va7F5g4oNmbYtjvyW6yDsg@public.gmane.org>
> Cc: Halesh S <halesh.s-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thnks!  Applied for man-pages-3.02.

Cheers,

Michael

> Index: man-pages-3.01/man3/getutent.3
> ===================================================================
> --- man-pages-3.01.orig/man3/getutent.3
> +++ man-pages-3.01/man3/getutent.3
> @@ -44,7 +44,7 @@ getutent, getutid, getutline, pututline,
>  .br
>  .B void endutent(void);
>  .sp
> -.BI "void utmpname(const char *" file );
> +.BI "int utmpname(const char *" file );
>  .SH DESCRIPTION
>  .BR utmpname ()
>  sets the name of the utmp-format file for the other utmp
> @@ -116,6 +116,10 @@ and
>  return a pointer to a \fIstruct utmp\fP on success, and NULL on failure.
>  This \fIstruct utmp\fP is allocated in static storage, and may be
>  overwritten by subsequent calls.
> +.br
> +.BR utmpname()
> +returns a value of 0 if the new name was successfully stored, and a
> +value of -1 to indicate an error.
>  .SH FILES
>  /var/run/utmp  database of currently logged-in users
>  .br
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
