From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small improvement for futex.2
Date: Sun, 29 Aug 2010 06:21:55 +0200
Message-ID: <AANLkTimmMExVD+ueQwB7QP6z+vBcAOEqArNyb9vxO7z4@mail.gmail.com>
References: <20100822184047.7d233455@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100822184047.7d233455-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

On Sun, Aug 22, 2010 at 4:40 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
> futex.2 describe syscall with 6 arguments.
>
> --- man-pages-git/man2/futex.2 =9A2010-07-17 09:02:09.000000000 +0400
> +++ /tmp/futex.2 =9A =9A =9A =9A2010-08-22 18:39:05.000000000 +0400
> @@ -239,7 +239,7 @@
> =9AInitial futex support was merged in Linux 2.5.7 but with different=
 semantics
> =9Afrom what was described above.
> =9AA 4-argument system call with the semantics
> -given here was introduced in Linux 2.5.40.
> +was introduced in Linux 2.5.40.
> =9AIn Linux 2.5.70 one argument
> =9Awas added.
> =9AIn Linux 2.6.7 a sixth argument was added \(em messy, especially

This change would lose some of the meaning of the sentence. I instead
changed "given here" to "described in this page" (for 3.26).

Thanks,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
