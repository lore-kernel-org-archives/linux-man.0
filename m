From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [patch] Document fork() behaviour for the Linux native AIO
	io_context
Date: Tue, 28 Apr 2009 17:10:30 +1200
Message-ID: <cfd18e0f0904272210v3960386bjcee6a8401dbed935@mail.gmail.com>
References: <x49r5zvxgsg.fsf@segfault.boston.devel.redhat.com>
	 <cfd18e0f0904262231sa4ac502r59d484190da05a7d@mail.gmail.com>
	 <x491vrexo08.fsf@segfault.boston.devel.redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <x491vrexo08.fsf-RRHT56Q3PSP4kTEheFKJxxDDeQx5vsVwAInAS/Ez/D0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, zach.brown-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jeff,

On Tue, Apr 28, 2009 at 12:46 AM, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>
>> Hi Jeff,
>>
>> On Wed, Apr 15, 2009 at 5:54 AM, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrot=
e:
>>> Hi,
>>>
>>> It was noted on lkml that the fork behaviour is documented for the =
posix
>>> AIO calls, but not for the Linux native calls. =A0Here is a patch w=
hich
>>> adds a small blurb that folks will hopefully find useful.
>>>
>>> Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>>
>>> Upon fork, the child process does not inherit the io_context_t data=
 structures
>>> returned by io_setup, and thus cannot submit further asynchronous I=
/O or
>>> reap event completions for said contexts.
>>
>> Thanks. =A0I tweaked that very slightly, and have applied for man-pa=
ges-3.22.
>
> Your tweak doesn't really make sense, and it isn't grammatically
> correct. =A0How about:
>
> nor does it inherit any asynchronous I/O contexts from its parent.
>
> You can add in "see io_setup" if you like.

Thanks for catching that.  I must have wrongly grabbed "outstanding"
from the previous phrase in the page.  I've made the change as below.

By the way, this raises a parallel question: what happens to
asynchronous I/O contexts on an execve(2)?

Cheers,

Michael

--- a/man2/fork.2
+++ b/man2/fork.2
@@ -83,7 +83,9 @@ The child does not inherit timers from its parent
 The child does not inherit outstanding asynchronous I/O operations
 from its parent
 .RB ( aio_read (3),
-.BR aio_write (3)).
+.BR aio_write (3)),
+nor does it inherit any asynchronous I/O contexts from its parent
+.RB ( see io_setup (2)).
 .PP
 The process attributes in the preceding list are all specified
 in POSIX.1-2001.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
