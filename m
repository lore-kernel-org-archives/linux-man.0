From: Alex Roper <aroper-63aXycvo3TyHXe+LvDLADg@public.gmane.org>
Subject: Re: Possible typo in madvise(2)
Date: Tue, 01 Apr 2014 15:25:22 -0400
Message-ID: <533B12A2.4050405@umich.edu>
References: <5334B14B.7070409@umich.edu> <533B0303.2000601@gmail.com> <533B120E.1090406@umich.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <533B120E.1090406-63aXycvo3TyHXe+LvDLADg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

> I had noticed that MADV_DONTFORK can result in different behavior after
> a fork (eg, a parent mmaps a file, madvises dontfork, then forks, and
> the child writes to the page -- with madvise, the page is updated,
> visible to both processes, as is the backing file, without it the child
> will segfault) and thought there might be a simple typo.
Typo: I flipped with and without madvise cases here.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
