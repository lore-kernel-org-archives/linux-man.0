From: Don Brace <don.brace-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
Subject: RE: [PATCH] smartpqi: initial submit of smartpqi man page
Date: Fri, 20 Oct 2017 22:10:55 +0000
Message-ID: <4993A297653ECB4581FA5C3C31323D196721BE80@avsrvexchmbx2.microsemi.net>
References: <150833943926.13185.7883447908516236321.stgit@brunhilda>
 <20171019213558.aelneujzgyucrye3@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171019213558.aelneujzgyucrye3-Z0uaYDh/Ni4SozaZsD9aTtHuzzzSOjJt@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Gerry Morong <gerry.morong-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, John Hall <John.Hall-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Kevin Barnett <kevin.barnett-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Bader Ali - Saleh <bader.alisaleh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Scott Teel <scott.teel-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Justin Lindley <justin.lindley-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>, Scott Benesh <scott.benesh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

> -----Original Message-----
> From: G. Branden Robinson [mailto:g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org]
> Sent: Thursday, October 19, 2017 4:36 PM
> To: Don Brace <don.brace-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
> Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Gerry Morong
> <gerry.morong-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>; John Hall <John.Hall-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>;
> Kevin Barnett <kevin.barnett-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>; Bader Ali - Saleh
> <bader.alisaleh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>; Scott Teel <scott.teel-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>;
> Justin Lindley <justin.lindley-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>; Scott Benesh
> <scott.benesh-dzo6w/eZyo2tG0bUXCXiUA@public.gmane.org>
> Subject: Re: [PATCH] smartpqi: initial submit of smartpqi man page
>=20
> At 2017-10-18T10:10:39-0500, Don Brace wrote:
> > This patch contains the initial submission of the
> > smartpqi man page.
>=20
> Hi Don,
>=20
> Please find attached my recommended changes.
>=20
> I made many changes, most of them formatting-related.

Really appreciate your effort!

>=20
> There are some issues I was unsure about; I left them in comments:
>=20
> To configure Microsemi Smart Family controllers, please refer to the
> controller's User Guide documentation.
> .\" Does this manual have a title?  Is it freely available online?
> .\" Does it have a stable URL?  Can this information be moved to the SEE
> .\" ALSO section?

There is currently no User Guide available on-line. The guide should be pac=
kaged with
the controller. There is a Documentation/scsi/smartpqi.txt  entry.

>=20
> .\" What is "ioaccel"?  This string appears nowhere in man-pages HEAD.
This is a term for RAID volumes. When an I/O request can go directly to a p=
hysical disk
bypassing the RAID engine in the controller. This results in a performance =
gain.

>=20
> .\" This example line is too wide for an 80-column TTY.
> .B cat /sys/class/scsi_disk/1:0:3:0/device/ssd_smart_path_enabled
How about:
cd /sys/class/scsi_disk/1:0:3:0/device/
cat ssd_smart_path_enabled
>=20
> .SS Supported \f[BI]ioctl\fP\/() operations
> .\" Does this subsection belong here, under .SH FILES ?
I see your point. This should be in a different section. We saw that hpsa.4=
 had
done the same thing.

Should this be under NOTES?

>=20
> And here's one more I just thought of (forest, trees...).
>=20
> Is "SmartPQI" the correct casing when referring to the product rather
> than the kernel module?

The driver name is smartpqi, perhaps omitting the SmartPQI or SMARTPQI woul=
d be best
for these sections.
>=20
> I checked the output on 80- and 191-column terminals and with a
> PostScript viewer.
>=20
> [1] And which doesn't "work everywhere", anyway, for instance on EBCDIC
> systems.  IIRC, the groff guys discourage defining a string escape this
> way.
> [2] I don't know of another term for this.  "In subsection ("SS")
>     headings, capitalize the first word in the heading, but otherwise
>     use lowercase, except where English usage (e.g., proper nouns) or
>     programming language requirements (e.g., identifier names) dictate
>     otherwise."
> [3] MTK: Is this a candidate for the "Preferred terms" subsection of
>     man-pages(7)?
>=20
> --
> Regards,
> Branden
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
