From: "Garrett Cooper" <yanegomi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [LTP] ltp getdents syscalls testcases and 2.6.27-rcX
Date: Sat, 27 Sep 2008 17:57:08 -0700
Message-ID: <364299f40809271757p4d446663j8ba53d34ee572471@mail.gmail.com>
References: <200809161427.36373.dgollub@suse.de>
	 <200809241605.24925.dgollub@suse.de>
	 <364299f40809250108x714a5ba7ob31fb89b0d7c195c@mail.gmail.com>
	 <200809251117.30959.dgollub@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200809251117.30959.dgollub-l3A5Bk7waGM@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Gollub <dgollub-l3A5Bk7waGM@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, ltp-list-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Adrian Bunk <bunk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Sep 25, 2008 at 2:17 AM, Daniel Gollub <dgollub-l3A5Bk7waGM@public.gmane.org> wrote:
> On Thursday 25 September 2008 10:08:28 Garrett Cooper wrote:
>> >> Yes, it is. There are numerous test cases in LTP which use:
>> >>         struct dirent,
>> >> by including /usr/include/dirent.h. The interesting part is, this guy
>> >> (/usr/include/dirent.h) in turn includes /usr/include/bits/dirent.h,
>> >> where the definition of struct resides. Following is the patch which
>> >> solves this issue along with page.h header file removal from 2.6.25
>> >> onwards, reported by Garret earlier.
>
> ^^^^^^^^^
>
>> >
>> > Tried the patch - ltp build with 2.6.27-rc linux headers sucessfully.
>> > Thanks for the info and the patch!
>> >
>> > Btw. man pages need to get also updated ... there are some pages which
>> > still mention <linux/dirent.h>.
>> >
>> > Garret, with 2.6.25 <asm/page.h> got removed - right?
>> > If so swapon(2) man page needs also get fixed:
>> >
>> > dgollub@marvin:~/projects/man-pages> grep -r "asm\/page.h" *
>> > man2/swapon.2:.B #include <asm/page.h>     /* to find PAGE_SIZE */
>> >
>> > best regards,
>> > Daniel
>> >
>> > ---
>> >
> [...]
>
>
>> I find it interesting because I honestly don't remember mentioning this
>> :D..
>>
>> Would you perhaps mean linux/signalfd.h vs sys/signalfd.h?
>
> I don't know either - i was just refering to Subrata's reply...
> Anyway, asm/page.h is really gone:
>
> commit ed7b1889da256977574663689b598d88950bbd23
> Author: Kirill A. Shutemov <k.shutemov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date:   Thu Feb 7 00:15:56 2008 -0800
>
>    Unexport asm/page.h
>
>    Do not export asm/page.h during make headers_install.  This removes
> PAGE_SIZE
>    from userspace headers.
>
>
>
> Garret, just to refresh your memory ..... ;)
> http://article.gmane.org/gmane.linux.ltp/4873
>
>
> best regards,
> Daniel
>
> ---
>
> diff --git a/man2/swapon.2 b/man2/swapon.2
> index 4c7008a..2a22be7 100644
> --- a/man2/swapon.2
> +++ b/man2/swapon.2
> @@ -40,8 +40,6 @@ swapon, swapoff \- start/stop swapping to file/device
>  .SH SYNOPSIS
>  .B #include <unistd.h>
>  .br
> -.B #include <asm/page.h>     /* to find PAGE_SIZE */
> -.br
>  .B #include <sys/swap.h>
>  .sp
>  .BI "int swapon(const char *" path ", int " swapflags );

Ah, yes... it's been a few months and unfortunately I have so much
correspondence fly by my email boxes it's hard to keep track of what
I've all said... my apologies.

The issue with all of this stuff, is that while we are implementing
some decent logic, we're unfortunately duplicating a lot of what's
contained within autotools for cross compilation, header finding, etc.
That being said though, what's being done is rather lightweight
compared to using autotools and I've seen a variety of complaints from
various forum/mailing list posts about the lack of cross-compilation
support with autotools (Mike Fry... could hint more info about this as
he was in a mailing list post I saw a while back -- will look up the
URI if needed).

What should be done (IMHO) is more tedious, but if done properly this
should only need to be done once:

1. Map out versions where header definitions are pushed from the
kernel sources to glibc (because every single time a header moves it
appears to go from kernel.org's stuff to gnu.org's stuff).
2. Implement a SINGLE compile-time check to determine what the kernel
vs glibc version is from the provided sources, and if they pass some
level of muster, then include the appropriate header. The result
should be contained within a top-level .mk file and with appropriate
CPPFLAGS passed to gcc, one can determine whether or not header A or
header B should be used.

I just got the LTP sources from CVS, I'm going to apply my makefile
changes again, shift everything, repost my results, and we'll discuss
this topic again as it's an important TODO item (IMHO).

-Garrett
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
