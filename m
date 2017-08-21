From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: very small typographical issue
Date: Mon, 21 Aug 2017 11:38:14 +0200
Message-ID: <8224c67c-a49d-d07d-7f7e-e8797ae88a5c@gmail.com>
References: <CAGPdOpmNjxyZgGiMFcyfZ=GP4anu+nzQcp+cWbdXZi1_sR340A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGPdOpmNjxyZgGiMFcyfZ=GP4anu+nzQcp+cWbdXZi1_sR340A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Zipperer <atzipperer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Andrew,

On 08/18/2017 07:57 PM, Andrew Zipperer wrote:
> Hello!
> 
> Thank you for maintaining man pages.
> 
> At a terminal, I had the following interaction:
> 
> $ man alisp
> No manual entry for alisp
> See 'man 7 undocumented' for help when manual pages are not available.
>
> $ man 7 undocumented
> No manual entry for undocumented in section 7
> 
> After that, I typed
> $ man -7 undocumented
> 
> That took me to a relevant page.
> 
> So, it seems that the error message should be "See 'man -7 undocumented'
> for help..." rather than "See 'man 7 undocumented' for help..."

What distribution, and what man(1) program are you using? With the 
man(1) provided by the man-db package, the syntax "man -7 undocumented" 
isn't valid.

Cheers,

Michael


> Aside: I now recognize that it was misguided to type 'man alisp'
> 
> Best wishes,
> Andrew
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
