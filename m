From: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Subject: Re: perf_event_open() manpage
Date: Mon, 22 Oct 2012 23:32:12 -0400 (EDT)
Message-ID: <alpine.DEB.2.02.1210222325200.23913@atom-power>
References: <alpine.DEB.2.02.1210221623340.19390@pianoman.cluster.toy> <alpine.DEB.2.02.1210221629560.29528@vincent-weaver-1.um.maine.edu> <CAKgNAkjKFiu2CPxq_eT5C_a2H0WKT_u_jX940=2xS9Smfkmgqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjKFiu2CPxq_eT5C_a2H0WKT_u_jX940=2xS9Smfkmgqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephane Eranian <eranian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, 22 Oct 2012, Michael Kerrisk (man-pages) wrote:

> Who do you propose as individuals and lists?. Ingo Molnar and Peter
> Zijlstra seem the obvious people to ask. I'm nor sure if there others
> who should be explicitly CCed (Stephane Eranian?). ANy other lists
> than linux-kernel?

When sending perf_event related patches to the kernel I ususally include
the maintainers plus Stephane:
  
  linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
  Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
  Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>
  Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
  Arnaldo Carvalho de Melo <acme-f8uhVLnGfZaxAyOMLChx1axOck334EZe@public.gmane.org>
  Stephane Eranian <eranian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

There's also the 
   linux-perf-users-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
list which was often more responsive than the maintainers when I was 
trying to track down various previously undocumented perf_event corner 
cases.

Thanks,

Vince

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
