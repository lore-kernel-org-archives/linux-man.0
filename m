From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: missing section in the elf.5
Date: Sat, 19 Jun 2010 15:15:43 +0200
Message-ID: <AANLkTilVjgDgvjrq40OlObe7q3dZizoFY9q5ILoMPyGi@mail.gmail.com>
References: <20100223184933.0a0d876b@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100223184933.0a0d876b-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

On Tue, Feb 23, 2010 at 5:49 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
>
> .note =9A =9A This section holds information in the "Note Section" fo=
rmat
> described below. =9AThis section is of type SHT_NOTE. =9ANo attribute=
 types
> are used. =9AOpenBSD native executables usually contain
> a .note.openbsd.ident section to identify themselves, for the =9Akern=
el to
> bypass any compatibility ELF binary emulation tests when loading the
> file.
>
>
> I no find " "Note Section" format described below."

Sadly, neither do I. The Linux elf(5) man page seems to have come from
the BSDs, and I see the same problem in the OpenBSD and FreeBSD man
pages. My solution, not ideal, is to remove the words "described
below", and that's what I have done for man-pages-3.25.

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
