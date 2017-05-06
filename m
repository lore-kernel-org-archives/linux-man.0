From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] un-document "URL" macro in man(7)
Date: Fri, 5 May 2017 22:49:52 -0400
Message-ID: <20170506024950.e77fxxftbdgadnna@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="35i7mqhbvr3swdzo"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--35i7mqhbvr3swdzo
Content-Type: multipart/mixed; boundary="rr5bsfo5362vq7vm"
Content-Disposition: inline


--rr5bsfo5362vq7vm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

According to my greps, the .URL macro is nowhere used in the man-pages
project.  .UR and .UE, from the groff man macros, are used 73 times.

Please find attached a patch to un-document .URL in favor of .UR and
.UE.

Regards,
Branden

--rr5bsfo5362vq7vm
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="man-pages-man7-undocument-URL.diff"

diff --git a/man7/man.7 b/man7/man.7
index cf03c5d70..dec7f9038 100644
--- a/man7/man.7
+++ b/man7/man.7
@@ -261,81 +261,33 @@ its results are like those of the
 .B \&.IP
 command.
 .SS Hypertext link macros
-(Feature supported with
-.B groff
-only.)
-In order to use hypertext link macros, it is necessary to load the
-.B www.tmac
-macro package.
-Use the request
-.B .mso www.tmac
-to do this.
-.TP 9m
-.BI \&.URL " url link trailer"
-Inserts a hypertext link to the URI (URL)
-.IR url ,
-with
-.I link
-as the text of the link.
-The
-.I trailer
-will be printed immediately afterward.
-When generating HTML this should translate into the HTML command
-\fB<A HREF="\fP\fIurl\fP\fB">\fIlink\fP\fB</A>\fP\fItrailer\fP.
-.\" The following is a kludge to get a paragraph into the listing.
 .TP
-.B " "
-This and other related macros are new, and
-many tools won't do anything with them, but
-since many tools (including troff) will simply ignore undefined macros
-(or at worst insert their text) these are safe to insert.
-.\" The following is a kludge to get a paragraph into the listing.
-.TP
-.B " "
-It can be useful to define your own
-.B URL
-macro in manual pages for the benefit of those viewing it with a roff
-viewer other than
-.BR groff .
-That way, the URL, link text, and trailer text (if any) are still visible.
-.\" The following is a kludge to get a paragraph into the listing.
-.TP
-.B " "
-Here's an example:
-.RS 1.5i
-\&.de URL
-.br
-\\\\$2 \\(laURL: \\\\$1 \\(ra\\\\$3
-.br
-\&..
-.br
-\&.if \\n[.g] .mso www.tmac
-.br
-\&.TH
-.I ...
-.br
-.I (later in the page)
-.br
-This software comes from the
-.br
-\&.URL "http://www.gnu.org/" "GNU Project" " of the"
-.br
-\&.URL "http://www.fsf.org/" "Free Software Foundation" .
-.RE
-.\" The following is a kludge to get a paragraph into the listing.
+.BI \&.UR " url"
+Insert a hypertext link to the URI (URL)
+.IR url ,
+with all text up to the following
+.B \&.UE
+macro as the link text.
 .TP
-.B " "
-In the above, if
-.B groff
-is being used, the
-.B www.tmac
-macro package's definition of the URL macro will supersede the locally
-defined one.
+.B \&.UE \c
+.RI [ trailer ]
+Terminate the link text of the preceding
+.B \&.UR
+macro, with the optional
+.I trailer
+(if present, usually a closing parenthesis and/or end-of-sentence
+punctuation) immediately following.
+For non-HTML output devices (e.g.,
+.BR "man -Tutf8" ),
+the link text is followed by the URL in angle brackets; if there is no
+link text, the URL is printed as its own link text, surrounded by angle
+brackets.
+(Angle brackets may not be available on all output devices.)
+For the HTML output device, the link text is hyperlinked to the URL; if
+there is no link text, the URL is printed as its own link text.
 .PP
-A number of other link macros are available.
-See
-.BR groff_www (7)
-for more details.
+These macros have been supported since GNU Troff 1.20 (2009-01-05) and
+Heirloom Doctools Troff since 160217 (2016-02-17).
 .SS Miscellaneous macros
 .TP 9m
 .B \&.DT
@@ -482,9 +434,11 @@ By all means include full URLs (or URIs) in the text itself;
 some tools such as
 .BR man2html (1)
 can automatically turn them into hypertext links.
-You can also use the new
-.B URL
-macro to identify links to related information.
+You can also use the
+.B UR
+and
+.B UE
+macros to identify links to related information.
 If you include URLs, use the full URL
 (e.g.,
 .UR http://www.kernel.org

--rr5bsfo5362vq7vm--

--35i7mqhbvr3swdzo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlkNOcIACgkQ0Z6cfXEm
bc5s0RAAjA5ievyM6jRq4EdIbt4X9O1VoiOS7HqsP32JwfdMu1BjmhMf2TQdf794
TO/X0q3A5m2Ty2mxB2E9kuacy6cFBgcRaZRmquefOAuD3F+TjxJcxZMPIvYvJ17Z
HSeDxX82xBaxzxn1fPfwF8uIKD9EwWzaFFEpYlwcFFxeBKfjoQQPh/Q35Q9rAKHz
wSFiXO7APuF6kg87d7vh5ySUt2rmWin/G6xE3pkCAe9znWmlXogYBk69150eeaeY
xIxcJvaTiqbkVEJInzRS4er4+deBw8KBNkCP1sKxX3iskZy825Hfu7pS5s4ECfFs
eU04ADfVYpnkRSVMIV8dLVTgDLwmUT2YULkV3cmY63fzVCR3pMTx42GhxdbPfNTa
5oMvMFKF3w1lO2FENKOd30R830RDvTt38cnKHoGntJODN1MFoyOZoQ4VgMzcJsds
zH3JDyTv6Ixt30JaMEcQDGolvqnRv+2xAWLK+oymQ63mjKEbj9Opt44NHTq9WwJ0
dxSElm5B5LbWULsK8qxbvl5QKEyb11aOAGhlzZtCoUR3RmHCxx/NkzQuIwLXhylR
56GDVVC1Acjiq9xms6sVGZVz2y5Sz67OhWZNDMjVl9RUsstpQFY70Q1kuuaYRJ7u
QAVwhbDbWPCvpH4cK4XyFJPLGAcCv8K3grMJClKxSUb7PJb7ptc=
=pdCp
-----END PGP SIGNATURE-----

--35i7mqhbvr3swdzo--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
