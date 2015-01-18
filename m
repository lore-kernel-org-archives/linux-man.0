From: enh <enh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: utimensat(2) may/must confusion
Date: Sun, 18 Jan 2015 10:13:26 -0800
Message-ID: <CAJgzZopXq22ODuCBTQakhiKEnAHBCn1E+2wVg8B5fhd1wHWWzw@mail.gmail.com>
References: <CAJgzZooHgi2_kqTDLA42KhHOjH6byPQLap2-11KfpfV3TDb03A@mail.gmail.com>
 <54BB8FD7.1060501@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54BB8FD7.1060501-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Jan 18, 2015 at 2:49 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I'm reluctant to note that point too prominently, since it's
> obviously not the kind of thing we want to encourage user-space
> programmers to do, but at the bottom of NOTES, I added:
>
>        If  both  tv_nsec  fields  are  specified as UTIME_OMIT, then the
>        Linux implementation of utimensat() succeeds  even  if  the  file
>        referred to by dirfd and pathname does not exist.
>
> Okay?

sgtm. anyone who tries to use that man page without carefully reading
the NOTES and BUGS sections is going to have a bad time anyway. (plus
i suspect that one day this will migrate to the BUGS section :-) )

thanks!
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
