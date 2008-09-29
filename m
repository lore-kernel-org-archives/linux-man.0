From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Small improvement in man page readdir(3)
Date: Mon, 29 Sep 2008 15:11:20 +0200
Message-ID: <cfd18e0f0809290611s18532b1dx8bc74bf6f47d8fec@mail.gmail.com>
References: <28ecc63c0809270704v627aeaa1v906718ddbb33cca5@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <28ecc63c0809270704v627aeaa1v906718ddbb33cca5-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Ricardo_Catalinas_Jim=E9nez?= <jimenezrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Ricardo

On Sat, Sep 27, 2008 at 4:04 PM, Ricardo Catalinas Jim=E9nez
<jimenezrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> In NOTES section says Linux use the d_type field of the struct dirent
> which is only true with certain filesystem like ext2 and ext3. With
> XFS and reiserfs d_type is always equal to 0.
> I think would be a good idea to add just a small comment like "Under
> certain filesystem like ext2 and ext3..." to avoid confussion.

Thanks.  I've added some text covering that point to readdir.3, and
also to getdents.2 (which is used to implement readdir(3)).

The fixes will be in man-pages-3.11, and are available on git now.

> Also there is a small typo in the SYNOPSIS section where there is an
> extra line break between the two includes:
> #include <sys/types.h>
>     //extra line break here
> #include <dirent.h>

An earlier commit makes this point redundant:

commit 15dd4fb58b96d3cf9cc88eab85bce8e7baf4f8c0
Author: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Fri Jul 4 22:38:01 2008 +0000

    Add documentation of readdir_r().
    Remove <sys/types.h> from SYNOPSIS; POSIX.1-2001 does not require i=
t.
    Some minor rewordings.

> I have the readdir(3) from 2007-07-30 which comes with the ubuntu 8.0=
4
> in the manpages-dev package version 2.77-1.

Thanks for the details.

> Thanks in advance for your attention.

And thanks very much for your report.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
=46ound a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
