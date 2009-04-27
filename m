From: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] Document fork() behaviour for the Linux native AIO  io_context
Date: Mon, 27 Apr 2009 08:46:47 -0400
Message-ID: <x491vrexo08.fsf@segfault.boston.devel.redhat.com>
References: <x49r5zvxgsg.fsf@segfault.boston.devel.redhat.com>
	<cfd18e0f0904262231sa4ac502r59d484190da05a7d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cfd18e0f0904262231sa4ac502r59d484190da05a7d-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Michael Kerrisk's message of "Mon, 27 Apr 2009 17:31:36 +1200")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, zach.brown-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:

> Hi Jeff,
>
> On Wed, Apr 15, 2009 at 5:54 AM, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote=
:
>> Hi,
>>
>> It was noted on lkml that the fork behaviour is documented for the p=
osix
>> AIO calls, but not for the Linux native calls. =C2=A0Here is a patch=
 which
>> adds a small blurb that folks will hopefully find useful.
>>
>> Signed-off-by: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>
>> Upon fork, the child process does not inherit the io_context_t data =
structures
>> returned by io_setup, and thus cannot submit further asynchronous I/=
O or
>> reap event completions for said contexts.
>
> Thanks.  I tweaked that very slightly, and have applied for man-pages=
-3.22.

Your tweak doesn't really make sense, and it isn't grammatically
correct.  How about:

nor does it inherit any asynchronous I/O contexts from its parent.

You can add in "see io_setup" if you like.

Thanks!
Jeff

> Cheers,
>
> Michael
>
> --- a/man2/fork.2
> +++ b/man2/fork.2
> @@ -83,7 +83,9 @@ The child does not inherit timers from its parent
>  The child does not inherit outstanding asynchronous I/O operations
>  from its parent
>  .RB ( aio_read (3),
> -.BR aio_write (3)).
> +.BR aio_write (3)),
> +nor does it inherit outstanding asynchronous I/O context from its pa=
rent
> +.RB ( io_setup (2)).
>  .PP
>  The process attributes in the preceding list are all specified
>  in POSIX.1-2001.
>
>
>
>> diff --git a/man2/fork.2 b/man2/fork.2
>> index ce93b3e..fb9008e 100644
>> --- a/man2/fork.2
>> +++ b/man2/fork.2
>> @@ -83,7 +83,9 @@ The child does not inherit timers from its parent
>> =C2=A0The child does not inherit outstanding asynchronous I/O operat=
ions
>> =C2=A0from its parent
>> =C2=A0.RB ( aio_read (3),
>> -.BR aio_write (3)).
>> +.BR aio_write (3)),
>> +nor does it inherit the asynchronous io_context returned by
>> +.BR io_setup (2).
>> =C2=A0.PP
>> =C2=A0The process attributes in the preceding list are all specified
>> =C2=A0in POSIX.1-2001.
>>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
