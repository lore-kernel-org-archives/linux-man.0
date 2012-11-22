From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] if_nametoindex.3: New page documenting if_nametoindex(3)
 and if_indextoname(3)
Date: Thu, 22 Nov 2012 05:40:45 +0100
Message-ID: <CAKgNAkj+XfQQYTXbEbS2u-=+vApFj0esKobe_KP1fSKsV0e3iw@mail.gmail.com>
References: <201211161728.qAGHSXoW015568@94.43.138.210.xn.2iij.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201211161728.qAGHSXoW015568-3Be77hNiKzq6hyM1GC9nJ01gUKqpuoTTXqFh9Ls21Oc@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: YOSHIFUJI Hideaki <yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Hideaki

Thanks for this page. I have a number of questions below. Could you
take a look and submit a new version please.

On Fri, Nov 16, 2012 at 6:28 PM, YOSHIFUJI Hideaki
<yoshfuji-VfPWfsRibaP+Ru+s062T9g@public.gmane.org> wrote:

[...]

> +.TH IF_NAMETOINDEX 3 2012-11-16 "GNU" "Linux Programmer's Manual"
> +.SH NAME
> +if_nametoindex, if_indextoname \- mappings between network interface names and indexes
> +.SH SYNOPSIS
> +.nf
> +.B #include <net/if.h>
> +.sp
> +.BI "unsigned int if_nametoindex(const char *" "ifname" );
> +.BI "char *if_indextoname(unsigned int ifindex, char *" "ifname);
> +.fi
> +.SH DESCRIPTION
> +The
> +.BR if_nametoindex ()
> +function returns the interface index corresponding to the name

How about:

function returns the index of the network interface corresponding to the name

> +.IR ifname .
> +
> +The
> +.BR if_indextoname ()
> +function returns a pointer to the network interface name
> +corresponding to the interface index
> +.IR ifindex .

function returns the name of the network interface
corresponding to the interface index
.IR ifindex .
The name is placed in the buffer pointed to by
.IR ifname .

> +The buffer
> +.I ifname
> +must be of at least IFNAMSIZ bytes.
> +
> +.SH RETURN VALUE
> +On success,
> +.BR if_nametoindex ()
> +returns the index number of the network interface;
> +On error, 0 is returned and
> +.I errno
> +is set appropriately.
> +
> +On success,
> +.BR if_indextoname ()
> +returns
> +.IR ifname ;
> +On error, NULL pointer is retuned and
> +.I errno
> +is set approptiately.

appropriately

> +.SH ERRORS
> +.BR if_nameindex ()
> +and
> +.BR if_nameindex ()

The above three lines are confused.

> +may fail and set
> +.I errno
> +if:
> +.TP
> +.B ENXIO
> +Interface not found.

ENXIO == No interface for this index, in my reading of the code.

(ENXIO can only occur for if_indextoname(), as far as I can tell.)

> +.PP
> +.BR if_nametoindex ()
> +may also fail for any of the errors specified for
> +.BR socket (2),
> +.BR ioctl (2).

Perhaps worth explicitly mentioning ENOSYS "Operation not supported by
this kernel"?

> +.PP
> +.BR if_indextoname ()
> +may also fail for any of the error specified for
> +.BR if_nameindex (3).

The preceding seems incorrect to me. I think it's any of the errors
for socket(2) or ioctl().

> +.SH CONFORMING TO
> +RFC\ 3493, POSIX.1-2001.
> +.SH HISTORY

Replace the above SH line by a blank line. The following line can just
be part of CONFORMING TO.

> +This function first appeared in BSDi.
> +.SH SEE ALSO
> +.BR getsockopt (2),
> +.BR setsockopt (2),

Why have the two preceding references?

> +.BR getifaddrs (3),
> +.BR if_indextoname (3),

Remove the preceding line.

> +.BR if_nameindex (3),
> +.BR if_nametoindex (3),

Remove the preceding line.

Cheers,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
