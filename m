From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: typoes in current man pages
Date: Tue, 18 Mar 2014 20:19:00 +0100
Message-ID: <CAKgNAkj3qEHtE8_nPVBPVD7gOZ=o=swcZg8cS_i691-iAZaeaA@mail.gmail.com>
References: <alpine.LFD.2.11.1403181453060.4573@localhost>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.11.1403181453060.4573@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, Mar 18, 2014 at 8:05 PM, Robert P. J. Day <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org> wrote:
>
>   based on current git repo:
>
> _XOPEN_SOURCE typoes:
>
> man3/strtoul.3:XOPEN_SOURCE\ >=\ 600 || _BSD_SOURCE || _SVID_SOURCE || _ISOC99_SOURCE ||
> man3/strtol.3:XOPEN_SOURCE\ >=\ 600 || _BSD_SOURCE || _SVID_SOURCE || _ISOC99_SOURCE ||
>
> _BSD_SOURCE typoes:
>
> man2/fcntl.2:.BR BSD_SOURCE ,
>
> _GNU_SOURCE typoes:
>
> man7/socket.7:.B GNU_SOURCE

Fixed.Thanks for the report, Robert.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
