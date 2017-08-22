From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] Update move_pages(2) manpage to match kernel change
Date: Wed, 23 Aug 2017 00:58:44 +0200
Message-ID: <CAKgNAkh8mcyVuvMYqitB1OO3eo3_fy3gg_fakGmQ+34sYjz1GQ@mail.gmail.com>
References: <e6c853bb0a1dd5f96133a754024f230c@github.mail.kapsi.fi>
 <2646ef81-62da-13d5-2793-18149df3659b@gmail.com> <94ae97965e44ee23301c31a114577315@github.mail.kapsi.fi>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <94ae97965e44ee23301c31a114577315-YEAOTlfEoH7f77WrBdCPMDwVj7d+iGoU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Otto Ebeling <oebeling-YEAOTlfEoH7f77WrBdCPMDwVj7d+iGoU@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Otto,

On 22 August 2017 at 10:14, Otto Ebeling <oebeling-YEAOTlfEoH7f77WrBdCPMDwVj7d+iGoU@public.gmane.org> wr=
ote:
> Hi,
>
>>
>>        To  move  pages  in  another process requires the following privi=
=E2=80=90
>>        leges:
>>
>>        *  In kernels up to and including Linux 4.12: the caller  must  b=
e
>>           privileged  (CAP_SYS_NICE)  or the real or effective user ID o=
f
>>           the calling process must match the real or saved-set user ID o=
f
>>           the target process.
>>
>>        *  The  older rules allowed the caller to discover various virtua=
l
>>           address choices made by the  kernel  that  could  lead  to  th=
e
>>           defeat  of  address-space-layout  randomization  for  a proces=
s
>>           owned by the same UID as the caller,  the  rules  were  change=
d
>>           starting with Linux 4.13.  Since Linux 4.13, permission is gov=
=E2=80=90
>>           erned by a ptrace access mode PTRACE_MODE_READ_REALCREDS  chec=
k
>>           with respect to the target process; see ptrace(2).
>>
>> Look okay?
>
>
> Thanks for fixing that up, makes sense to document the historical behavio=
r!
> Regarding the references to "Linux 4.13", I wanted to point out I got ema=
ils
> that indicate the patch was/will be merged to "3.18-stable tree, 4.12-sta=
ble
> tree, 4.4-stable tree, 4.9-stable". See e.g.
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/stable-queue.git/c=
ommit/?id=3Db52c5821b05b33af36b77ba5cfee54818828508f
>
> Not sure how to word this in a man page - maybe something like "4.13, and
> updated versions of 3.18, 4.12, 4.4, and 4.9". What do you think?

The cross-product if individual patches that hit stable and the
various stable versions is just too complex too track in man pages, so
I do not even try...

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
