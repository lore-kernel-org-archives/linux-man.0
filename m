From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] man ptrace: add extended description of various ptrace quirks
Date: Mon, 3 Oct 2011 07:35:16 +0200
Message-ID: <CAKgNAki5q-w+CkQR8iv35F5yEo6FM+0Z-W1LhhhcGJPMJBki7Q@mail.gmail.com>
References: <CAK1hOcPFXMoYsP6N6Hx5Qz3J4xj31TmSj7xo6SRVPegNCbhx7g@mail.gmail.com>
 <CAKgNAkicbgpSLZE6Wn_5ickGojJuGd4x2vMUG0491OB+O1Z_HA@mail.gmail.com> <CAK1hOcPqVYY93VFbDbMZ39iCr7VH+hP-bQT3u0SPJXmezN7H3Q@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK1hOcPqVYY93VFbDbMZ39iCr7VH+hP-bQT3u0SPJXmezN7H3Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denys Vlasenko <vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jan Kratochvil <jan.kratochvil-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko Carstens <heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org>, Chuck Ebbert <76306.1226-Crc3fnV8OO0XQ3Lr6voeyA@public.gmane.org>, Blaisorblade <blaisorblade-whZMOeQn8C0@public.gmane.org>, Daniel Jacobowitz <dan-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Denys,

On Fri, Sep 30, 2011 at 4:28 PM, Denys Vlasenko
<vda.linux-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> On Thu, Sep 29, 2011 at 9:08 PM, Michael Kerrisk <mtk.manpages@gmail.=
com> wrote:
>> So, I took your patch, and then did a global edit of the page to fix
>> various pieces (in the existing text, as well as do some language
>> clean-ups for the new text). In the process, I found a number of
>> pieces that are still unclear (some in the old text, some in your ne=
w
>> text). I also made some changes to your text that I'd like you to
>> check. I've marked each of these with FIXME below. Could you please
>> take a look at the FIXMEs, and write me a comment for each of these.
>> (I appreciate that in some cases, especially for the existing text,
>> you may not have a handy answer Denys, but if you (and others) can
>> give any help, that would be great.)
>>
>> Rather than you writing a new patch to this version of the page, I
>> think it might be easiest if you just replied to the FIXMEs inline
>> below, then I can revise the page in the light of your comments.
>
> =A0 =A0 =A0 Another group of commands makes the ptrace-stopped =A0tra=
cee =A0run. =A0 They
> =A0 =A0 =A0 have the form:
>
> =A0 =A0 =A0 =A0 =A0 ptrace(PTRACE_cmd, pid, 0, sig);
>
> =A0 =A0 =A0 where =A0cmd =A0is =A0PTRACE_CONT, PTRACE_DETACH, PTRACE_=
SYSCALL, PTRACE_SIN-
> =A0 =A0 =A0 GLESTEP, PTRACE_SYSEMU, or PTRACE_SYSEMU_SINGLESTEP.
>
> Cosmetics: cmd is, of course, CONT, DETACH,..., not PTRACE_CONT,
> PTRACE_DETACH...

Yes. But what I did to fix is change the ptrace call to:

      ptrace(cmd, pid, 0, sig);

(Having these constants shown without the "PTRACE_" prefix is a little
confusing.)

> =A0 =A0 =A0 If the tracee =A0is
> =A0 =A0 =A0 in =A0signal-delivery-stop, =A0sig =A0is =A0the signal to=
 be injected (if it is
> =A0 =A0 =A0 nonzero). =A0Otherwise, sig may be ignored. =A0(Recommend=
ed practice is =A0to
> =A0 =A0 =A0 always pass 0 in these cases.)
>
> Looks like (my) text in last sentence is confusing. I meant:
> "If you are resterting thracee from a ptrace-stop other than
> signal-delivery-stop, recommended practice is =A0to always pass
> sig =3D=3D 0".

Okay -- I made that change.

Thanks,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
