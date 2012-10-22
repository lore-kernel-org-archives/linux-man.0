From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: perf_event_open() manpage
Date: Mon, 22 Oct 2012 23:18:40 +0200
Message-ID: <CAKgNAkjKFiu2CPxq_eT5C_a2H0WKT_u_jX940=2xS9Smfkmgqg@mail.gmail.com>
References: <alpine.DEB.2.02.1210221623340.19390@pianoman.cluster.toy> <alpine.DEB.2.02.1210221629560.29528@vincent-weaver-1.um.maine.edu>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1210221629560.29528-6xBS8L8d439fDsnSvq7Uq4Se7xf15W0s1dQoKJhdanU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Weaver <vincent.weaver-e7X0jjDqjFGHXe+LvDLADg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephane Eranian <eranian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Vince.

>> After you've done a (quick?) pass through, we can send any revised
>> version you have out for wider comment. Sound okay?
>
> I've made a quick pass through and fixed some of the FIXME's.  In the
> process I merged in some changes I had been working on since the last time
> I submitted, but they were minor.
>
> One of your FIXMEs was to add the PR_ASK_PERF_EVENT_* prctl() calls
> to the prctl() manpage, but as far as I can tell this was already done.

True. The thing was you had a couple of hanging mentions of these
flags. I'll fix that.

> I'm ready to send things out for further comment if you are.

Who do you propose as individuals and lists?. Ingo Molnar and Peter
Zijlstra seem the obvious people to ask. I'm nor sure if there others
who should be explicitly CCed (Stephane Eranian?). ANy other lists
than linux-kernel?

I'll do some tweaking of the page and have a new version soon.

Thanks,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
