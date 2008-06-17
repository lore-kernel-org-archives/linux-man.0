From: Valdis.Kletnieks-PjAqaU27lzQ@public.gmane.org
Subject: Re: PR_SET_SECCOMP and PR_GET_SECCOMP doc (and bug?)
Date: Tue, 17 Jun 2008 12:12:14 -0400
Message-ID: <18697.1213719134@turing-police.cc.vt.edu>
References: <48565951.40603@gmail.com> <20080616162543.GA9552@duo.random>
            <cfd18e0f0806170632p27a5ccd2obadaf0dfd4ce64aa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1213719134_5877P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: Your message of "Tue, 17 Jun 2008 15:32:29 +0200."
             <cfd18e0f0806170632p27a5ccd2obadaf0dfd4ce64aa-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Andrea Arcangeli <andrea-atKUWr5tajBWk0Htik3J/w@public.gmane.org>, Ivana Varekova <varekova-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--==_Exmh_1213719134_5877P
Content-Type: text/plain; charset=us-ascii

On Tue, 17 Jun 2008 15:32:29 +0200, Michael Kerrisk said:
> On Mon, Jun 16, 2008 at 6:25 PM, Andrea Arcangeli <andrea-atKUWr5tajBWk0Htik3J/w@public.gmane.org> wrote:
> > On Mon, Jun 16, 2008 at 02:15:13PM +0200, Michael Kerrisk wrote:

> >>     PR_GET_SECCOMP (since Linux 2.6.23)
> >>         Return the secure computing mode  of  the  calling  thread.
> >>         Not  very  useful: if the caller is not in secure computing
> >>         mode, this operation returns 0; if the caller is in  secure
> >>         computing  mode, then the prctl() call will cause a SIGKILL
> >>         signal to be sent to the process.  This operation  is  only
> >>         available  if  the kernel is configured with CONFIG_SECCOMP
> >>         enabled.

Would it make sense to change the text to read "Not very useful for the
current implementation of mode=1" and/or add that it may be useful for
future modes that allow prctl() modes other than 1?

--==_Exmh_1213719134_5877P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFIV+JecC3lWbTT17ARAhveAKDY1DP3M9vUeQq+aX7JeUYE+P853QCg/yZo
KJ0cgJiZqSJ5xwj02OwZuag=
=Ypgt
-----END PGP SIGNATURE-----

--==_Exmh_1213719134_5877P--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
