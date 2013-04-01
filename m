From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] man2 : syscall.2 : add notes
Date: Mon, 1 Apr 2013 02:13:02 -0400
Message-ID: <201304010213.06056.vapier@gentoo.org>
References: <1364361092-5948-1-git-send-email-ch0.han@lge.com> <1364794429-20477-1-git-send-email-ch0.han@lge.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1553367.841vqry6zt";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364794429-20477-1-git-send-email-ch0.han-Hm3cg6mZ9cc@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Changhee Han <ch0.han-Hm3cg6mZ9cc@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gunho.lee-Hm3cg6mZ9cc@public.gmane.org
List-Id: linux-man@vger.kernel.org

--nextPart1553367.841vqry6zt
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday 01 April 2013 01:33:49 Changhee Han wrote:
> +Each architecture ABI has its own requirements on how system call
> arguments are passed to the kernel. +For system calls that have a glibc
> wrapper (i.g., most system calls) glibc handles the details of copy
> arguments to the right registers in a manner suitable for the
> architecture.

these lines need to be wrapped

"i.g." is incorrect ... you mean "i.e."

> +However, when using
> +.BR syscall ()
> +to make a system call,
> +the caller may need to handle architecture-dependent details.
> +For example, on ARM architecture, a
> +.I "long long"
> +argument is considered to be 8-byte aligned and to be split into two
> 4-byte arguments. +
> +.BR readahead ()
> +system call could be called like below in ARM architecture.

this has nothing to do with alignment.  syscalls pass args via registers, a=
nd=20
in the 32bit ARM port, registers are 32bits wide.  so in order to pass a 64=
bit=20
value, you have to manually split it up.
=2Dmike

--nextPart1553367.841vqry6zt
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRWSVxAAoJEEFjO5/oN/WBQAsQALUFaYwz9PNgx/R+96iQSGAx
V4TFtP/r1kB+JcGyYnR6oic2meh2EmX04nqjECpibb5LWF8m/SODr8oCK7o51enY
kp3tb/FJfJKe46nDOXWYHk6fY1BqVX1gkUgae1vEE+CL6D9qzbOmtSZeT97lrED4
wjIw83ceekXoyvQwi86/5t+3XfDCaWatR9kZw1YXNQr5zM5Al51jBPl/fJ7l0Fmk
+waknbC16q0v17ejIAFEu4JVSbl7KFibacdMHCLYHBnL207aaT8GSmZMuoOYzDHM
yyCr3qAC6yafdb5LmBx5gKBt79Y3/Di24vpRk8BSnOju++yPeDYeo/QBwNFxdWeq
aE20BXYkz1W3t4A7cYhY6Y8FAiL1E8HtSd20Jmc5qm8BRQWaJ7dercK53VY32uGt
vnRTu4zS5h6EUHypGL0Sg68JY0F55HRoTq2Twv9mv5eQys6/dXwNNjulqzpv8ma0
HqNXyQiG0ewFTHzuQwlaGuJtsVulSh2qq4UHeZzC8deuOZVmalNba9VIBpAa7A1o
jd8+cBJLUIi8XGIbEh0f4kxESCeTW02uXd5WKNPbPoBrQgqzG4miihpHsYXMfFvL
790UBIBXeFVkBBAqgwmjHO0/hVpTtiJdMDHTzo4dGJhIt1r7nN3wae5z0uSTfFF8
iUc5bgCZzoJElypvU8pR
=mg7/
-----END PGP SIGNATURE-----

--nextPart1553367.841vqry6zt--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
