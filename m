From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fts.3 is not available in LFS builds
Date: Wed, 19 Mar 2014 14:29:42 +0100
Message-ID: <53299BC6.1000905@gmail.com>
References: <20140315135416.GA10430@infradead.org> <CAKgNAkinnsvoXT_FNxaS7L5Umo6va8OCVnTv-gZ5vvVSFi2--w@mail.gmail.com> <10506751.CXtlUKOUPc@vapier> <8628933.tn1CQP9rHn@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8628933.tn1CQP9rHn@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 03/19/2014 06:56 AM, Mike Frysinger wrote:
> On Tue 18 Mar 2014 23:12:45 Mike Frysinger wrote:
>> maybe we just ignore the issue since fts.h is dead anyways ?  just add a
>> section to the fts(3) page recommending people use ftw(3) instead ?
> 
> i might be completely off on fts vs ftw.  there's discussion on glibc lists 
> about maybe fixing fts to not suck.  perhaps we just link to the existing bug 
> on the topic ?
> https://sourceware.org/bugzilla/show_bug.cgi?id=11460

Who knows what'll happen. I put a link to that bug in the page source.

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
