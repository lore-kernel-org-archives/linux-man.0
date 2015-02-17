From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] syscall.2: add arm64 and mips
Date: Tue, 17 Feb 2015 05:53:43 +0100
Message-ID: <CAKgNAkgUHMJf0QYjr42pws5FSBqrWgCVnpwg+wKj3jz-HCxEwQ@mail.gmail.com>
References: <20150118072204.GA12237@www.outflux.net> <20150215104609.GF32251@vapier>
 <54E0B77E.5090306@gmail.com> <20150215175107.GC3910@vapier>
 <CAGXu5jKyt2ZsFLhYrQpWfTWdipHYyCy1En3FObxYqxHuiLGgGA@mail.gmail.com> <20150217040247.GA4400@vapier>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150217040247.GA4400@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 17 February 2015 at 05:02, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On 16 Feb 2015 11:30, Kees Cook wrote:
>> On Sun, Feb 15, 2015 at 9:51 AM, Mike Frysinger wrote:
>> > On 15 Feb 2015 16:13, Michael Kerrisk (man-pages) wrote:
>> >> On 02/15/2015 11:46 AM, Mike Frysinger wrote:
>> >> > On 17 Jan 2015 23:22, Kees Cook wrote:
>> >> >> --- a/man2/syscall.2
>> >> >> +++ b/man2/syscall.2
>> >> >> @@ -36,6 +36,8 @@
>> >> >>  .\"
>> >> >>  .\" 2002-03-20  Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
>> >> >>  .\"       - adopted for Linux
>> >> >> +.\" 2015-01-17, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> >> >> +.\"       Added mips and arm64.
>> >> >>  .\"
>> >> >
>> >> > can we scrub changelogs from the man pages in general ?  they're usually
>> >> > incomplete and rarely provide more than `git log -p`.
>> >>
>> >> Yes, I tend to discourage them these days, but don't always worry too much if
>> >> someone adds them to  patch.
>> >
>> > in this case, i think Kees was following apparent convention rather than
>> > thinking he always add one.  so i'm suggesting we help out at least the
>> > people who are just trying to DTRT by scrubbing the tree of existing ones
>> > that aren't useful.
>>
>> Yeah, I tend to try to follow the convention in the file. It's wasn't
>> clear what to do. I'm happy to send a patch to wipe my entries, if
>> that's desired.
>
> i don't think we need to make you do that one off :).  if Michael is happy with
> scrubbing the code base, lets go that route.

While I (generally) discourage changelogs in the source, I'm not
concerned enough to actually do anything about this (and Kees don't
worry about a patch). In some cases, the changelogs do have actually
useful info (from pre-Git days), and even since then I myself find a
few entries are sometimes useful to get a quick idea of the evolution
of a page. Yes, some entries are just noise, but automating some
solution to remove them would be error prone and require moderate
effort for tiny benefit.

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
