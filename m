From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] smartpqi: initial submit of smartpqi man page
Date: Fri, 20 Oct 2017 19:38:08 -0400
Message-ID: <20171020233806.h63etx4r2hj3j5wt@crack.deadbeast.net>
References: <150833943926.13185.7883447908516236321.stgit@brunhilda>
 <20171019213558.aelneujzgyucrye3@crack.deadbeast.net>
 <4993A297653ECB4581FA5C3C31323D196721BE80@avsrvexchmbx2.microsemi.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oifkgiyn7f6ydqmi"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4993A297653ECB4581FA5C3C31323D196721BE80-d/0VHx0KLVy29+vl7/RAAEujk09f5ZhB0e7PPNI6Mm0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Don Brace <don.brace-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
Cc: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gerry Morong <gerry.morong-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, John Hall <John.Hall-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Kevin Barnett <kevin.barnett-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Bader Ali - Saleh <bader.alisaleh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Scott Teel <scott.teel-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Justin Lindley <justin.lindley-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Scott Benesh <scott.benesh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
List-Id: linux-man@vger.kernel.org


--oifkgiyn7f6ydqmi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

At 2017-10-20T22:10:55+0000, Don Brace wrote:
> > -----Original Message-----
> > From: G. Branden Robinson [mailto:g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> > I made many changes, most of them formatting-related.
>=20
> Really appreciate your effort!

Thanks!

> > There are some issues I was unsure about; I left them in comments:

Just FYI, these were as much for Michael Kerrisk's feedback as yours.
I'm just a volunteer like most people on the linux-man list, so please
don't feel that all of these issues have to be resolved before the page
can make it in; Mr. Kerrisk is the gatekeeper.

> > To configure Microsemi Smart Family controllers, please refer to the
> > controller's User Guide documentation.
> > .\" Does this manual have a title?  Is it freely available online?
> > .\" Does it have a stable URL?  Can this information be moved to the SEE
> > .\" ALSO section?
>=20
> There is currently no User Guide available on-line. The guide should be p=
ackaged with
> the controller. There is a Documentation/scsi/smartpqi.txt  entry.

My preference as a committed non-professional sysadmin is to never have
to dig up a piece of paper to find out how to configure my hardware.  :)

> > .\" What is "ioaccel"?  This string appears nowhere in man-pages HEAD.
> This is a term for RAID volumes. When an I/O request can go directly
> to a physical disk bypassing the RAID engine in the controller. This
> results in a performance gain.

I hope that's restricted to read operations.  ;-)

> > .\" This example line is too wide for an 80-column TTY.
> > .B cat /sys/class/scsi_disk/1:0:3:0/device/ssd_smart_path_enabled
> How about:
> cd /sys/class/scsi_disk/1:0:3:0/device/
> cat ssd_smart_path_enabled

I checked and the original too-wide line is also too wide on troff's
PostScript output device, and runs into the page margin.

Your solution is one obvious one; another would be to put a shell
line-continuation into the example.

=2EIP
For example:
=2Ein +4n
=2EEX
=2ERB "$ " cat /sys/class/scsi_disk/1:0:3:0/device/\\e
=2ERB "> " ssd_smart_path_enabled
0
=2EEE
=2Ein

Which renders as:

              For example:
                  $ cat /sys/class/scsi_disk/1:0:3:0/device/\
                  > ssd_smart_path_enabled
                  0

But with the user input in boldface.

> > .SS Supported \f[BI]ioctl\fP\/() operations
> > .\" Does this subsection belong here, under .SH FILES ?
> I see your point. This should be in a different section. We saw that hpsa=
=2E4 had
> done the same thing.
>=20
> Should this be under NOTES?

Yup, I noticed that, too.  When Michael K. has a chance to review my
suggestions, I'm happy to supply patches to cciss(4) and hpsa(4) to
"parallelize" the three.

> > And here's one more I just thought of (forest, trees...).
> >=20
> > Is "SmartPQI" the correct casing when referring to the product rather
> > than the kernel module?
>=20
> The driver name is smartpqi, perhaps omitting the SmartPQI or SMARTPQI
> would be best for these sections.

I have no preference here; I just wanted to make sure the orthography
was right.  I don't want anyone getting flamed by their trademark
lawyer.  :D

--=20
Regards,
Branden

--oifkgiyn7f6ydqmi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlnqiNQACgkQ0Z6cfXEm
bc6RpA//etyKm7HnaSqpcJZ3s6RlkM9HqeqpVE5oZELW2hAhVy1t2EVxM3yvgS3P
L3HN9vdD6RWB0oWoA+f9G3uIvpF+UKB9COqp5muCJm7SG++0s1NPGaD7Mpj1bYj5
ZpycBrS8if7LLJzY7NncnIXqnPJRimSmX5315e4871z7CDPho5PltcrT0SYQUNex
KMxzyzmbinPeDKOCsfSmH63QBMj8w3HfwQhjZEBc6akV/2HhFN3RqFUEUyIdQUrA
h8AH/dYtzb217db0DJiPdziDC7MpwueEnEl6momzD/oUGRESPK3k5ba7EjUg+zs9
EAJc8yJFTkpfkp3LVaxg+Fh+oztAJ0RTjbfcTy39YFhr6QQG7SAuCNbcHDr+5MP0
TNTU3mvRWbG+jA/s4F9Xv65nlIUq44ccHjQbUlJAnumsNQKVi+IyyN0n4Ym28dXS
HiBpzD9ChOyOjl9PcqW7v6hfcGdbU7iXSXA+wLw3Epv6anV4ej7mLrdYQBak2o/L
qUvBiFWGfkdo+B4redX5dvz+vsXYjC/1pmIl568vwdxjG/q5df0dnhPzX3cj8GfG
hJe9kwBZnxymhAqJzuoTQiDZzdlCPkHuCgQPoNdqqsg9igGnZtG1T62KZgGQgaJI
2R+j+0XQ/tW7nUfmOjwCP1WtwXAxVxUHp4VjVnLkQs0ZCfmVqeM=
=urQ+
-----END PGP SIGNATURE-----

--oifkgiyn7f6ydqmi--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
