From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH man-pages v1] fcntl.2: update manpage with verbiage about
 open file description locks
Date: Wed, 30 Apr 2014 16:41:22 +0200
Message-ID: <53610B92.4000308@gmail.com>
References: <1398797474-744-1-git-send-email-jlayton@poochiereds.net>	<5360D56F.4070509@gmail.com> <20140430081501.3aca5cba@tlielax.poochiereds.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140430081501.3aca5cba-9yPaYZwiELC+kQycOl6kW4xkIHaj4LzF@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Layton <jlayton-vpEMnDpepFuMZCB2o+C8xQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Jeff,

Thanks for your reply. Comments below.

On 04/30/2014 02:15 PM, Jeff Layton wrote:
> On Wed, 30 Apr 2014 12:50:23 +0200
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

[...]

>> #      The record locks described above are associated with the  pro=
cess
>> #      (unlike  the  open file description locks described below).  =
This
>> #      has some unfortunate consequences:
>>
>> #      *  If a process holding a lock on a file closes any file desc=
rip=E2=80=90
>> #         tor  referring to the file, then all of the process's lock=
s on
>> #         the file are released, no matter which  file  descriptor  =
they
>> #         were  obtained  via.  This is bad: it means that a process=
 can
>=20
> "were obtained via" is a little awkward. How about "regardless of whi=
ch
> file descriptor on which they were obtained".

Yeah, it is clumsy. I fixed, and also otherwise made the text more=20
precise/concise:

       *  If a process closes any file descriptor referring to a file,
          then  all  of the process's locks on that file are released,
          regardless of the file descriptor(s) on which the locks were
          obtained.
=20

[...]

>>   ERRORS
>>   [...]
>>
>> #      EINVAL cmd is  F_OFD_SETLK,  F_OFD_SETLKW,  or  F_OFD_GETLK, =
 and
>> #             l_pid was not specified as zero.
>>
>=20
> The kernel will also return -EINVAL if it doesn't recognize the cmd
> value being passed in. It may be worth mentioning that as well as
> that's the best mechanism to tell whether the kernel actually support=
s
> OFD locks.

Good point. I added that error case under ERRORS, and added this text t=
o
the top of the page:

       Certain  of  the operations below are supported only since a par=
=E2=80=90
       ticular Linux kernel version.  The preferred method  of  checkin=
g
       whether  the  host  kernel  supports a aprticular operation is t=
o
       invoke fcntl() with the desired cmd value and then  test  whethe=
r
       the  call failed with EINVAL, indicating that the kernel does no=
t
       recognize this value.

=3D=3D

And getting back to the missed piece:

>>>> The "EACCES or EAGAIN" thing comes from POSIX, because different
>>>> implementations of tradition record locks returned one of these er=
rors.
>>>> So, portable applications using traditional locks must handle eith=
er
>>>> possibility. However, that argument doesn't apply for these new lo=
cks.
>>>> Surely, we just want to say "set errno to EAGAIN" for this case?
>
> Ahh good catch. I fixed that in the glibc doc but I missed it here.
> Yes, we should be clear that this OFD locks will get back EAGAIN in
> this situation. Can you fix it, or would you prefer I respin the
> patch?

No problem. I fixed it.

Thanks for checking over my revisions!

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
