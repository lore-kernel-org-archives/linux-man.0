From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Typos in man2/getrlimit.2
Date: Thu, 8 Sep 2011 16:17:43 +0200
Message-ID: <CAKgNAkjzDLsBNZZSnPucU_f-uf=Xetr5sVD8phtJMZn7_o1Xzg@mail.gmail.com>
References: <AANLkTi=XkLN+t5iFT+uretO7V=p1mZnazH++DfFm42WK@mail.gmail.com>
 <AANLkTinoHfyBS=aoWfQhugxAV3DZva0W4Vy9y0rPCvh9@mail.gmail.com> <20101218224822.4e3478ae@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101218224822.4e3478ae-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Dec 18, 2010 at 8:48 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> =F7 Fri, 3 Dec 2010 06:52:19 +0100
> Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =D0=C9=DB=C5=D4:
>
>> Hello Denis,
>>
>> On Mon, Nov 29, 2010 at 9:20 PM, Denis Barbier <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
>> > Hello,
>> >
>> > Here are the last bits against ea03a3a.
>>
>> Thanks. Applied for 3.22.
>
> Still here, 3.32

Thanks Yuri. I've applied the missing piece of the fix from Denis.

Cheers,

Michael


> http://git.kernel.org/?p=3Ddocs/man-pages/man-pages.git;a=3Dblob;f=3D=
man2/getrlimit.2;h=3D52f99ab204993e981000da39842bdbc32788b6b2;hb=3Dc848=
60e9ca1c89bfc42591d3320e568d4656f1d4
>
>> > @@ -551,7 +551,7 @@ main(int argc, char *argv[])
>> > =9A =9A =9A =9A newp =3D &new;
>> > =9A =9A }
>> >
>> > - =9A =9A/* Set CPU time limit of target prcess; retrieve and disp=
lay
>> > + =9A =9A/* Set CPU time limit of target process; retrieve and dis=
play
>> > =9A =9A =9A =9Aprevious limit */
>> >
>> > =9A =9A if (prlimit(pid, RLIMIT_CPU, newp, &old) =3D=3D \-1)
>> >
>
>
>
> --
> Best Regards,
> Yuri Kozlov
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
