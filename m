From: =?windows-1252?Q?David_Pr=E9vot?= <davidp-whniv8GeeGkdnm+yROfE0A@public.gmane.org>
Subject: Re: [patch] ip.7: Convention, order, and typo
Date: Fri, 22 Oct 2010 10:15:32 -0400
Message-ID: <i9s6a5$lic$1@dough.gmane.org>
References: <i9qub7$jge$1@dough.gmane.org> <i9qukb$jge$2@dough.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <i9qukb$jge$2@dough.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi

Le 21/10/2010 22:58, David Pr=E9vot a =E9crit :

> Please find inline a patch against current ip(7) manual page, in orde=
r
> to fix some issue spotted while reviewing it's translation.

Please find some more =93bold=93 issues spotted later (please let me kn=
ow if
you prefer various messages for this type of issues in the future,
instead of just one typo patch).


@@ -609,11 +597,13 @@ caused the error, which can be accessed with the
 macro.
 The
 .I sin_family
- -field of the SO_EE_OFFENDER address is
+field of the
+.B SO_EE_OFFENDER
+address is
 .B AF_UNSPEC
 when the source was unknown.
 When the error originated from the network, all IP options
- -.RI ( IP_OPTIONS ", " IP_TTL ", "
+.RB ( IP_OPTIONS ", " IP_TTL ", "
 etc.) enabled on the socket and contained in the
 error packet are passed as control messages.
 The payload of the packet causing the error is returned as normal payl=
oad.


Regards

David

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkzBnIMACgkQ18/WetbTC/q8KwCdGxXFKvfVi50Cfyq0ynuFLUrf
12cAn0ziNnze8W3FxXeyVUuX6gmA0nw9
=3DaTsu
-----END PGP SIGNATURE-----

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
