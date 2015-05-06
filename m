From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mcheck(3): add a notice that the current implementation is not
 thread-safe
Date: Wed, 06 May 2015 07:05:53 +0200
Message-ID: <5549A131.5020404@gmail.com>
References: <5408D288.1050407@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5408D288.1050407-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tolga Dalman <tolga.dalman-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Toga,

On 09/04/2014 10:58 PM, Tolga Dalman wrote:
> Hello Michael,
> 
> mcheck is known to be unusable for quite some time with multi-threaded
> applications:
> 
> 	https://sourceware.org/bugzilla/show_bug.cgi?id=9939
> 
> Until yesterday (including many hours of bug-hunting) this fact was not
> known to me, thus, I would like to suggest to add a note in the mcheck(3) manual
> page (and probably in the GLIBC documentation as well). I think one sentence in
> the NOTES section should suffice.

It is sometime since your mail, but FYI, notes on the thread-non-safety of 
mcheck() were added to the page in the last months.

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
