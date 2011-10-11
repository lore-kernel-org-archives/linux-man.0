From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man scp
Date: Tue, 11 Oct 2011 16:54:41 +0200
Message-ID: <CAKgNAkhAetT2qXGM4y0zeMqdQD1HCOS2LZx6jpiMKT82qbBizA@mail.gmail.com>
References: <21495CC4-CE78-4174-8DD7-34EFEEF0BDF2@cap-lore.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <21495CC4-CE78-4174-8DD7-34EFEEF0BDF2-vN3M59HtaNxWk0Htik3J/w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Norman Hardy <norm-vN3M59HtaNxWk0Htik3J/w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Norman,

On Fri, Oct 7, 2011 at 9:56 PM, Norman Hardy <norm-vN3M59HtaNxWk0Htik3J/w@public.gmane.org> wrote:
> I discovered this problem on Apple's version of Linux.
> Two other systems had the same problem however.
> Google recommended you for man page bugs.

Sorry--only for some man pages. scp(1) isn't one of them, but take a look here:
http://man7.org/linux/man-pages/man_pages_other.html

Cheers,

Michael

> I may try to find out how to submit this to Apple too.
>
> The man page for scp is misleading.
> The last of the sequence of file operands is the destination directory name and not a file name.
> I conclude this from the claimed ancestry of the "rcp" command and also a few tests.
> The man page for rcp is clearer in this regard.
> It also seems to work if the last entry is indeed a file name at least if that name matches the source name.
> I have not tested other possibilities.
> I do not rule out the possibility that there is a bug in destination computer's scpd deamon, but it seems unlikely to me.
> I have done the test on two distinct destination systems.
>
> To be clear the tests that I have done carefully follow:
>
> I performed the following two shell commands:
>
> scp t1 ootbcomp.com:scpTest
> scp t2 t3 ootbcomp.com:scpTest
>
> I then verified that files t1, t2 and t3 had been correctly transmitted to the machine ootbcomp.com, into directory ~/scpTest where tilda evaluates to the same string on both machines.
>
> This is useful behavior which I use and which cannot be explained by the scp man page on any of several *nix systems that I tried.
>
> I suspect that I do not understand scp's behavior and thus decline to suggest how the man page should be fixed.



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
