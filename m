From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Q] getunwind.2: data or table?
Date: Sat, 13 Sep 2014 19:15:23 -0700
Message-ID: <5414FA3B.2000206@gmail.com>
References: <20140913123739.43b0946e@keeper.home.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140913123739.43b0946e-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marcela Maslanova <mmaslano-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Yuri,

On 09/13/2014 01:37 AM, Yuri Kozlov wrote:
> Hello.
> 
> In getunwind.2 first: 
> 
> otherwise, no data is copied, and the 
> call succeeds, returning the size that would be needed to store the unwind 
> data.
> 
> and second:
> 
> On success, getunwind  returns the size of unwind table.
> 
> As I understand size of unwind data > size of unwind table.
> What size really returned?

I think it should say "returns the size of the unwind data",
and I've made that change. Perhaps Marcela can confirm.

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
