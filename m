From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] rpc.5: ffix
Date: Fri, 5 May 2017 23:26:22 -0400
Message-ID: <20170506032620.2jjq5almd6pgf2bd@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gvujxkteej4m5let"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--gvujxkteej4m5let
Content-Type: multipart/mixed; boundary="l2wbnmjar7632w7w"
Content-Disposition: inline


--l2wbnmjar7632w7w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Is there a recommended best practice for itemized (but not enumerated)
lists?  I don't know that my own is widely shared, so I did not make
such a change here.

But if I were to do so, I would either recast this page's 3-item list
into prose or use the indented paragraph macro with a bullet symbol for
a tag:

.IP \(bu
name of server for the RPC program
.IP \(bu
RPC program number
.IP \(bu
aliases

Of course,

.TP
\(bu
name of server for the RPC program
[etc.]

would be equivalent.

Any advice?

>SNIP<

rpc.5: ffix

* Remove nop argument from HP macros.
* Remove nop DT macro.
* Replace LP macro with more commonly-used PP macro.

The above do not change the output whatsoever (confirmed with -Z).

* Use .I macro instead of font escapes, obtaining italic correction.

To see the above distinction, use -Tps, -Tpdf, or similar before and
after the change.

diff --git a/man5/rpc.5 b/man5/rpc.5
index 44b5acb0e..49831fd78 100644
--- a/man5/rpc.5
+++ b/man5/rpc.5
@@ -16,25 +16,26 @@ The
 file contains user readable names that
 can be used in place of RPC program numbers.
 Each line has the following information:
-.HP 10
+.HP
 name of server for the RPC program
 .br
 .ns
-.HP 10
+.HP
 RPC program number
 .br
 .ns
-.HP 10
+.HP
 aliases
-.LP
+.PP
 Items are separated by any number of blanks and/or
 tab characters.
 A \(aq#\(aq indicates the beginning of a comment; characters from
 the \(aq#\(aq to the end of the line are not interpreted by routines
 which search the file.
-.LP
-Here is an example of the \fI/etc/rpc\fP file from the Sun RPC Source
-distribution.
+.PP
+Here is an example of the
+.I /etc/rpc
+file from the Sun RPC Source distribution.
 .ft CW
 .nf
 #
@@ -72,7 +73,6 @@ nsed            100038
 nsemntd         100039
 .fi
 .ft
-.DT
 .SH FILES
 .TP
 .I /etc/rpc

Regards,
Branden

--l2wbnmjar7632w7w
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="man-pages-rpc5-ffix.diff"
Content-Transfer-Encoding: quoted-printable

commit 1f173880b25aa60a9bf838f7c4738f8dc0372959
Author: G. Branden Robinson <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Fri May 5 23:12:44 2017 -0400

    rpc.5: ffix
   =20
    * Remove nop argument from HP macros.
    * Remove nop DT macro.
    * Replace LP macro with more commonly-used PP macro.
   =20
    The above do not change the output whatsoever (confirmed with -Z).
   =20
    * Use .I macro instead of font escapes, obtaining italic correction.
   =20
    To see the above distinction, use -Tps, -Tpdf, or similar before and
    after the change.

diff --git a/man5/rpc.5 b/man5/rpc.5
index 44b5acb0e..49831fd78 100644
--- a/man5/rpc.5
+++ b/man5/rpc.5
@@ -16,25 +16,26 @@ The
 file contains user readable names that
 can be used in place of RPC program numbers.
 Each line has the following information:
-.HP 10
+.HP
 name of server for the RPC program
 .br
 .ns
-.HP 10
+.HP
 RPC program number
 .br
 .ns
-.HP 10
+.HP
 aliases
-.LP
+.PP
 Items are separated by any number of blanks and/or
 tab characters.
 A \(aq#\(aq indicates the beginning of a comment; characters from
 the \(aq#\(aq to the end of the line are not interpreted by routines
 which search the file.
-.LP
-Here is an example of the \fI/etc/rpc\fP file from the Sun RPC Source
-distribution.
+.PP
+Here is an example of the
+.I /etc/rpc
+file from the Sun RPC Source distribution.
 .ft CW
 .nf
 #
@@ -72,7 +73,6 @@ nsed            100038
 nsemntd         100039
 .fi
 .ft
-.DT
 .SH FILES
 .TP
 .I /etc/rpc

--l2wbnmjar7632w7w--

--gvujxkteej4m5let
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlkNQlAACgkQ0Z6cfXEm
bc7atQ//S/EIeIofWWkwr6dnawZCm4b2QFascf3EC5uMyMiYzObwfNDYMOX9aZTl
7vdUb8vG1NRMle+7pM2cQ53W03yb1ySIr3cQmcmt7mdnsmj3sQxLrOZ01pSBAT9P
Pv34HJyDRcfLMHNebYPVXScHV3iVQT7oaXc6OhIjUp6AgEOVus5ESBL8uxNP3Y4R
WXAy14dK6mdHJUTSrJJjvEnq91n/ti+MDpmyUTvj4/It8jGAhQC1P0QI/PlW/WdR
TKGkriN5bxa0k2rGTvK3+UbA6CLEOTVOxkn8bbh0YUH6X/uGcPktV4WCs8aB/HWz
SXA4tQWO3ZVFkYBzUv4LgDb7BvZZIoLtpoWTNLeHxdkcZhsdDRUn0u4pJUXI9e6G
k8BLPe2edp2G6eQOuqksnO/G0EtCRPn++LhiB6J97D5ZW87AChFdutNtXu03IYXU
3LAo+nYOt/IuWl92GO37e/fXsVIowQV6u8ucpESpWaB+Bbzm35iuUyYKQez7or2S
UpX/t+d/6XhvcZCKLW+mluOJPgs+k15ae2oveKlQi4nyZ6LzuXdsL8k66nIQu26/
Oiz5aqJ6VJBKDXfEmk3L01yJFWxQkJHfjO8m2RL+QBEVDbyTHuwYbEn8HDtJlBCi
GyuxLrt292H3pi43EECOUBZnl06QLw26Dv2pgWHOvK+D9MFcREA=
=sEvB
-----END PGP SIGNATURE-----

--gvujxkteej4m5let--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
