From: Casper.Dik-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
Subject: Re: realpath(3) bugs
Date: Sat, 05 May 2012 09:34:01 +0200
Message-ID: <201205050734.q457Y2AC002399@ucsinet22.oracle.com>
References: <201205041122.q44BMDEO002270@ucsinet22.oracle.com> <CAKgNAkgjjKXx_Aw5iF_Phe7c7ixpqtfLSiV6fkTttN5ge4CGww@mail.gmail.com> <20120505000619.GA8038@iq>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120505000619.GA8038@iq> 
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andries E. Brouwer" <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


>I wrote the Linux man page on 1999-08-24.
>It was first included in man-pages-1.26.
>
>The note about Solaris came from the 4.4BSD-Lite man page realpath.3
>(dated 1994-02-16) which says:

Yes, it noticed that it exists in both BSD and Linux manual pages;
I asssumed it was copied by one or the other.  Yours address was the
first I could find to get it remoed.

>I forgot the details. What happens if some of the directories involved
>are not readable or not searchable? What happens if some parent
>directory was overmounted so that there is no absolute pathname
>in the system that refers to the same place as your relative pathname?

>From my reading from the source code, it would fail if it fails to find
the pathname, e.g., whem the pathname desn't exist, getcwd() fails,
chdir() fails (the very old implementation uses chdir() to the pathname or
its dirname and runs getcwd())  Later implementation use resolvepath()
(since 1997) and resolvepath() returns a relative pathname if resolvepat
does't find the root) and then combnes the outut with getcwd() removing
one component for each ".." in front of the pathname.

If either of the calls fail, realpath will fail and if it succeeds i returns
a absolute pathname.

Casper
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
