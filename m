From: Casper.Dik-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
Subject: Re: realpath(3) bugs
Date: Sat, 05 May 2012 20:10:29 +0200
Message-ID: <201205051810.q45IAU9K000837@ucsinet21.oracle.com>
References: <201205041122.q44BMDEO002270@ucsinet22.oracle.com> <CAKgNAkgjjKXx_Aw5iF_Phe7c7ixpqtfLSiV6fkTttN5ge4CGww@mail.gmail.com> <20120505000619.GA8038@iq> <201205050734.q457Y2AC002399@ucsinet22.oracle.com> <20120505155054.GA11316@iq>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120505155054.GA11316@iq> 
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


>On Sat, May 05, 2012 at 09:34:01AM +0200, Casper.Dik-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org wrote:
>
>> >The note about Solaris came from the 4.4BSD-Lite man page realpath.3
>> >(dated 1994-02-16) which says:
>> 
>> Yes, it noticed that it exists in both BSD and Linux manual pages;
>> I asssumed it was copied by one or the other.  Yours address was the
>> first I could find to get it remoed.
>
>I am not sure something needs to be removed. One might write
>"early versions of" when something is no longer true in recent versions.
>
>Andries
>
>
>[In case you wonder whether this variation ever existed:
>I have no old sources, at least not easily accessible,
>but where some man pages straightforwardly state

Right; but it certainly doesn't relate to *Solaris* possibly
to SunOS 4.x; but not Solaris.

>"The realpath() function derives, from the pathname pointed to
>by file_name, an absolute pathname that names the same file,
>whose resolution does not involve ".", "..", or symbolic links."
>
>, there are older SunOS man pages that say

Which version?  The realpath() version in Solaris 2.0 derives
from SVr4 and it certainly creates an absolute pathname.


>"realpath() resolves all links, symbolic links, and references to ``.''
>and ``..'' in file_name and stores the path in resolved_name.
>It can handle both relative and absolute path names:
>  * For absolute path names and the relative names whose resolved name
>cannot be expressed relatively (for example, ../../reldir), it returns
>the resolved absolute name.
>  * For the other relative path names, it returns the resolved relative name."
>
>Such descriptions strongly suggest that the documented version
>of realpath need not return an absolute pathname in all cases.]

In SunOS 4.x possibly but not in any Solaris 2.x release; I have
access to all of the Slaris 2.x releases.

Casper
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
