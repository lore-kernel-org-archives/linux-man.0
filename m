From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Subject: [PATCH] sleep.3: sleep suspends the thread, not the
	process. (Re: sleep(3) manpage)
Date: Wed, 3 Feb 2010 07:01:35 +0100
Message-ID: <cfd18e0f1002022201g9923cemfe3e7a8cbc481355@mail.gmail.com>
References: <9C1C3093-079B-4125-8621-56628C4A963B@cs.upt.ro>
	 <4B57F6F0.8010904@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4B57F6F0.8010904-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bill o gallmeister <bog.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Petre Mierlutiu <peter-zTtBy73WAK9hl2p70BpVqQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Jan 21, 2010 at 7:40 AM, bill o gallmeister
<bog.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Petre Mierlutiu wrote:
>> Hello,
>>
>> the sleep(3) manpage states, under DESCRIPTION, that "sleep() =A0mak=
es =A0the =A0calling =A0process sleep [...]". I believe this not to be =
true and the appropriate text would be: "sleep() makes the calling thre=
ad sleep [...]".
>>
>> =A0I think in the past Linux did implement it so it would block the =
process, I am not sure.
>> Anyway, sleep is currently implemented using nanosleep() and a simpl=
e threaded program can be written to prove sleep only sleeps the callin=
g thread.
>>
>> Manpages version: 3.21
>> Distribution: ubuntu 9.10
>>
>> Kind regards,
>>
>> Petre Mierlutiu--
>> To unsubscribe from this list: send the line "unsubscribe linux-man"=
 in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
> Signed-off-by: Bill O. Gallmeister <bog.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Thanks Bill.

Applied for 3.24.

Cheers,

Michael


> ---
> =A0man3/sleep.3 | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/man3/sleep.3 b/man3/sleep.3
> index 900b7fc..41575b7 100644
> --- a/man3/sleep.3
> +++ b/man3/sleep.3
> @@ -32,7 +32,7 @@ sleep \- Sleep for the specified number of seconds
> =A0.fi
> =A0.SH DESCRIPTION
> =A0.BR sleep ()
> -makes the calling process sleep until
> +makes the calling thread sleep until
> =A0.I seconds
> =A0seconds have elapsed or a signal arrives which is not ignored.
> =A0.SH "RETURN VALUE"
> @@ -58,5 +58,6 @@ from a signal handler or modifying the handling of
> =A0while sleeping will cause undefined results.
> =A0.SH "SEE ALSO"
> =A0.BR alarm (2),
> +.BR nanosleep (2),
> =A0.BR signal (2),
> =A0.BR signal (7)
> --
> 1.6.0.6
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
