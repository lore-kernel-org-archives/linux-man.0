From: Sam Varshavchik <mrsam-W1w4QoW4mIDgLSHwZvcCBg@public.gmane.org>
Subject: Re: epoll design problems with common fork/exec patterns
Date: Sun, 02 Mar 2008 10:11:57 -0500
Message-ID: <cone.1204470717.369031.30230.500@commodore.email-scan.com>
References: <MDEHLPKNGKAHNMBLJOLKAEHCHNAC.davids@webmaster.com> <Pine.LNX.4.64.0710291147180.3387@alien.or.mcafeemobile.com> <47C42CA7.4030607@gmail.com> <Pine.LNX.4.64.0802261049040.27243@alien.or.mcafeemobile.com> <1204075804.5238.7.camel@linux.heathens.co.nz> <Pine.LNX.4.64.0802271131180.377@alien.or.mcafeemobile.com> <cfd18e0f0802280512q43a457d0sc9a8dc83c51e8e1c@mail.gmail.com> <Pine.LNX.4.64.0802281106050.7660@alien.or.mcafeemobile.com> <cfd18e0f0802290746p3cb7efc9j72394cd77ff37829@mail.gmail.com> <Pine.LNX.4.64.0802291111320.31028@alien.or.mcafeemobile.com> <cfd18e0f0802291154j612b4238i66cb8323b72814ca@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
    boundary="=_mimegpg-commodore.email-scan.com-30230-1204470717-0001";
    micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Davide Libenzi <davidel-AhlLAIvw+VEjIGhXcJzhZg@public.gmane.org>, Chris =?UTF-8?B?wqXCrw==?= Heath <chris-FSXMH2gLahXJKwlM9GxbOw@public.gmane.org>, David Schwartz <davids-Rrbileazn+l54TAoqtyWWQ@public.gmane.org>, dada1-fPLkHRcR87vqlBn2x/YWAg@public.gmane.org, =?UTF-8?B?TGludXgtS2VybmVsQFZnZXIuIEtlcm5lbC4=?= Org <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--=_mimegpg-commodore.email-scan.com-30230-1204470717-0001
Content-Type: text/plain; format=flowed; charset="US-ASCII"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Hijacking this epoll thread, the following related question occurs to me:

#Q8
#    Does an operation on a file descriptor affect the already collected but 
#not yet reported events?
#
#A8
#    You can do two operations on an existing file descriptor. Remove would 
#be meaningless for this case. Modify will re-read available I/O.

Why is EPOLL_CTL_DEL considered meaningless? A process is wrapping up its 
business and is preparing to remove the fd from the epoll set, and then 
close the file descriptor itself. In the meantime, the fd became readable, 
and a POLLIN event gets collected. So, what happens to the collected event, 
when the EPOLL_CTL_DEL operation is made?


--=_mimegpg-commodore.email-scan.com-30230-1204470717-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQBHysO9x9p3GYHlUOIRAqEQAJ9QcE4nl6OQ3ZxOXDdM7Mr9ZpXBWQCfSZwp
bxUJC9q3agGsE9Kd4EkV/w8=
=JtXf
-----END PGP SIGNATURE-----

--=_mimegpg-commodore.email-scan.com-30230-1204470717-0001--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
