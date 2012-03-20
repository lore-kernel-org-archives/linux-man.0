From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] process_vm_{read,write}v(3): initial man pages
Date: Tue, 20 Mar 2012 19:27:31 +1300
Message-ID: <CAKgNAkg=3KokH5zFwThOsHt4gaM4fqcauFdmtihCgcFEV8_z1A@mail.gmail.com>
References: <1331358148-17235-1-git-send-email-vapier@gentoo.org>
 <CAKgNAkjhzh+zZ+GhOcbKsZpkeAgn6ua5K=zS=0_AUsUQ3GsQ_A@mail.gmail.com> <201203192050.48882.vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201203192050.48882.vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Christopher Yeoh <cyeoh-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Tue, Mar 20, 2012 at 1:50 PM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wro=
te:
> On Monday 19 March 2012 16:45:41 Michael Kerrisk (man-pages) wrote:
>> A quick question about one piece:
>> > +The count values might be individually capped according to
>> > \fIUIO_MAXIOV\fP. +If the Linux kernel is capped at smaller values=
, the
>> > C library will take care +of emulating the limit it exposes (if it=
 is
>> > bigger) so the user only needs to +care about that (what the C lib=
rary
>> > defines).
>>
>> I don't see anything in glibc that does this. Have I missed somethin=
g?
>
> i think you're correct. =A0the code in glibc atm is merely a syscall(=
). =A0i think
> the idea was to have the C library guarantee that and if moving forwa=
rd the
> kernel changes, the C library would update by adding a wrapper. =A0ma=
ybe just
> drop this sentence until that day comes ?

So, does the kernel currently impose a limit on the size of the iovec?
It wasn't immediately clear to me from a quick scan of the source.


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
