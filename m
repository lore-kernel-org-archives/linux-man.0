From: Alex Roper <aroper-63aXycvo3TyHXe+LvDLADg@public.gmane.org>
Subject: Re: Possible typo in madvise(2)
Date: Tue, 01 Apr 2014 15:22:54 -0400
Message-ID: <533B120E.1090406@umich.edu>
References: <5334B14B.7070409@umich.edu> <533B0303.2000601@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <533B0303.2000601-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Sorry for my confusion.

Checking other sources I see MADV_DONTNEED results in modifications to
private mappings being lost (the section on zero-filling non-file-backed
pages address this, in retrospect) which clearly changes semantics.

I had noticed that MADV_DONTFORK can result in different behavior after
a fork (eg, a parent mmaps a file, madvises dontfork, then forks, and
the child writes to the page -- with madvise, the page is updated,
visible to both processes, as is the backing file, without it the child
will segfault) and thought there might be a simple typo.

Alex

On 04/01/2014 02:18 PM, Michael Kerrisk (man-pages) wrote:
> On 03/28/2014 12:16 AM, Alex Roper wrote:
>> Version: Current git repo
>>
>> The first paragraph of DESCRIPTION states that madvise does not change
>> the semantics of an application except in the case of MADV_DONTNEED,
>> which I believe should read MADV_DONTFORK.
> 
> Alex, 
> 
> MADV_DONTNEED does change the semantics. But, could you say more
> about wht you think MADV_DONTFORK should have been written here 
> instead? (Perhaps some fix is needed to the page.)
> 
> Thanks,
> 
> Michael
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
