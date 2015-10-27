From: Daniel Colascione <dancol-CpwT7fMy01Ydnm+yROfE0A@public.gmane.org>
Subject: Re: [patch] document that O_TMPFILE works with shm_open
Date: Tue, 27 Oct 2015 15:13:32 -0700
Message-ID: <562FF70C.5030600@dancol.org>
References: <562B2CD9.80901@dancol.org> <87ziz4c665.fsf@mid.deneb.enyo.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vp81Pdqo4cvN328sNTF98swsNN5WERBdH"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87ziz4c665.fsf-ZqZwdwZz9NfTBotR3TxKnbNAH6kLmebB@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fw-d32yF4oPJVt0XxTmqZlbVQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vp81Pdqo4cvN328sNTF98swsNN5WERBdH
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 10/27/2015 03:12 PM, Florian Weimer wrote:
> * Daniel Colascione:
>
>> This test program works fine. (Watch it work in strace.) This patch is=

>> against git master. It's okay to document accidental features, right?
>>
>> int
>> main()
>> {
>>     int shmfd =3D shm_open(".", O_TMPFILE | O_RDWR | O_EXCL, 0600);
>>     ftruncate(shmfd, 1000);
>>     mmap(NULL, 1000, PROT_READ | PROT_WRITE, MAP_SHARED, shmfd, 0);
>>
>>     return 0;
>> }
>
> This looks more like a bug to me.  I wouldn't count on it continuing
> to work.  glibc already tightened the rules for the name once.

I don't think they can break compatibility like that, and besides: it's
a useful feature, not a bug. Is it better for people to blindly open
files in /dev/shm? Because that's what they do today.


--vp81Pdqo4cvN328sNTF98swsNN5WERBdH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJWL/cMAAoJEN4WImmbpWBlYsgQAJBCrodsgjjFRtF6qhiscbql
0EhTg6gOrK4sQd5J+JaEnWGT6DxXzBQF6c8Dn5aukmKZ/6RHVuMeakjbSuB1kjCQ
hHs9U6p/gTQ7BUn3Y9kS6iR3RUrQIYmHiK3tqdhRoTISzeQhwQMLiLPx0HdqVnBJ
vX67spBeAfpaXR4hjuV6KqfUJHCjEpghFh0Sfh5oLr782xTR9zgmICu/nWtEFlDj
XDlLrB6iGuwyvjXnDyxE3kkhirAzuEIYTos0y7CZjMIVBA/lhJyFtNWq9Pcq1tcE
0sM2G/Oelwjh6O3jsqiVhRGjSelcOCY2vd229G6X1CvQMK9IdTzXTl5nZigpAawu
ikpaO/Qp1tH0CWXta5cMcVDz3xJVAZiUxUrZVwzwBCSICtpSJyWfZiRRB5DDhmMm
cUiGzHBRgI65pQgRXhI0qKGln9MQk2sVVrDOgEuWaNKSzEoQtkXwxhAVI0Srtinf
yOgd+ulIOCyzQBPU8ayz2IqSPCCZ1f3hmRWNNbVN6htds4/8mm2z5b66v/gVAGrG
QieJ/XBByB43gp5RtulIfAf8mE7/lcAwedrtWwQPeRe9pEnxy1LY0P9pAY1c1B29
icY6Xn8NB944MGTzYPhC+KIfGo6xKWbx5bgf9BFXzkSWFUq4zr95/7BpFmdZd07c
wlbZ+shoMIoMn7Jgc7C7
=NAqs
-----END PGP SIGNATURE-----

--vp81Pdqo4cvN328sNTF98swsNN5WERBdH--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
