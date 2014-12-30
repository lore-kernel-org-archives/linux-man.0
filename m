From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getlogin.3: Reformat thread-safety information
Date: Tue, 30 Dec 2014 21:39:31 +0100
Message-ID: <CAKgNAkjD2kAczQxH_hs7nx+GNT7uiVhxiBKOj2WV8qdgn45GXw@mail.gmail.com>
References: <1413518358-32200-1-git-send-email-penght@cn.fujitsu.com>
 <5440B1A9.8020304@gmail.com> <5440B745.9020003@cn.fujitsu.com>
 <5440BC77.3040906@gmail.com> <CAE2sS1gRBH=Xw671FRynxCYej7uhYTuJ4pxXC0+6_s78VGJayQ@mail.gmail.com>
 <54460FB4.40906@cn.fujitsu.com> <544FFE19.3040503@gmail.com>
 <54A2AB1A.3040207@gmail.com> <CAE2sS1icKhKdiT28s=5SiODeKax7s0LhHMn-pEF3ED_p6jMX7w@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAE2sS1icKhKdiT28s=5SiODeKax7s0LhHMn-pEF3ED_p6jMX7w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Dec 30, 2014 at 3:51 PM, Carlos O'Donell
<carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org> wrote:
> On Tue, Dec 30, 2014 at 8:39 AM, Michael Kerrisk (man-pages)
> <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Ping on my question at the end of this mail
>>> Do you have an idea of how long the review process might take?
>
> Given Alex's work I would estimate anywhere between 6 months and a
> year for a single person to review all the functions.
>
> The work had a narrow scope in order to complete on those timelines.
> For functions that were known either to be safe, or known to be
> unsafe, we made a judgement call at the time to review them or not.
> You can see this by looking at the per-function safety comments.
> Functions that were not documented were not reviewed, but those
> missing functions were added as comments in the documentation i.e.
> look for "@c FIXME these are undocumented:". There are 18 functions in
> filesys.texi, 9 in libdl.texi, 118 in threads.texi, and 2 in
> users.texi which are not documented and thus were skipped in this
> first round. I did not want their lack of documentation to stall this
> work.
>
> I am happy to see stubs in place in the glibc manual for all of the
> undocumented functions, and I'm happy to see the stubs have safety
> notations.

Hi Carlos,

Maybe you have misunderstood my point. I don't expect Peng Haitao and
his colleagues to repeat Alexandre's work, but I am hoping that he
might compare the glibc annotations with the man-pages annotations,
and account for the differences/make fixes as needed.

Cheers,

Michael




-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
