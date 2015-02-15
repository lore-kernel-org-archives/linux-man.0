From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] syscall.2: add arm64 and mips
Date: Sun, 15 Feb 2015 16:13:02 +0100
Message-ID: <54E0B77E.5090306@gmail.com>
References: <20150118072204.GA12237@www.outflux.net> <20150215104609.GF32251@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150215104609.GF32251@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/15/2015 11:46 AM, Mike Frysinger wrote:
> On 17 Jan 2015 23:22, Kees Cook wrote:
>> --- a/man2/syscall.2
>> +++ b/man2/syscall.2
>> @@ -36,6 +36,8 @@
>>  .\"
>>  .\" 2002-03-20  Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
>>  .\"	- adopted for Linux
>> +.\" 2015-01-17, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> +.\"	Added mips and arm64.
>>  .\"
> 
> can we scrub changelogs from the man pages in general ?  they're usually 
> incomplete and rarely provide more than `git log -p`.

Yes, I tend to discourage them these days, but don't always worry too much if
someone adds them to  patch.

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
