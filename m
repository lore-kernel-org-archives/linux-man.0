From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Documenting the (dynamic) linking rules for symbol versioning
Date: Sat, 13 May 2017 14:10:28 +0200
Message-ID: <530d3725-1d46-17d4-1619-f596f0d4570a@gmail.com>
References: <b3a962de-6703-d8b9-18f7-138185171475@gmail.com>
 <66c61101-f44f-2bbb-5ed2-b43c5d764e76@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <66c61101-f44f-2bbb-5ed2-b43c5d764e76-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Siddhesh Poyarekar <siddhesh-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, "H.J. Lu" <hjl.tools-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Carlos,

On 05/05/2017 09:51 PM, Carlos O'Donell wrote:
> On 04/19/2017 11:07 AM, Michael Kerrisk (man-pages) wrote:
>> The documentation around symbol versioning as used by the glibc dynamic
>> linker (DL) is currently rather weak, and I'd like to add some pieces to
>> various man pages (ld.so(8), dlsym(3), and possibly others) to improve
>> this situation. Before that though, I'd rather like to check my
>> understanding of the rules.
> 
> This is great!
> 
> Can I make one simple request?
> 
> Please post all of your test case and we help you get them checked into
> glibc's regression testsuite so we don't change any of the behaviour you
> have documented without noticing it.
> 
> I'd like us to agree to ensure we cover everything you mention in a
> regression test.

I'm happy to help here, bug do not have a CLA, and do not plan
to get one. But, I can place whatever code might be useful under
a permissive license (assuming that works for you).

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
