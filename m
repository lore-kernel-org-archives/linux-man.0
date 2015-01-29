From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] cfree.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 29 Jan 2015 06:55:38 +0100
Message-ID: <54C9CB5A.7090007@gmail.com>
References: <1422425343-20809-1-git-send-email-mashimiao.fnst@cn.fujitsu.com> <54C8C28F.2040107@gmail.com> <54C98D65.9050100@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54C98D65.9050100-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/29/2015 02:31 AM, Ma Shimiao wrote:
> Hello Michael,
> On 01/28/2015 07:05 PM, Michael Kerrisk (man-pages) wrote:
>>> +.BR attributes (7).
>>>> +.TS
>>>> +allbox;
>>>> +lb lb lb
>>>> +l l l.
>>>> +Interface	Attribute	Value
>>>> +T{
>>>> +.BR cfree ()
>>>> +T}	Thread safety	MT-Safe /* In glibc */
>> What is the "?* In glibc */" for?
> This page records different versions of cfree.
> Like cfree in SunOS 4, SCO OpenServer, glibc and so on.
> I just can confirm thread safety of cfree in glibc.
> So, I added a comment to help users understand which cfree 
> I'm declaring.
> 
> Did I miss something or any good ideas?

Oh -- I see what you mean, Ma Shimiao. I did not look at
the whole page--it's a strange page indeed, and your
choice seems reasonable.

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
