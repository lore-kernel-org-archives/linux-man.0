From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: import queue(3) man page ?
Date: Sun, 26 Oct 2008 04:22:46 -0400
Message-ID: <200810260422.47918.vapier@gentoo.org>
References: <200810260058.02527.vapier@gentoo.org> <20081026081335.GA20872@infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2714125.YgmiITtiMI";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081026081335.GA20872-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart2714125.YgmiITtiMI
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sunday 26 October 2008, Christoph Hellwig wrote:
> On Sun, Oct 26, 2008 at 12:58:01AM -0400, Mike Frysinger wrote:
> > how do people feel about importing the queue(3) man page from FreeBSD ?=
=20
> > glibc provides the queue.h and related headers from FreeBSD, so i think
> > it makes sense if we include relevant documentation as well ...
> > http://www.freebsd.org/cgi/cvsweb.cgi/src/share/man/man3/queue.3?rev=3D=
1.42
>
> We have queue(3).  I submitted it based on a FreeBSD one back in the
> days when Andries maintained the man pages.  Note that it's not a
> straight import all modern BSDs have a lot of changes over the old 4.4BSD
> version we're using.

it's the "updated" part that's the rub.  stock glibc has an ancient queue.h=
=20
while we've been updating it in Gentoo.  i thought i checked and found that=
=20
man-pages simply didnt have one, but it's more a matter of it being old.
=2Dmike

--nextPart2714125.YgmiITtiMI
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iQIcBAABAgAGBQJJBCjXAAoJEEFjO5/oN/WBsfwP/jazL1F1KMPUzqt/RzRHx4s8
afRADgBYY4bcV4V6Q87wpdjyJLKALhDOU+ZsCy9S+b6ftrOtGBhe5XoO0wJBE79F
0kGsVQxIfuvrCxIQ7WsqdSrzTytYhpMZX6DuOy5K5jn4MEkY5vonQ8X9nXQlshRH
quBSDdJ6gDtASsRHKaV0q26fcqoV/hzquIyN9FUSvhfXWLHnPH1i5nxJ6h/dqYYH
+Yuco1NamDxBrn/6mujDZz3EMnJI6ImqVLRJ6b+2ihgDLIQblOdSSogySxYxM96Z
7r0VPwwK8yJlXgOp6VCeyByJX1n/jZSg/WNw09RKe4v70NyOgSx4D8BGPfnqLNJZ
W7dUkxylgZxmdoEs8IjKVhHJdqJE+68MUC/wYiZSeZy+q+6FMOTc7B5qoQV+2Lyl
4HHiirCMXTSGL+LAF6ix+U4iYaaK5aowvz7YW6mT5It992h11Grvnz2/OwbBCZT1
oX5I+kJRxDCHc36BQReZDEEy0XWN72A4LNjjr5fseN3/j1FtpbVX8q4Vw5/MHNyc
vHrJxvTZRY/m6C8E4swTxsMKTEy/0z5Zco9GcedlFiYurluFNyd4ogREuI7O7G63
xbNmygzQK/+YhZyQKmEy3kno2UmG2rpIJyalmB9gGfPW2axNFTKk6qgjW8Mh6BjZ
G18gvtuYlOs65wa2LVOT
=Hg9D
-----END PGP SIGNATURE-----

--nextPart2714125.YgmiITtiMI--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
