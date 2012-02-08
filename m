From: starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org
Subject: Re: suggestion for improvement to vfork() man page
Date: Tue, 07 Feb 2012 20:13:19 -0500
Message-ID: <6.2.5.6.2.20120207195939.05b07c90@binnacle.cx>
References: <6.2.5.6.2.20120207164707.03c1f410@binnacle.cx>
 <CAKgNAkjT05H1a9bk+d4XsEEsjUu0YEP10DDACCtBVsJ6OEsRYw@mail.gmail.com> <CAKgNAkjT05H1a9bk+d4XsEEsjUu0YEP10DDACCtBVsJ6OEsRYw
 @mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjT05H1a9bk+d4XsEEsjUu0YEP10DDACCtBVsJ6OEsRYw
 @mail.gmail.com>
References: <6.2.5.6.2.20120207164707.03c1f410-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org>
 <CAKgNAkjT05H1a9bk+d4XsEEsjUu0YEP10DDACCtBVsJ6OEsRYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

At 12:04 PM 2/8/2012 +1300, Michael Kerrisk wrote:
>Hi,
>
>On Wed, Feb 8, 2012 at 10:50 AM,  <starlight-Utvwg/EOxnhfq8cQ1yknNg@public.gmane.org> wrote:
>> +(However, on such systems,
>> +the preferred standard way of accomplishing the same result is to use
>> +.BR posix_spawn (3).)
>>
>> I'm not sure I agree on this.  Linux posix_spawn()
>> calls fork()
>
>I think isn't quite correct. I believe glibc's posix_spawn uses
>vfork() where it can. See sysdeps/posix/spawni.c::spawni().

Looked at glibc-2.9 and posix_spawn() uses
fork() in only when no process attibutes are
modified (i.e. it respects the AIX and Solaris
semantics of vfork though this is a bit irrelevent
since AIX and Solaris have kernel-native support
for posix_spawn) or when a non-standard
POSIX_SPAWN_USEVFORK flag is present.  It's
rather muddy so I stick with #ifdef vfork()
for Linux and #ifdef posix_spawn() for the
*nixes.

>
>So, I'll change that last sentence to
>
>[[
>(POSIX.1-2008 removed vfork() from the standard; the POSIX rationale
>for  the posix_spawn(3) function notes that that function, which
>provides functionality equivalent to fork(2)+exec(3) is designed 
>to be implementable on systems that lack an MMU.)
>]]
>
>What do you think?

That's fair.  Perhaps the posix_spawn() page should
have some text regarding the conditional use of vfork()
under the covers.  I seen no mention of vfork() on
the die.net page, and can't find it on kernel.org.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
